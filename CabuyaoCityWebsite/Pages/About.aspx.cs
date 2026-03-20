using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CabuyaoCityWebsite.Pages
{
    public partial class About : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBarangays();
                LoadDepartments();
            }
        }

        private void LoadBarangays()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Retrieves the ID for the query string, and the Name/Logo for the layout
                string query = "SELECT BarangayID, BarangayName, LogoFileName FROM Barangay ORDER BY BarangayName ASC";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);
                rptBarangays.DataSource = dt;
                rptBarangays.DataBind();
            }
        }

        private void LoadDepartments()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Ensure your Department table columns match these names
                string query = "SELECT DeptID, DepartmentName, LogoFileName FROM Department WHERE Category = 'Local' ORDER BY SubGroup ASC";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);
                rptDepartments.DataSource = dt;
                rptDepartments.DataBind();
            }
        }
    }
}