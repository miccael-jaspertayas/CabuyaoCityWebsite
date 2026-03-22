using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite.Pages.Admin
{
    public partial class ManageOfficials : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData(string searchTerm = "")
        {
            LoadCityOfficials(searchTerm);
            LoadBarangays(searchTerm);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            HideAlerts();
            LoadData(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            HideAlerts();
            txtSearch.Text = "";
            LoadData();
        }

        // --- DATA BINDING ---

        private void LoadCityOfficials(string search)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Official WHERE BarangayID IS NULL";
                if (!string.IsNullOrEmpty(search))
                {
                    query += " AND (FirstName LIKE @Search OR LastName LIKE @Search)";
                }
                query += " ORDER BY LastName, FirstName";

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(search)) cmd.Parameters.AddWithValue("@Search", "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCityOfficials.DataSource = dt;
                rptCityOfficials.DataBind();

                trNoCity.Visible = (dt.Rows.Count == 0);
            }
        }

        private void LoadBarangays(string search)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT DISTINCT b.BarangayID, b.BarangayName, b.Landline, b.MobileNumber 
                    FROM Barangay b
                    LEFT JOIN Official o ON b.BarangayID = o.BarangayID
                    WHERE (@Search = '') OR (b.BarangayName LIKE @Search OR o.FirstName LIKE @Search OR o.LastName LIKE @Search)
                    ORDER BY b.BarangayName";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Search", string.IsNullOrEmpty(search) ? "" : "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBarangays.DataSource = dt;
                rptBarangays.DataBind();

                divNoBarangays.Visible = (dt.Rows.Count == 0);
            }
        }

        protected void rptBarangays_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string brgyID = DataBinder.Eval(e.Item.DataItem, "BarangayID").ToString();
                Repeater rptBrgyOfficials = (Repeater)e.Item.FindControl("rptBrgyOfficials");
                string search = txtSearch.Text.Trim();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Official WHERE BarangayID = @BID";
                    if (!string.IsNullOrEmpty(search))
                    {
                        query += " AND (FirstName LIKE @Search OR LastName LIKE @Search)";
                    }
                    query += " ORDER BY LastName, FirstName";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@BID", brgyID);
                    if (!string.IsNullOrEmpty(search)) cmd.Parameters.AddWithValue("@Search", "%" + search + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptBrgyOfficials.DataSource = dt;
                    rptBrgyOfficials.DataBind();
                }
            }
        }

        // --- HELPER METHOD FOR IN-MODAL ALERTS ---
        private void ShowModalAlert(Panel pnl, Label lbl, HtmlGenericControl icon, string message, string type)
        {
            pnl.Visible = true;
            lbl.Text = message;

            if (type == "success")
            {
                pnl.CssClass = "modal-alert modal-alert-success";
                icon.Attributes["class"] = "bi bi-check-circle-fill fs-5 me-3";
            }
            else
            {
                pnl.CssClass = "modal-alert modal-alert-danger";
                icon.Attributes["class"] = "bi bi-exclamation-triangle-fill fs-5 me-3";
            }
        }

        private void HideAlerts()
        {
            pnlOfficialAlert.Visible = false;
            pnlBrgyAlert.Visible = false;
        }

        // --- EDIT TRIGGERS ---

        protected void rptOfficials_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditOfficial")
            {
                HideAlerts();
                string officialID = e.CommandArgument.ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Official WHERE OfficialID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", officialID);
                    conn.Open();
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        hfOfficialID.Value = r["OfficialID"].ToString();
                        lblOfficialName.Text = r["FirstName"].ToString() + " " + r["LastName"].ToString() + " " + r["Suffix"].ToString();
                        lblOfficialPosition.Text = r["Position"].ToString();

                        txtContactNumber.Text = r["ContactNumber"] != DBNull.Value ? r["ContactNumber"].ToString() : "";
                        txtEmail.Text = r["Email"] != DBNull.Value ? r["Email"].ToString() : "";

                        ScriptManager.RegisterStartupScript(this, GetType(), "openOffModal", "var modal = new bootstrap.Modal(document.getElementById('officialModal')); modal.show();", true);
                    }
                }
            }
        }

        protected void rptBarangays_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditBrgy")
            {
                HideAlerts();
                string brgyID = e.CommandArgument.ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Barangay WHERE BarangayID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", brgyID);
                    conn.Open();
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        hfBrgyID.Value = r["BarangayID"].ToString();
                        lblBrgyName.Text = "Brgy. " + r["BarangayName"].ToString();
                        txtBrgyLandline.Text = r["Landline"].ToString();
                        txtBrgyMobile.Text = r["MobileNumber"].ToString();

                        ScriptManager.RegisterStartupScript(this, GetType(), "openBrgyModal", "var modal = new bootstrap.Modal(document.getElementById('brgyModal')); modal.show();", true);
                    }
                }
            }
        }

        // --- SAVE ACTIONS WITH VALIDATION ---

        protected void btnSaveOfficial_Click(object sender, EventArgs e)
        {
            string contact = txtContactNumber.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(contact) || string.IsNullOrWhiteSpace(email))
            {
                ShowModalAlert(pnlOfficialAlert, lblOfficialAlertMessage, iconOfficialAlert, "Both Contact Number and Email are required.", "danger");
                return;
            }

            if (!Regex.IsMatch(contact, @"^[0-9\+\-\(\)\s]+$"))
            {
                ShowModalAlert(pnlOfficialAlert, lblOfficialAlertMessage, iconOfficialAlert, "Contact Number can only contain numbers and symbols (+, -, (, )).", "danger");
                return;
            }

            if (!Regex.IsMatch(email, @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"))
            {
                ShowModalAlert(pnlOfficialAlert, lblOfficialAlertMessage, iconOfficialAlert, "Please enter a valid email address.", "danger");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Official SET ContactNumber = @C, Email = @E WHERE OfficialID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@C", contact);
                    cmd.Parameters.AddWithValue("@E", email);
                    cmd.Parameters.AddWithValue("@ID", hfOfficialID.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadData(txtSearch.Text.Trim());
                ShowModalAlert(pnlOfficialAlert, lblOfficialAlertMessage, iconOfficialAlert, "Contact information updated successfully!", "success");
            }
            catch (Exception ex)
            {
                ShowModalAlert(pnlOfficialAlert, lblOfficialAlertMessage, iconOfficialAlert, "A database error occurred: " + ex.Message, "danger");
            }
        }

        protected void btnSaveBrgyInfo_Click(object sender, EventArgs e)
        {
            string landline = txtBrgyLandline.Text.Trim();
            string mobile = txtBrgyMobile.Text.Trim();

            if (string.IsNullOrWhiteSpace(landline) || string.IsNullOrWhiteSpace(mobile))
            {
                ShowModalAlert(pnlBrgyAlert, lblBrgyAlertMessage, iconBrgyAlert, "Both Landline and Mobile Number are required.", "danger");
                return;
            }

            if (!Regex.IsMatch(landline, @"^[0-9\+\-\(\)\s]+$") || !Regex.IsMatch(mobile, @"^[0-9\+\-\(\)\s]+$"))
            {
                ShowModalAlert(pnlBrgyAlert, lblBrgyAlertMessage, iconBrgyAlert, "Contact numbers can only contain numbers and symbols (+, -, (, )).", "danger");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Barangay SET Landline = @L, MobileNumber = @M WHERE BarangayID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@L", landline);
                    cmd.Parameters.AddWithValue("@M", mobile);
                    cmd.Parameters.AddWithValue("@ID", hfBrgyID.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadData(txtSearch.Text.Trim());
                ShowModalAlert(pnlBrgyAlert, lblBrgyAlertMessage, iconBrgyAlert, "Barangay info updated successfully!", "success");
            }
            catch (Exception ex)
            {
                ShowModalAlert(pnlBrgyAlert, lblBrgyAlertMessage, iconBrgyAlert, "A database error occurred: " + ex.Message, "danger");
            }
        }
    }
}