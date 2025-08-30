using System;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace lms_1.admin
{
    public partial class studentmanagement : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
                SuccessAlert.Visible = false;
                ErrorAlert.Visible = false;
            }
        }

        private void LoadGrid()
        {
            using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM student_dtls", con))
            {
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mob = txtMobNo.Text.Trim();
            string status = txtStatus.Text.Trim();
            string course = ddlCourse.SelectedValue.Trim();
            string dept = txtDept.Text.Trim();
            string year = ddlYear.SelectedValue.Trim();
            string dob = txtDOB.Text.Trim();

            // Validation patterns
            Regex namePattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex mobPattern = new Regex(@"^\d{10}$");
            Regex emailPattern = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.IgnoreCase);
            Regex statusPattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex coursePattern = new Regex(@"^[a-zA-Z0-9\s]+$");
            Regex deptPattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex yearPattern = new Regex(@"^[a-zA-Z\s]+$");
            //Regex datePattern = new Regex(@"^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$");
            DateTime parsedDOB;

            // Validate all fields
            if (!namePattern.IsMatch(name))
            {
                ShowError("Name should only contain letters and spaces.");
                return;
            }
            if (!emailPattern.IsMatch(email))
            {
                ShowError("Invalid email format.");
                return;
            }
            if (!mobPattern.IsMatch(mob))
            {
                ShowError("Mobile number must be exactly 10 digits.");
                return;
            }
            if (!statusPattern.IsMatch(status))
            {
                ShowError("Status should only contain letters and spaces.");
                return;
            }
            if (!coursePattern.IsMatch(course))
            {
                ShowError("Course should only contain letters, numbers, and spaces.");
                return;
            }
            if (!deptPattern.IsMatch(dept))
            {
                ShowError("Department should only contain letters and spaces.");
                return;
            }
            if (!yearPattern.IsMatch(year))
            {
                ShowError("Year must be in YEAR format.");
                return;
            }
            if (!DateTime.TryParse(dob, out parsedDOB))
            {
                ShowError("Invalid Date of Birth. Use a valid date format.");
                return;
            }


            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(@"
    INSERT INTO student_dtls 
    (student_name, course_name, dept_name, student_year, student_email, student_mobno, student_DOB, student_status) 
    VALUES (@name, @course, @dept, @year, @email, @mob, @dob, @status)", con);


                cmd.Parameters.AddWithValue("@name", name);
cmd.Parameters.AddWithValue("@course", course);
cmd.Parameters.AddWithValue("@dept", dept);
cmd.Parameters.AddWithValue("@year", year);
cmd.Parameters.AddWithValue("@email", email);
cmd.Parameters.AddWithValue("@mob", mob);
cmd.Parameters.AddWithValue("@dob", dob);
cmd.Parameters.AddWithValue("@status", status);
                cmd.ExecuteNonQuery();
                con.Close();

                ShowSuccess("Student Added Successfully");
                LoadGrid();
                ClearForm();
            }
            catch (MySqlException ex)
            {
                ShowError("Error: " + ex.Message);
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            ddlCourse.Text = "";
            txtDept.Text = "";
            ddlYear.Text = "";
            txtEmail.Text = "";
            txtMobNo.Text = "";
            txtDOB.Text = "";
            txtStatus.Text = "";
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string name = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string course = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string dept = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string year = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string email = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string mob = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string dob = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();
            string status = ((TextBox)row.Cells[8].Controls[0]).Text.Trim();


            // Validation patterns
            Regex namePattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex mobPattern = new Regex(@"^\d{10}$");
            Regex emailPattern = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.IgnoreCase);
            Regex statusPattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex coursePattern = new Regex(@"^[a-zA-Z0-9\s]+$");
            Regex deptPattern = new Regex(@"^[a-zA-Z\s]+$");
            Regex yearPattern = new Regex(@"^[a-zA-Z\s]+$");
            //Regex datePattern = new Regex(@"^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$");
            DateTime parsedDOB;

            // Validate all fields
            if (!namePattern.IsMatch(name))
            {
                ShowError("Name should only contain letters and spaces.");
                return;
            }
            if (!emailPattern.IsMatch(email))
            {
                ShowError("Error! Please enter a valid email address.");
                return;
            }
            if (!mobPattern.IsMatch(mob))
            {
                ShowError("Mobile number must be exactly 10 digits.");
                return;
            }
            if (!statusPattern.IsMatch(status))
            {
                ShowError("Status should only contain letters and spaces.");
                return;
            }
            if (!coursePattern.IsMatch(course))
            {
                ShowError("Course should only contain letters, numbers, and spaces.");
                return;
            }
            if (!deptPattern.IsMatch(dept))
            {
                ShowError("Department should only contain letters and spaces.");
                return;
            }
            if (!yearPattern.IsMatch(year))
            {
                ShowError("Year must be in Year format.");
                return;
            }
            if (!DateTime.TryParse(dob, out parsedDOB))
            {
                ShowError("Invalid Date of Birth. Use a valid date format.");
                return;
            }


            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE student_dtls SET student_name=@name, course_name=@course, dept_name=@dept, student_year=@year, student_email=@email, student_mobno=@mob, student_DOB=@dob, student_status=@status WHERE student_id=@id", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@course", course);
            cmd.Parameters.AddWithValue("@dept", dept);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mob", mob);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@id", studentId);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            ShowSuccess("Record Updated Successfully...");
            LoadGrid();

            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("DELETE FROM student_dtls WHERE student_id=@id", con);
                cmd.Parameters.AddWithValue("@id", studentId);
                cmd.ExecuteNonQuery();

                LoadGrid();

                ShowSuccess("Record Deleted Successfully...");
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
            finally
            {
                con.Close();

            }
        }
    }
}
