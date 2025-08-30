using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace lms_1
{
    public partial class login : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                successAlert.Visible = false;
                errorAlert.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                con.Open();

                MySqlCommand cmd = new MySqlCommand("SELECT * FROM login_dtls WHERE username=@username AND password=@password", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
                con.Close();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    successAlert.Visible = true;
                    errorAlert.Visible = false;


                    // Get user level
                    string level = ds.Tables[0].Rows[0]["level"]?.ToString().ToLower() ?? "";

                    // Optional: Store session variables
                    Session["username"] = txtUsername.Text.Trim();
                    Session["level"] = level;

                    // Redirect based on role

                    if (level == "admin")
                    {
                        Response.Redirect("~/admin/admindashboard.aspx");
                    }
                    else if (level == "student")
                    {
                        Response.Redirect("~/user/userdashboard.aspx");
                    }
                    else if (level == "superadmin")
                    {
                        Response.Redirect("~/SuperAdmin/admin.aspx");
                    }
                    else
                    {
                        successAlert.Visible = false;
                        errorAlert.Visible = true;
                        Response.Write("<script>alert('Invalid user level.');</script>");
                    }
                }
                else
                {
                    successAlert.Visible = false;
                    errorAlert.Visible = true;
                }
            }
            catch (Exception ex)
            {
                con.Close();
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
