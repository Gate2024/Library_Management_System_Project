//using MySql.Data.MySqlClient;
//using System;
//using System.Configuration;
//using System.Data;
//using System.Web.UI;

//namespace lms_1
//{
//    public partial class login : System.Web.UI.Page
//    {
//        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)

//            {
//                successAlert.Visible = false;
//                errorAlert.Visible = false;
//            }
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            try
//            {
//                DataSet ds = new DataSet();
//                con.Open();

//                MySqlCommand cmd = new MySqlCommand("SELECT * FROM login_dtls WHERE username=@username AND password=@password", con);
//                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
//                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

//                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
//                adapter.Fill(ds);
//                con.Close();

//                if (ds.Tables[0].Rows.Count > 0)
//                {
//                    successAlert.Visible = true;
//                    errorAlert.Visible = false;


//                    // Get user level
//                    string level = ds.Tables[0].Rows[0]["level"]?.ToString().ToLower() ?? "";

//                    // Optional: Store session variables
//                    Session["username"] = txtUsername.Text.Trim();
//                    Session["level"] = level;

//                    // Redirect based on role

//                    if (level == "admin")
//                    {
//                        Response.Redirect("~/admin/admindashboard.aspx");
//                    }
//                    else if (level == "student")
//                    {
//                        Response.Redirect("~/user/userdashboard.aspx");
//                    }
//                    else if (level == "superadmin")
//                    {
//                        Response.Redirect("~/SuperAdmin/admin.aspx");
//                    }
//                    else
//                    {
//                        successAlert.Visible = false;
//                        errorAlert.Visible = true;
//                        Response.Write("<script>alert('Invalid user level.');</script>");
//                    }
//                }
//                else
//                {
//                    successAlert.Visible = false;
//                    errorAlert.Visible = true;
//                }
//            }
//            catch (Exception ex)
//            {
//                con.Close();
//                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
//            }
//        }
//    }
//}

using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
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

                // 🔹 Auto-fill from cookies
                if (Request.Cookies["username"] != null)
                {
                    txtUsername.Text = Request.Cookies["username"].Value;
                }
                if (Request.Cookies["password"] != null)
                {
                    txtPassword.Attributes["value"] = Request.Cookies["password"].Value;
                }
                if (Request.Cookies["rememberme"] != null && Request.Cookies["rememberme"].Value == "true")
                {
                    chkRememberMe.Checked = true;
                }
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

                    // 🔹 Handle Remember Me
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["username"].Value = txtUsername.Text.Trim();
                        Response.Cookies["password"].Value = txtPassword.Text.Trim();  // ⚠️ Better to store hashed instead of plain text
                        Response.Cookies["rememberme"].Value = "true";

                        // Expiry (e.g., 7 days)
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(7);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(7);
                        Response.Cookies["rememberme"].Expires = DateTime.Now.AddDays(7);
                    }
                    else
                    {
                        // Clear cookies
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["rememberme"].Expires = DateTime.Now.AddDays(-1);
                    }

                    // Get user level
                    string level = ds.Tables[0].Rows[0]["level"]?.ToString().ToLower() ?? "";

                    // Store session variables
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

