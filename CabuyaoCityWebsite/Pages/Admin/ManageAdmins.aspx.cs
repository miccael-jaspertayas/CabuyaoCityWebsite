using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class ManageAdmins : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            pnlGlobalAlert.Visible = false;

            if (!IsPostBack)
            {
                LoadAdmins();
            }
        }

        private void LoadAdmins()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT AdminID, Username FROM Admin ORDER BY Username";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptAdmins.DataSource = dt;
                rptAdmins.DataBind();
            }
        }

        // --- TRIGGER ADD MODAL ---
        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            hfAdminID.Value = "";
            txtUsername.Text = "";

            // In ASP.NET, setting TextMode="Password" automatically clears text on postback,
            // but we explicitly ensure attributes are clean.
            txtPassword.Attributes.Add("value", "");
            txtConfirmPassword.Attributes.Add("value", "");

            litModalTitle.Text = "Add New Admin";
            litPasswordLabel.Text = "Password";
            smPasswordHint.Visible = false; // Hide "leave blank" hint
            pnlModalAlert.Visible = false;

            ScriptManager.RegisterStartupScript(this, GetType(), "showAdminModal",
                "var adminModal = new bootstrap.Modal(document.getElementById('adminModal')); adminModal.show();", true);
        }

        // --- GRID ACTIONS (EDIT & DELETE) ---
        protected void rptAdmins_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string adminID = e.CommandArgument.ToString();

            if (e.CommandName == "EditAdmin")
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT Username FROM Admin WHERE AdminID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", adminID);

                    conn.Open();
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        hfAdminID.Value = adminID;
                        txtUsername.Text = r["Username"].ToString();

                        litModalTitle.Text = "Edit Admin";
                        litPasswordLabel.Text = "New Password";
                        smPasswordHint.Visible = true; // Show "leave blank" hint
                        pnlModalAlert.Visible = false;

                        ScriptManager.RegisterStartupScript(this, GetType(), "showAdminModal",
                            "var adminModal = new bootstrap.Modal(document.getElementById('adminModal')); adminModal.show();", true);
                    }
                }
            }
            else if (e.CommandName == "PromptDelete")
            {
                // Set the ID in the hidden field inside the Delete Modal
                hfDeleteAdminID.Value = adminID;

                // Hide global alert if it was showing from a previous action
                pnlGlobalAlert.Visible = false;

                // Show the custom delete modal
                ScriptManager.RegisterStartupScript(this, GetType(), "showDeleteModal",
                    "var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal')); deleteModal.show();", true);
            }
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            string adminID = hfDeleteAdminID.Value;

            if (!string.IsNullOrEmpty(adminID))
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Admin WHERE AdminID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", adminID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadAdmins();

                // Show Global Alert at the top
                pnlGlobalAlert.Visible = true;
                pnlGlobalAlert.CssClass = "alert alert-success alert-dismissible fade show";
                lblGlobalAlert.Text = "<strong><i class='bi bi-check-circle me-2'></i>Deleted!</strong> Account removed successfully.";

                // Close the delete modal via JS
                ScriptManager.RegisterStartupScript(this, GetType(), "hideDeleteModal",
                    "var deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteModal')); if(deleteModal) { deleteModal.hide(); }", true);
            }
        }

        // --- SAVE ADMIN (INSERT OR UPDATE) ---
        protected void btnSaveAdmin_Click(object sender, EventArgs e)
        {
            string adminID = hfAdminID.Value;
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text; // Do not trim passwords, spaces might be intentional
            string confirmPassword = txtConfirmPassword.Text;

            // 1. Basic Validation
            if (string.IsNullOrEmpty(username))
            {
                ShowModalAlert("Username cannot be empty.", "danger");
                return;
            }

            if (string.IsNullOrEmpty(adminID) && string.IsNullOrEmpty(password))
            {
                ShowModalAlert("A password is required for new accounts.", "danger");
                return;
            }

            if (password != confirmPassword)
            {
                ShowModalAlert("Passwords do not match.", "danger");
                return;
            }

            // 2. Check for Duplicate Username
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string checkQuery = "SELECT COUNT(*) FROM Admin WHERE Username = @User AND AdminID != @ID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@User", username);
                checkCmd.Parameters.AddWithValue("@ID", string.IsNullOrEmpty(adminID) ? "0" : adminID);

                conn.Open();
                int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    ShowModalAlert("This Username is already taken by another admin.", "danger");
                    return;
                }

                // 3. Execute Insert or Update
                string query;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (string.IsNullOrEmpty(adminID))
                {
                    // INSERT NEW ADMIN
                    query = "INSERT INTO Admin (Username, Password) VALUES (@User, @Pass)";
                    cmd.Parameters.AddWithValue("@User", username);
                    cmd.Parameters.AddWithValue("@Pass", password);
                }
                else
                {
                    // UPDATE EXISTING ADMIN
                    if (string.IsNullOrEmpty(password))
                    {
                        // Keep old password
                        query = "UPDATE Admin SET Username = @User WHERE AdminID = @ID";
                        cmd.Parameters.AddWithValue("@User", username);
                        cmd.Parameters.AddWithValue("@ID", adminID);
                    }
                    else
                    {
                        // Change password
                        query = "UPDATE Admin SET Username = @User, Password = @Pass WHERE AdminID = @ID";
                        cmd.Parameters.AddWithValue("@User", username);
                        cmd.Parameters.AddWithValue("@Pass", password);
                        cmd.Parameters.AddWithValue("@ID", adminID);
                    }
                }

                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
            }

            // If the admin changed their own username, update their session so they aren't logged out
            if (Session["AdminID"] != null && !string.IsNullOrEmpty(adminID))
            {
                if (adminID == Session["AdminID"].ToString())
                {
                    Session["AdminUser"] = username;
                }
            }

            // Success! Refresh grid, show alert, and keep modal open momentarily to see success state
            LoadAdmins();
            ShowModalAlert("Admin account saved successfully!", "success");
        }

        // --- HELPER FOR MODAL ALERTS ---
        private void ShowModalAlert(string message, string type)
        {
            pnlModalAlert.Visible = true;
            lblModalAlert.Text = message;

            if (type == "success")
            {
                pnlModalAlert.CssClass = "modal-alert modal-alert-success";
                iconModalAlert.Attributes["class"] = "bi bi-check-circle-fill fs-5 me-3";
            }
            else // danger
            {
                pnlModalAlert.CssClass = "modal-alert modal-alert-danger";
                iconModalAlert.Attributes["class"] = "bi bi-exclamation-triangle-fill fs-5 me-3";
            }
        }
    }
}