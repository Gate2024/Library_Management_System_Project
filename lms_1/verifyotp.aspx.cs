using System;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace lms_1
{
    public partial class verifyotp : Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void btnVerify_Click(object sender, EventArgs e)
        {

            string email = Session["otp_email"]?.ToString();
            string enterdOtp = txtOTP.Text.Trim();
            if (string.IsNullOrEmpty(enterdOtp))
            {
                lblStatus.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please enter a password in both fields.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblStatus.Visible = true;
                return;
            }
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * from otp_dtls where email = @email and otp_code = @otp and expires_at > NOW() and is_verified = 0 order by id desc limit 1 ", con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@otp", enterdOtp);
            MySqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                reader.Close();
                MySqlCommand cmd_1 = new MySqlCommand("update otp_dtls  set is_verified  = 1 where email = @email", con);
                cmd_1.Parameters.AddWithValue("@email", email);
                cmd_1.ExecuteNonQuery();

                lblStatus.Text = "<div class='alert alert-success alert-dismissible fade show'> OTP Verified SuccessFully!<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblStatus.Visible = true;
                Response.Redirect("resetpassword.aspx");
            }
            else
            {
                lblStatus.Text = "<div class='alert alert-success alert-dismissible fade show'> Invalid OTP or Seession expired !<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblStatus.Visible = true;

            }


        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotpassword.aspx"); // Change to your actual login page
        }

    }
}
