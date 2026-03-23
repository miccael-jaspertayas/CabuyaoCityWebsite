using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CabuyaoCityWebsite.Pages
{
    public partial class Post : System.Web.UI.Page
    {
        protected string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllPosts();
            }
        }

        // Load all posts from the database and bind to the Repeater
        private void LoadAllPosts()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT PostID, Title, Content, Category, ImageFileName, DateCreated FROM Post ORDER BY DateCreated DESC";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        rptAllNews.DataSource = dt;
                        rptAllNews.DataBind();
                    }
                    catch (Exception ex)
                    {
                        // Handle error
                    }
                }
            }
        }
    }
}