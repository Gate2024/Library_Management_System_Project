using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace lms_1
{
    public partial class registration : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();
            string level = ddlLevel.SelectedValue;
           


            errorAlert.Visible = false;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Please fill all required fields.";
                errorAlert.Visible = true;
                return;
            }

            try
            {
                con.Open();

                // Check if user exists
                MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM login_dtls WHERE username=@username OR email=@email", con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@email", email);

                int exists = Convert.ToInt32(cmd.ExecuteScalar());
                if (exists > 0)
                {
                    lblError.Text = "Username or Email already exists.";
                    errorAlert.Visible = true;
                    return;
                }

                // Insert new user
                MySqlCommand cmd1 = new MySqlCommand("INSERT INTO login_dtls (username, password, email, level) VALUES (@username, @password, @email, @level)", con);
                cmd1.Parameters.AddWithValue("@username", username);
                cmd1.Parameters.AddWithValue("@password", password);
                cmd1.Parameters.AddWithValue("@email", email);
                cmd1.Parameters.AddWithValue("@level", level);
                cmd1.ExecuteNonQuery();

                // Hide form & show success panel
                pnlRegistration.Visible = false;
                pnlSuccess.Visible = true;
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
                errorAlert.Visible = true;
                ddlLevel.SelectedIndex = 0;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
