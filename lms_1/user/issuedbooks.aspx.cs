using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1.user
{
    public partial class issuedbooks : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Student_Information();
            }
        }
        private void Load_Student_Information()
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
                return;
            }

            string username = Session["username"].ToString();

            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(@"
                    SELECT i.Id AS issue_id,
       b.book_name,
       s.name AS student_name,
       i.issue_dt,
       i.return_dt,
       i.status,
       d.late_days,
       d.fine_per_day,
       d.total_fine
FROM issue_dtls i
JOIN book_dtls b ON i.book_id = b.book_id
JOIN student_dtls s ON i.student_id = s.student_id
LEFT JOIN due_dtls d ON i.Id = d.issue_id
ORDER BY i.issue_dt DESC;
", con);
                cmd.Parameters.AddWithValue("@username", username);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvIssuedBooks.DataSource = dt;
                    gvIssuedBooks.DataBind();
                    lblMessage.Text = "";
                }
                else
                {
                    gvIssuedBooks.DataSource = null;
                    gvIssuedBooks.DataBind();
                    lblMessage.Text = "No issued books found.";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }

        }
    }
}