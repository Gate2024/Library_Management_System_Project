using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection((ConfigurationManager.ConnectionStrings["str"].ConnectionString));
        DataSet ds = new DataSet(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected  void btnSendOtp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string otp = new Random().Next(100000,999999).ToString();
            DateTime expiry = DateTime.Now.AddMinutes(10);

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please enter a email.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                lblMessage.Visible = true;
                return;
            }
            con.Open();
            MySqlCommand cmd = new MySqlCommand("insert into otp_dtls (email,otp_code,expires_at) values (@email,@otp,@expires)",con);
            cmd.Parameters.AddWithValue("@email",email);
            cmd.Parameters.AddWithValue("@otp", otp);
            cmd.Parameters.AddWithValue("@expires",expiry);
            cmd.ExecuteNonQuery();

            Session["otp_email"] = email;
            Response.Redirect("verifyotp.aspx");  // Redirection On Another Page 
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx"); // Change to your actual login page
        }

    }
}