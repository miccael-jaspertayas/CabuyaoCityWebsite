using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Redirect if already logged in
            if (Session["AdminUser"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            int adminID = GetAdminID(username);

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ShowAlert("Please enter both username and password.", "danger");
                return;
            }

            if (AuthenticateAdmin(username, password) && adminID != -1)
            {
                Session["AdminUser"] = username;
                Session["AdminID"] = adminID;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ShowAlert("Invalid username or password.", "danger");
            }
        }

        private int GetAdminID(string username)
        {
            int adminID = -1;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT AdminID FROM Admin WHERE Username = @User";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@User", username);
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    adminID = Convert.ToInt32(result);
                }
            }
            return adminID;
        }

        private bool AuthenticateAdmin(string user, string pass)
        {
            bool isValid = false;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM Admin WHERE Username = @User AND Password = @Pass";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@User", user);
                cmd.Parameters.AddWithValue("@Pass", pass);

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0) isValid = true;
            }
            return isValid;
        }

        private void ShowAlert(string message, string type)
        {
            pnlAlert.Visible = true;
            pnlAlert.CssClass = $"alert alert-{type} small py-2";
            lblAlertMessage.Text = message;
        }
    }
}