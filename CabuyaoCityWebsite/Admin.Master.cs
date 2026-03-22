using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            // Global Security Check: Run on Init to prevent page rendering if unauthorized
            if (Session["AdminUser"] == null || (int)Session["AdminID"] == -1)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}