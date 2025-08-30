using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1.SuperAdmin
{
    public partial class adminmanagement : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
                SuccessAlert.Visible = false;
                ErrorAlert.Visible = false;
            }
        }

        private void LoadUsers()
        {
            string level = ddlUserType.SelectedValue;
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM login_dtls WHERE level = @level", con);
            cmd.Parameters.AddWithValue("@level", level);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataKeyNames = new string[] { "email" }; // Use email as primary key
            GridView1.DataBind();
        }

        protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUsers();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadUsers();
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

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                ShowError("All fields are required.");
                return;
            }

            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO login_dtls (username, email, password, level) VALUES(@username, @email, @password, @level)", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@level", ddlLevel.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();

                ShowSuccess("User Added Successfully.");

                txtUsername.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";

                LoadUsers();
            }
            catch (Exception ex)
            {
                ShowError("Error: " + ex.Message);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadUsers();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string email = GridView1.DataKeys[e.RowIndex].Value.ToString();
                string username = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string password = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

                con.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE login_dtls SET username = @username, password = @password WHERE email = @Email", con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.EditIndex = -1;
                ShowSuccess("Record Updated Successfully.");
                LoadUsers();
            }
            catch (Exception ex)
            {
                ShowError("Update Error: " + ex.Message);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string email = GridView1.DataKeys[e.RowIndex].Value.ToString();
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("DELETE FROM login_dtls WHERE email = @Email", con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.ExecuteNonQuery();
                con.Close();

                ShowSuccess("User Deleted Successfully!");
                LoadUsers();
            }
            catch (Exception ex)
            {
                ShowError("Delete Error: " + ex.Message);
            }
        }
    }
}
