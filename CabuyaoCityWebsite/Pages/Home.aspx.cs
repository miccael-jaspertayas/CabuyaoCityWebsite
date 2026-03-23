using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CabuyaoCityWebsite
{
    public partial class Home : System.Web.UI.Page
    {
        protected string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRecentNews();
            }
        }

        // This method retrieves the three most recent news posts from the database and binds them to the Repeater control.
        private void BindRecentNews()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT TOP 3 PostID, Title, Content, ImageFileName FROM Post ORDER BY DateCreated DESC";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    try
                    {
                        conn.Open();
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
                            System.Diagnostics.Debug.WriteLine("DATABASE LINKED BUT EMPTY.");
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("SQL ERROR: " + ex.Message);
                        Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
                    }
                }
            }
        }
    }
}