using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CabuyaoCityWebsite.Pages
{
    public partial class Officials : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOfficials();
            }
        }

        private void BindOfficials()
        {
            string connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            DataTable dtOfficials = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Query all city officials
                string query = "SELECT * FROM Official WHERE OfficialType = 'City' ORDER BY OfficialID ASC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(dtOfficials);
            }

            if (dtOfficials.Rows.Count > 0)
            {

                DataView dvExec = new DataView(dtOfficials);
                dvExec.RowFilter = "Position = 'City Mayor' OR Position = 'City Vice-Mayor'";
                rptExecutive.DataSource = dvExec;
                rptExecutive.DataBind();


                DataView dvCouncil = new DataView(dtOfficials);
                dvCouncil.RowFilter = "Position = 'Sangguniang Panlungsod Member'";
                rptCouncilors.DataSource = dvCouncil;
                rptCouncilors.DataBind();
            }
        }

        // This method handles the placeholder image if the DB column is empty
        protected string GetImagePath(object imgFile)
        {
            string fileName = imgFile == DBNull.Value || string.IsNullOrEmpty(imgFile.ToString().Trim())
                              ? "official-placeholder.png"
                              : imgFile.ToString().Trim();


            return ResolveUrl("~/Images/Officials/City/" + fileName);
        }
    }
}