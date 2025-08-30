using System;
using System.Web.UI;

namespace lms_1
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear and abandon session
            Session.Clear();
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("~/login.aspx");
        }
    }
}
