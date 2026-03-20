using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        // Cache the local departments at the class level so we only hit the database once
        private DataTable dtLocalDepartments;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadBarangays();
            }
        }

        // -- LOAD DEPARTMENT TABLE --
        private void LoadDepartments()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 1. Load Local Departments (Dynamic Subgroups)
                SqlDataAdapter daLocal = new SqlDataAdapter("SELECT * FROM Department WHERE Category='Local' ORDER BY SubGroup, DepartmentName", conn);
                dtLocalDepartments = new DataTable();
                daLocal.Fill(dtLocalDepartments);

                // Use LINQ to get distinct SubGroups dynamically from the DataTable
                var subGroups = dtLocalDepartments.AsEnumerable()
                                      .Select(row => row.Field<string>("SubGroup"))
                                      .Distinct()
                                      .Select(sg => new { SubGroup = sg })
                                      .ToList();

                rptLocalGroups.DataSource = subGroups;
                rptLocalGroups.DataBind();

                // 2. Load National Agencies
                SqlDataAdapter daNational = new SqlDataAdapter("SELECT * FROM Department WHERE Category='National'", conn);
                DataTable dtNational = new DataTable();
                daNational.Fill(dtNational);
                rptNational.DataSource = dtNational;
                rptNational.DataBind();

                // 3. Load Schools
                SqlDataAdapter daSchool = new SqlDataAdapter("SELECT * FROM Department WHERE Category='School'", conn);
                DataTable dtSchool = new DataTable();
                daSchool.Fill(dtSchool);
                rptSchool.DataSource = dtSchool;
                rptSchool.DataBind();
            }
        }

        // -- BIND INNER REPEATER FOR LOCAL SUBGROUPS --
        protected void rptLocalGroups_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string subGroup = DataBinder.Eval(e.Item.DataItem, "SubGroup").ToString();

                // Filter the pre-loaded DataTable for the current subgroup
                DataView view = new DataView(dtLocalDepartments);
                view.RowFilter = $"SubGroup = '{subGroup.Replace("'", "''")}'";

                Repeater rptInner = (Repeater)e.Item.FindControl("rptLocalDepartments");
                rptInner.DataSource = view;
                rptInner.DataBind();
            }
        }

        // -- LOAD BARANGAY TABLE --
        private void LoadBarangays()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Barangay", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBarangay.DataSource = dt;
                rptBarangay.DataBind();
            }
        }

        // -- SUBMIT MESSAGE INTO MESSAGE TABLE --
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // LEADING/TRAILING WHITESPACE REMOVAL
            string name = txtYourName.Text.Trim();
            string email = txtYourEmail.Text.Trim();
            string phone = txtYourNumber.Text.Trim();
            string message = txtMessage.Text.Trim();

            // INPUT VALIDATION
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(message))
            {
                ShowAlert("All fields are required.", "danger");
                return;
            }

            // EMAIL VALIDATION
            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowAlert("Invalid email format.", "danger");
                return;
            }

            // PHONE VALIDATION
            if (!Regex.IsMatch(phone, @"^[0-9+\-\s]{7,15}$"))
            {
                ShowAlert("Invalid phone number.", "danger");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO [Message] (SenderName, SenderEmail, SenderPhoneNumber, MessageBody) 
                                 VALUES (@Name, @Email, @Phone, @Message)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Message", message);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear fields on success
            txtYourName.Text = "";
            txtYourEmail.Text = "";
            txtYourNumber.Text = "";
            txtMessage.Text = "";
            chkTerms.Checked = false; // Reset checkbox

            ShowAlert("Your message has been sent successfully!", "success");
        }

        // -- HELPER: SHOW MODERN ALERTS --
        private void ShowAlert(string message, string type)
        {
            pnlAlert.Visible = true;
            pnlAlert.CssClass = $"alert alert-{type} alert-dismissible fade show mt-3";
            lblAlertMessage.Text = message;
        }
    }
}