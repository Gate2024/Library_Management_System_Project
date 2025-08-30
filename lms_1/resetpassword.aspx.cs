using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Cmp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1
{
    public partial class resetpassword : System.Web.UI.Page
    {
        MySqlConnection con = new  MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = Session["otp_email"]?.ToString();
            string pass = TextBox1.Text.Trim();
            string confirm = TextBox2.Text.Trim();

            if (string.IsNullOrWhiteSpace(pass) || string.IsNullOrWhiteSpace(confirm))
            {
                lblReset.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please enter a password in both fields.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblReset.Visible = true;
                return;
            }

            if (pass != confirm)
            {
                lblReset.Text = "<div class='alert alert-danger alert-dismissible fade show'>Password Do Not Match!<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblReset.Visible = true;
                return;
            }

            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE login_dtls SET password = @pass WHERE email = @email", con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.ExecuteNonQuery();
                con.Close();
                // Hide form & show success panel
                pnlResetForm.Visible = false;
                pnlSuccess.Visible = true;
            }
            catch (Exception ex)
            {
                lblReset.Text = "<div class='alert alert-danger alert-dismissible fade show'>Error: " + ex.Message + "<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblReset.Visible = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("verifyotp.aspx"); // Change to your actual login page
        }

    }
}