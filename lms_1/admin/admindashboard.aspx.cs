using MySql.Data.MySqlClient;
using Mysqlx;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1.admin
{
    public partial class admindashboard : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_total_data();
                load_monthly_data();
            }
        }

        private void load_total_data()
        {
            try
            {
                con.Open();

                // Retrive Dat From the Student Details Table 
                MySqlCommand cmd1 = new MySqlCommand("select count(*) from student_dtls", con);
                totalstudents.Text = Convert.ToString(cmd1.ExecuteScalar());

                // Retrive Dat From The Book Details Table 
                MySqlCommand cmd2 = new MySqlCommand(" select Count(*) from book_dtls ", con);
                totalbooks.Text = Convert.ToString(cmd2.ExecuteScalar());

                // Retrive dat From The Issue Details Table  
                MySqlCommand Cmd3 = new MySqlCommand(" select Count(*) from issue_dtls ", con);
                totalissuedbooks.Text = Convert.ToString(Cmd3.ExecuteScalar());

                // Retrive Data From The Returned Table 
                MySqlCommand cmd4 = new MySqlCommand(" select Count(*) from return_dtls", con);
                totalreturnedbooks.Text = Convert.ToString(cmd4.ExecuteScalar());

            }
            catch (Exception ex)
            {
                lblMessage.Text = "<div class='alert alert-danger'>Error loading counts:" + ex.Message + "</div>";

            }
            finally
            {
                con.Close();
            }
        }
        private void load_monthly_data()
        {
            try
            {
                con.Open();
                string query = @"
                    SELECT 
                        MONTHNAME(issue_dt) AS MonthName,
                        COUNT(DISTINCT i.id) AS Issued,
                        COUNT(DISTINCT r.return_id) AS Returned
                    FROM 
                        issue_dtls i
                    LEFT JOIN 
                        return_dtls r ON i.id = r.issue_id
                    GROUP BY 
                        MONTH(issue_dt), MONTHNAME(issue_dt)
                    ORDER BY 
                        MONTH(issue_dt)
                ";
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                monthlydata.DataSource = dt;
                monthlydata.DataBind();

            }
            catch (Exception ex)
            {
                lblMessage.Text = "< div class='alert alert-danger'>Error loading counts: " + ex.Message + "</div>";
            }
            finally
            {
                con.Close();
            }
        }
    }
}