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

        // This method accepts optional parameters for search and status filtering for more dynamic loading of messages based on user input.
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

        // This method is triggered when the admin clicks the "Filter" button, allowing them to filter messages based on search text and status.
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue);
        }

        // This method handles the commands from the Repeater, such as marking messages as read/replied or viewing details.
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

                if (badgeStatus.InnerText == "New")
                {
                    UpdateMessageStatus(messageId, "Read");
                    LoadMessages(txtSearch.Text.Trim(), ddlStatusFilter.SelectedValue);
                }

                ShowMessageDetails(messageId);
            }
        }

        // This method updates the status of a message in the database, which is used when marking messages as read or replied.
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

        // This method retrieves the details of a specific message and populates the modal fields to display the message information when the admin clicks "View".
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
                    litSenderName.Text = reader["SenderName"].ToString();
                    litSenderEmail.Text = reader["SenderEmail"].ToString();
                    litSenderPhone.Text = reader["SenderPhoneNumber"].ToString();
                    litMessageBody.Text = reader["MessageBody"].ToString();

                    DateTime dateReceived = Convert.ToDateTime(reader["DateReceived"]);
                    litDate.Text = dateReceived.ToString("MMMM dd, yyyy 'at' hh:mm tt");

                    string status = reader["Status"].ToString();
                    badgeStatus.InnerText = status;
                    badgeStatus.Attributes["class"] = "badge " + GetStatusBadgeClass(status);

                    linkEmail.HRef = "mailto:" + reader["SenderEmail"].ToString();
                    btnReplyEmail.HRef = "mailto:" + reader["SenderEmail"].ToString() + "?subject=RE: Cabuyao City Website Inquiry";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowViewModal",
                        "var viewModal = new bootstrap.Modal(document.getElementById('viewMessageModal')); viewModal.show();", true);
                }
            }
        }

        // This method returns the appropriate CSS class for the status badge based on the message status for visual differentiation of message statuses in the UI.
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