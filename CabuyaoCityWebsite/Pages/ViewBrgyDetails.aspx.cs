using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CabuyaoCityWebsite.Pages
{
    public partial class ViewBrgyDetails : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string brgyID = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(brgyID))
                {
                    LoadBarangayDetails(brgyID);
                    LoadOfficials(brgyID);
                }
                else
                {
                    Response.Redirect("About.aspx");
                }
            }
        }

        // Load barangay details and handle null or empty values gracefully.
        private void LoadBarangayDetails(string id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Barangay WHERE BarangayID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    litHeroBrgyName.Text = "Barangay " + reader["BarangayName"].ToString();

                    string landline = reader["Landline"].ToString();
                    lblLandline.Text = string.IsNullOrWhiteSpace(landline) ? "N/A" : landline;

                    string mobile = reader["MobileNumber"].ToString();
                    lblMobile.Text = string.IsNullOrWhiteSpace(mobile) ? "N/A" : mobile;

                    imgBrgyLogo.ImageUrl = "~/Images/About/Barangay/" + reader["LogoFileName"].ToString();
                }
            }
        }

        // Load officials and handle null or empty values directly in the SQL query for cleaner code.
        private void LoadOfficials(string id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        LTRIM(RTRIM(o.FirstName + ' ' + o.LastName + ' ' + ISNULL(o.Suffix, ''))) AS FullName,
                        o.Position,
                        ISNULL(NULLIF(o.ContactNumber, ''), 'N/A') AS ContactNumber,
                        ISNULL(NULLIF(o.Email, ''), 'N/A') AS Email,
                        b.LogoFileName
                    FROM Official o
                    INNER JOIN Barangay b ON o.BarangayID = b.BarangayID
                    WHERE o.BarangayID = @id 
                    ORDER BY o.OfficialType ASC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptOfficials.DataSource = dt;
                rptOfficials.DataBind();
            }
        }
    }
}