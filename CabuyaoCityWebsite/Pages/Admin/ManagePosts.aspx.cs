using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class ManagePosts : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPosts();
            }
        }

        // This method loads all posts from the database and binds them to the Repeater control.
        private void LoadPosts()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Post ORDER BY DateCreated DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptPosts.DataSource = dt;
                rptPosts.DataBind();

                phNoRecords.Visible = dt.Rows.Count == 0;
            }
        }

        // This method is triggered by the "Add New Post" button to prepare the form for a new entry
        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            // Clear form for new entry
            hfPostID.Value = "";
            hfExistingImage.Value = "";
            txtTitle.Text = "";
            txtContent.Text = "";
            ddlCategory.SelectedIndex = 0;

            litModalTitle.Text = "Create New Post";
            litImageNote.Text = "Upload a high-quality JPG or PNG.";

            OpenModal("postModal");
        }

        // This method handles commands from the Repeater, such as Edit and Delete actions for each post.
        protected void rptPosts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string postID = e.CommandArgument.ToString();

            if (e.CommandName == "EditPost")
            {
                LoadPostForEdit(postID);
            }
            else if (e.CommandName == "DeletePrompt")
            {
                // Load info into Delete hidden fields and show modal
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT ImageFileName FROM Post WHERE PostID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", postID);
                    conn.Open();
                    object result = cmd.ExecuteScalar();

                    hfDeletePostID.Value = postID;
                    hfDeleteImageName.Value = result != DBNull.Value ? result.ToString() : "";
                }
                OpenModal("deleteModal");
            }
        }

        // This method loads the details of a specific post into the form for editing when the Edit command is triggered.
        private void LoadPostForEdit(string postID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Post WHERE PostID = @ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", postID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfPostID.Value = reader["PostID"].ToString();
                    txtTitle.Text = reader["Title"].ToString();
                    txtContent.Text = reader["Content"].ToString();
                    ddlCategory.SelectedValue = reader["Category"].ToString();

                    // Store existing image so we don't overwrite with NULL if they don't upload a new one
                    hfExistingImage.Value = reader["ImageFileName"].ToString();

                    litModalTitle.Text = "Edit Post";
                    litImageNote.Text = "Leave file input empty to keep current image.";

                    OpenModal("postModal");
                }
            }
        }

        // This method handles the saving of a post, whether it's a new entry or an update to an existing one.
        protected void btnSavePost_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string content = txtContent.Text.Trim();
            string category = ddlCategory.SelectedValue;

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(content))
            {
                ShowAlert("Title and Content are required.", "danger");
                return;
            }

            string finalImageName = hfExistingImage.Value; // Default to existing

            // File Upload Logic
            if (fileUploadImage.HasFile)
            {
                string ext = Path.GetExtension(fileUploadImage.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                {
                    // Generate Unique GUID to prevent overwrites
                    finalImageName = Guid.NewGuid().ToString("N").Substring(0, 10) + "_" + fileUploadImage.FileName;
                    string savePath = Server.MapPath("~/Images/NewsAnnouncement/" + finalImageName);

                    // Delete old image if updating and replacing
                    if (!string.IsNullOrEmpty(hfExistingImage.Value))
                    {
                        string oldPath = Server.MapPath("~/Images/NewsAnnouncement/" + hfExistingImage.Value);
                        if (File.Exists(oldPath)) File.Delete(oldPath);
                    }

                    fileUploadImage.SaveAs(savePath);
                }
                else
                {
                    ShowAlert("Invalid file format. Only JPG and PNG are allowed.", "warning");
                    return;
                }
            }
            // Require image for NEW posts
            else if (string.IsNullOrEmpty(hfPostID.Value) && string.IsNullOrEmpty(finalImageName))
            {
                ShowAlert("A cover image is required for new posts.", "warning");
                return;
            }

            // Database Save
            using (SqlConnection conn = new SqlConnection(connStr))
            {   
                string query;
                if (string.IsNullOrEmpty(hfPostID.Value))
                {
                    // INSERT
                    query = @"INSERT INTO Post (AdminID, Title, Category, Content, DateCreated, ImageFileName) 
                              VALUES (@AdminID, @Title, @Category, @Content, GETDATE(), @Image)";
                }
                else
                {
                    // UPDATE
                    query = @"UPDATE Post SET Title=@Title, Category=@Category, Content=@Content, 
                              ImageFileName=@Image, VersionTag = VersionTag + 1 WHERE PostID=@ID";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Content", content);
                cmd.Parameters.AddWithValue("@Image", finalImageName);

                if (string.IsNullOrEmpty(hfPostID.Value))
                {
                    int adminID = Session["AdminID"] != null ? Convert.ToInt32(Session["AdminID"]) : 1;
                    cmd.Parameters.AddWithValue("@AdminID", adminID);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ID", hfPostID.Value);
                }

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadPosts();
            ShowAlert("Post saved successfully!", "success");

            // Auto-hide the modal after saving using JS
            ScriptManager.RegisterStartupScript(this, this.GetType(), "HideModal",
                "var myModalEl = document.getElementById('postModal'); var modal = bootstrap.Modal.getInstance(myModalEl); modal.hide();", true);
        }

        // This method handles the confirmation of post deletion, removing both the database record and the associated image file from the server.
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            string postID = hfDeletePostID.Value;
            string imageName = hfDeleteImageName.Value;

            if (!string.IsNullOrEmpty(postID))
            {
                if (!string.IsNullOrEmpty(imageName))
                {
                    string path = Server.MapPath("~/Images/NewsAnnouncement/" + imageName);
                    if (File.Exists(path)) File.Delete(path);
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Post WHERE PostID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", postID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadPosts();
                ShowAlert("Post deleted successfully.", "success");
            }
        }

        // This method open a Bootstrap modal by injecting JavaScript into the page.
        private void OpenModal(string modalId)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopModal",
                $"var myModal = new bootstrap.Modal(document.getElementById('{modalId}')); myModal.show();", true);
        }

        // This method displays an alert message on the page with a specified type.
        private void ShowAlert(string message, string type)
        {
            pnlAlert.Visible = true;
            pnlAlert.CssClass = $"alert alert-{type} alert-dismissible fade show mt-3";
            lblAlertMessage.Text = message;
        }
    }
}