using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void LoadMessages(string search = "", string status = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT MessageID, SenderName, SenderEmail, SenderPhoneNumber, MessageBody, DateReceived, Status 
                                 FROM [Message] 
                                 WHERE (SenderName LIKE @Search OR SenderEmail LIKE @Search)";

                if (!string.IsNullOrEmpty(status))
                {
                    query += " AND Status = @Status";
                }

                query += " ORDER BY DateReceived DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Search", "%" + search + "%");

                if (!string.IsNullOrEmpty(status))
                    cmd.Parameters.AddWithValue("@Status", status);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptMessages.DataSource = dt;
                rptMessages.DataBind();

                // Show "No Records" placeholder if empty
                phNoRecords.Visible = dt.Rows.Count == 0;
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue);
        }

        // UPDATED: Now handles MarkRead, MarkReplied, AND ViewMessage
        protected void rptMessages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string messageId = e.CommandArgument.ToString();

            if (e.CommandName == "MarkRead")
            {
                UpdateMessageStatus(messageId, "Read");
                LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue);
            }
            else if (e.CommandName == "MarkReplied")
            {
                UpdateMessageStatus(messageId, "Replied");
                LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue);
            }
            else if (e.CommandName == "ViewMessage")
            {
                // 1. Mark as read automatically when they open it
                if (badgeStatus.InnerText == "New")
                {
                    UpdateMessageStatus(messageId, "Read");
                    LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue); // Refresh grid
                }

                // 2. Fetch and show the full message
                ShowMessageDetails(messageId);
            }
        }

        private void UpdateMessageStatus(string id, string status)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE [Message] SET Status = @Status WHERE MessageID = @ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@ID", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // NEW METHOD: Fetches the specific message and triggers the modal
        private void ShowMessageDetails(string id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM [Message] WHERE MessageID = @ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Populate the modal fields matching the ASP Literal IDs
                    litSenderName.Text = reader["SenderName"].ToString();
                    litSenderEmail.Text = reader["SenderEmail"].ToString();
                    litSenderPhone.Text = reader["SenderPhoneNumber"].ToString();
                    litMessageBody.Text = reader["MessageBody"].ToString();

                    DateTime dateReceived = Convert.ToDateTime(reader["DateReceived"]);
                    litDate.Text = dateReceived.ToString("MMMM dd, yyyy 'at' hh:mm tt");

                    string status = reader["Status"].ToString();
                    badgeStatus.InnerText = status;
                    badgeStatus.Attributes["class"] = "badge " + GetStatusBadgeClass(status);

                    // Set up the email "Reply" button to automatically open the admin's mail client
                    linkEmail.HRef = "mailto:" + reader["SenderEmail"].ToString();
                    btnReplyEmail.HRef = "mailto:" + reader["SenderEmail"].ToString() + "?subject=RE: Cabuyao City Website Inquiry";

                    // Inject JavaScript to pop open the Bootstrap modal via postback
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowViewModal",
                        "var viewModal = new bootstrap.Modal(document.getElementById('viewMessageModal')); viewModal.show();", true);
                }
            }
        }

        // UPDATED: Matches the new CSS classes created in Dashboard.css
        protected string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "New": return "badge-new";
                case "Read": return "badge-read";
                case "Replied": return "badge-replied";
                default: return "bg-secondary";
            }
        }
    }
}