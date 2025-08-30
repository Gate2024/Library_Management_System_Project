using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace lms_1
{
    public partial class contact : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SuccessAlert.Visible = false;
                ErrorAlert.Visible = false;
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string full_name = txtFullName.Text.Trim();
            string phone_no = txtPhoneNo.Text.Trim();
            string email_id = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(full_name) || string.IsNullOrEmpty(phone_no) ||
            string.IsNullOrEmpty(email_id) || string.IsNullOrEmpty(message))
            {
                ShowError("All fields marked with * are required.");
                return;
            }
             else if (HasDigits(full_name))
            {
                ShowError("Full name must not contain digits.");
                return;
            }
            else if (!HasDigits(phone_no))
            {
                ShowError("Phone No must contain digits only.");
                return;
            }


            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO contact_dtls (full_name, phone_no, email_id, subject, message) VALUES (@full_name, @phone_no, @email_id, @subject, @message)", con);
                cmd.Parameters.AddWithValue("@full_name", full_name);
                cmd.Parameters.AddWithValue("@phone_no", phone_no);
                cmd.Parameters.AddWithValue("@email_id", email_id);
                cmd.Parameters.AddWithValue("@subject", subject);
                cmd.Parameters.AddWithValue("@message", message);
                cmd.ExecuteNonQuery();

                ShowSuccess("Thank you! We’ve received your message and will contact you shortly.");
                ClearForm();
            }
            catch (Exception ex)
            {
                ShowError("An error occurred while submitting your message. " + ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private void ClearForm()
        {
            txtFullName.Text = "";
            txtPhoneNo.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        private bool HasDigits(string input)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(input, "\\d");
        }

        private void ShowError(string msg)
        {
            lblErrorMsg.Text = msg;
            ErrorAlert.Visible = true;
            SuccessAlert.Visible = false;
        }

        private void ShowSuccess(string msg = "")
        {
            lblSuccessMsg.Text = msg;
            ErrorAlert.Visible = false;
            SuccessAlert.Visible = true;
        }
    }
}
