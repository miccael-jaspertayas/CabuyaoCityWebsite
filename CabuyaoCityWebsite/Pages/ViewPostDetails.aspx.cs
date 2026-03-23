using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CabuyaoCityWebsite.Pages
{
    public partial class ViewPostDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string postId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(postId))
                {
                    FetchPostDetails(postId);
                }
                else
                {
                    pnlError.Visible = true;
                }
            }
        }

        // Fetches post details from the database based on the provided post ID
        private void FetchPostDetails(string id)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT PostID, Title, Category, Content, ImageFileName, DateCreated FROM Post WHERE PostID = @PostID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PostID", id);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptPostDetails.DataSource = dt;
                    rptPostDetails.DataBind();
                }
                else
                {
                    pnlError.Visible = true;
                }
            }
        }
    }
}