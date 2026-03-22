using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CabuyaoCityWebsite
{
    public partial class Home : System.Web.UI.Page
    {
        // Using your specific connection string name from Web.config
        protected string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRecentNews();
            }
        }

        private void BindRecentNews()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT TOP 3 PostID, Title, Content, ImageFileName FROM Post ORDER BY DateCreated DESC";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    try
                    {
                        conn.Open(); // Explicitly open
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            rptNews.DataSource = dt;
                            rptNews.DataBind();
                        }
                        else
                        {
                            // If this runs, your SQL query returned 0 rows. 
                            // Check if your database table "Post" actually has data.
                            System.Diagnostics.Debug.WriteLine("DATABASE LINKED BUT EMPTY.");
                        }
                    }
                    catch (Exception ex)
                    {
                        // This will catch connection string errors or SQL syntax errors
                        System.Diagnostics.Debug.WriteLine("SQL ERROR: " + ex.Message);
                        // Temporary: show error on page to see it immediately
                        Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
                    }
                }
            }
        }
    }
}