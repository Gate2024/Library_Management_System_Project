// Updated book_issue.aspx.cs
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms_1.admin
{
    public partial class book_issue : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadBookList();
                LoadStudentList();
                LoadIssueGrid();
            }
        }

        private void LoadBookList()
        {
            using (MySqlCommand cmd = new MySqlCommand("SELECT book_id, book_name FROM book_dtls", con))
            {
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddl_book_name.DataSource = dt;
                ddl_book_name.DataTextField = "book_name";
                ddl_book_name.DataValueField = "book_id";
                ddl_book_name.DataBind();
                ddl_book_name.Items.Insert(0, new ListItem("---Select Book---", "0"));
            }
        }

        private void LoadStudentList()
        {
            using (MySqlCommand cmd = new MySqlCommand("SELECT student_id, student_name FROM student_dtls", con))
            {
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddl_student_name.DataSource = dt;
                ddl_student_name.DataTextField = "student_name";
                ddl_student_name.DataValueField = "student_id";
                ddl_student_name.DataBind();
                ddl_student_name.Items.Insert(0, new ListItem("---Select Student---", "0"));
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(ddl_book_name.SelectedValue);
            int studentId = Convert.ToInt32(ddl_student_name.SelectedValue);
            if (bookId == 0 || studentId == 0)
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Select both book and student.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                return;
            }
             if (string.IsNullOrWhiteSpace(txtIssueDate.Text))
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please select issue date.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                return;
            }


            DateTime issueDate = DateTime.Parse(txtIssueDate.Text);
            DateTime returnDate = issueDate.AddDays(7);
            string status = "Issued";

                try
            {
                con.Open();

                string querryToAvoidRedundancy = " select count(*)  from issue_dtls where book_id = @bookId and student_id =@studentId and status = 'issued'";
                MySqlCommand cmd_Redundacy = new MySqlCommand(querryToAvoidRedundancy, con);
                cmd_Redundacy.Parameters.AddWithValue("@bookId", bookId);
                cmd_Redundacy.Parameters.AddWithValue("@studentId", studentId);
                int count = Convert.ToInt32(cmd_Redundacy.ExecuteScalar());

                if (count > 0)
                {
                    lblMessage.Text = "<div class='alert alert-warning alert-dismissible fade show'>This book is already issued to the selected student and not yet returned.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                    return;
                }

                MySqlCommand cmd = new MySqlCommand("INSERT INTO issue_dtls (book_id, student_id, issue_dt, return_dt, status) VALUES (@bookId, @studentId, @issueDt, @returnDt, @status)", con);
                cmd.Parameters.AddWithValue("@bookId", bookId);
                cmd.Parameters.AddWithValue("@studentId", studentId);
                cmd.Parameters.AddWithValue("@issueDt", issueDate);
                cmd.Parameters.AddWithValue("@returnDt", returnDate);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = @"<div class='alert alert-success alert-dismissible fade show'>Book issued successfully.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                LoadIssueGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<div class='alert alert-danger'>Error: " + ex.Message + "</div>";
            }
        }

        private void LoadIssueGrid()
        {
            string query = @"
                SELECT i.Id, s.student_name, b.book_name, i.issue_dt, i.return_dt, i.status 
                FROM issue_dtls i 
                JOIN book_dtls b ON i.book_id = b.book_id 
                JOIN student_dtls s ON i.student_id = s.student_id";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStudent.DataSource = dt;
                gvStudent.DataBind();
            }
        }
    }
}
   