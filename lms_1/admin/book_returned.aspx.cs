using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Web.UI.WebControls;

namespace lms_1.admin
{
    public partial class book_returned : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadIssuedBooks();
                LoadReturnGrid();
            }
        }

        private void LoadIssuedBooks()
        {
            string query = @"SELECT i.Id, CONCAT(b.book_name, ' - ', s.student_name) AS IssueDetails
                            FROM issue_dtls i
                            INNER JOIN book_dtls b ON i.book_id = b.book_id
                            INNER JOIN student_dtls s ON i.student_id = s.student_id
                            WHERE i.status = 'Issued'";

            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlIssuedBooks.DataSource = dt;
            ddlIssuedBooks.DataTextField = "IssueDetails";
            ddlIssuedBooks.DataValueField = "Id";
            ddlIssuedBooks.DataBind();
            ddlIssuedBooks.Items.Insert(0, new ListItem("-- Select Issued Book --", "0"));
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            int issueId = Convert.ToInt32(ddlIssuedBooks.SelectedValue);
            if (issueId == 0)
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please select an issued book.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                return;
            }
            else if  ( string.IsNullOrWhiteSpace(txtReturnDate.Text))
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Please select return date.<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
                return;
            }

            try
            {
                DateTime returnDate = DateTime.ParseExact(txtReturnDate.Text.Trim(), "yyyy-MM-dd", null);
                string remarks = txtRemarks.Text.Trim();

                con.Open();


                string getIssueDateQuery = "SELECT issue_dt FROM issue_dtls WHERE Id = @issueId";
                MySqlCommand cmdGet = new MySqlCommand(getIssueDateQuery, con);
                cmdGet.Parameters.AddWithValue("@issueId", issueId);
                DateTime issueDate = Convert.ToDateTime(cmdGet.ExecuteScalar());


                DateTime expectedReturnDate = issueDate.AddDays(7);

                int calculateLateDays = (returnDate - expectedReturnDate).Days;
                if (calculateLateDays < 0) calculateLateDays = 0;
                                                    //calculate The Fine As Per Day 
                double fineAmount =  10;
                double totalFineAmount = calculateLateDays * fineAmount ;

                
                // Insert into return_dtls
                string insertQuery = "INSERT INTO return_dtls (issue_id, return_date, remarks) VALUES (@issue_id, @return_date, @remarks)";
                MySqlCommand cmd = new MySqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@issue_id", issueId);
                cmd.Parameters.AddWithValue("@return_date", returnDate);
                cmd.Parameters.AddWithValue("@remarks", remarks);
                cmd.ExecuteNonQuery();

                // Update issue_dtls
                string updateQuery = "UPDATE issue_dtls SET status = 'Returned', return_dt = @return_date WHERE Id = @issueId";
                MySqlCommand cmd2 = new MySqlCommand(updateQuery, con);
                cmd2.Parameters.AddWithValue("@return_date", returnDate);
                cmd2.Parameters.AddWithValue("@issueId", issueId);
                cmd2.ExecuteNonQuery();


                if (calculateLateDays > 0)
                {
                    MySqlCommand cmd_fine = new MySqlCommand("insert Into due_dtls (issue_id, late_days, fine_per_day, total_fine, calculated_on)  values (@issue_id , @calculateLateDays ,  @fineAmount , @totalFineAmount,@calculated_on)", con);
                    cmd_fine.Parameters.AddWithValue("@issue_id", issueId);
                    cmd_fine.Parameters.AddWithValue("@calculateLateDays", calculateLateDays);
                    cmd_fine.Parameters.AddWithValue("@fineAmount", fineAmount);
                    cmd_fine.Parameters.AddWithValue("@totalFineAmount", totalFineAmount);
                    cmd_fine.Parameters.AddWithValue("@calculated_on", returnDate); 

                    cmd_fine.ExecuteNonQuery(); 

                }
                con.Close();

                string due_msg = calculateLateDays > 0
            ? $"Too Late!... by {calculateLateDays} days. Fine Applicable ."
            : "Returned on time.";


                lblMessage.Text = $@"<div class='alert alert-success alert-dismissible fade show'>
                                        Book returned successfully. {due_msg}
                                        <button type='button' class='btn-close' data-bs-dismiss='alert'></button>
                                     </div>";
                lblMessage.Visible = true;

                LoadIssuedBooks();
                LoadReturnGrid();
                txtRemarks.Text = string.Empty;
                txtReturnDate.Text = string.Empty;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<div class='alert alert-danger alert-dismissible fade show'>Error: " + ex.ToString() + "<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
            }

        }

        private void LoadReturnGrid()
        {
            string query = @"SELECT r.return_id, CONCAT(b.book_name, ' - ', s.student_name) AS IssueDetails,
                            r.return_date, r.remarks
                            FROM return_dtls r
                            INNER JOIN issue_dtls i ON r.issue_id = i.Id
                            INNER JOIN book_dtls b ON i.book_id = b.book_id
                            INNER JOIN student_dtls s ON i.student_id = s.student_id
                            ORDER BY r.return_date DESC";

            MySqlDataAdapter da = new MySqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvReturned.DataSource = dt;
            gvReturned.DataBind();
        }
    }
}
