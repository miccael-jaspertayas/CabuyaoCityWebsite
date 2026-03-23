using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class ManageDepartments : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Default to Local on first load
                LoadDepartments("Local", "");
            }
        }

        // This method handles the click event for all three tabs (Local, National, School) using CommandArgument to identify which tab was clicked.
        protected void Tab_Click(object sender, EventArgs e)
        {
            LinkButton clickedTab = (LinkButton)sender;
            string category = clickedTab.CommandArgument;

            tabLocal.CssClass = category == "Local" ? "nav-link active" : "nav-link";
            tabNational.CssClass = category == "National" ? "nav-link active" : "nav-link";
            tabSchool.CssClass = category == "School" ? "nav-link active" : "nav-link";

            hfActiveCategory.Value = category;
            txtSearch.Text = "";

            LoadDepartments(category, "");
        }

        // This method is triggered when the text in the search box changes. It reloads the departments based on the current active category and the search term.
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadDepartments(hfActiveCategory.Value, txtSearch.Text.Trim());
        }

        // This method loads the departments from the database based on the selected category and optional search term.
        private void LoadDepartments(string category, string search)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT DeptID, DepartmentName, Category, SubGroup, Landline, MobileNumber FROM Department WHERE Category = @Category";

                if (!string.IsNullOrEmpty(search))
                {
                    query += " AND DepartmentName LIKE @Search";
                }
                query += " ORDER BY SubGroup, DepartmentName";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);

                if (!string.IsNullOrEmpty(search))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptDepartments.DataSource = dt;
                rptDepartments.DataBind();

                phNoRecords.Visible = dt.Rows.Count == 0;
            }
        }

        // This method loads the department details into the modal for editing.
        protected void rptDepartments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditContact")
            {
                string deptID = e.CommandArgument.ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT DepartmentName, SubGroup, Landline, MobileNumber FROM Department WHERE DeptID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", deptID);

                    conn.Open();
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        hfEditDeptID.Value = deptID;

                        litDeptName.Text = r["DepartmentName"].ToString();
                        string subGroup = r["SubGroup"].ToString();
                        litSubGroup.Text = string.IsNullOrEmpty(subGroup) ? hfActiveCategory.Value + " Category" : subGroup;

                        txtLandline.Text = r["Landline"].ToString();
                        txtMobile.Text = r["MobileNumber"].ToString();

                        ScriptManager.RegisterStartupScript(this, GetType(), "showDeptModal",
                            "var editModal = new bootstrap.Modal(document.getElementById('editDeptModal')); editModal.show();", true);
                    }
                }
            }
        }

        // This method validates the input and updates the database if valid.
        protected void btnSaveContact_Click(object sender, EventArgs e)
        {
            string deptID = hfEditDeptID.Value;
            if (string.IsNullOrEmpty(deptID)) return;

            string landline = txtLandline.Text.Trim();
            string mobile = txtMobile.Text.Trim();

            string phonePattern = @"^[0-9+\-\(\)\slocLOC.]*$";

            if (!string.IsNullOrEmpty(landline) && !Regex.IsMatch(landline, phonePattern))
            {
                ShowModalAlert("Landline contains invalid characters. Only numbers and symbols (), -, +, LOC. are allowed.", "danger");
                return; 
            }

            if (!string.IsNullOrEmpty(mobile) && !Regex.IsMatch(mobile, phonePattern))
            {
                ShowModalAlert("Mobile Number contains invalid characters.", "danger");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Department SET Landline = @Landline, MobileNumber = @Mobile WHERE DeptID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Landline", txtLandline.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@ID", deptID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Hide the error alert if it was previously showing
                pnlModalAlert.Visible = false;

                // Refresh the grid
                LoadDepartments(hfActiveCategory.Value, txtSearch.Text.Trim());

                ShowModalAlert("Contact information updated successfully.", "success");
            }
            catch (Exception ex)
            {
                ShowModalAlert("An error occurred while saving. Please try again.", "danger");
            }
        }

        // This method returns the appropriate icon class based on the active category, which is used in the repeater to display the correct icon for each department.
        protected string GetCategoryIcon()
        {
            switch (hfActiveCategory.Value)
            {
                case "National": return "bi bi-bank";
                case "School": return "bi bi-mortarboard";
                default: return "bi bi-building";
            }
        }

        // This method sets the appropriate CSS classes and icons based on the type of alert.
        private void ShowModalAlert(string message, string type)
        {
            pnlModalAlert.Visible = true;
            lblModalAlert.Text = message;

            if (type == "success")
            {
                pnlModalAlert.CssClass = "modal-alert modal-alert-success";
                iconModalAlert.Attributes["class"] = "bi bi-check-circle-fill fs-5 me-3";
            }
            else
            {
                pnlModalAlert.CssClass = "modal-alert modal-alert-danger";
                iconModalAlert.Attributes["class"] = "bi bi-exclamation-triangle-fill fs-5 me-3";
            }
        }
    }
}