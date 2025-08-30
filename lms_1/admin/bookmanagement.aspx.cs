using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;


namespace lms_1.admin
{
    public partial class bookmanagement : System.Web.UI.Page
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text.Trim();
            string author = TextBox2.Text.Trim();
            string category = TextBox3.Text.Trim();
            string countStr = TextBox4.Text.Trim();
            string lang_code = TextBox5.Text.Trim();
            string published_name = TextBox6.Text.Trim();
            string published_place = TextBox7.Text.Trim();
            string published_year = TextBox8.Text.Trim();
            if (!int.TryParse(countStr, out int count))
            {
                ShowError("Count must be a number.");
                return;
            }

            else if (HasDigits(name) )
            {
                ShowError("Book name must not contain digits.");
                return;
            }
            else if (HasDigits(author) )
            {
                ShowError("author name must not contain digits.");
                return;
            }
            else if ( HasDigits(published_name))
            {
                ShowError("Book Published Name  must not contain digits.");
                return;
            }
            else if (HasDigits(published_place))
            {
                ShowError("Book Published Place must not contain digits.");
                return;
            }

            try
            {
                con.Open();
                MySqlCommand checkCmd = new MySqlCommand("SELECT COUNT(*) FROM book_dtls WHERE book_name=@name", con);
                checkCmd.Parameters.AddWithValue("@name", name);
                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists > 0)
                {
                    ShowError("Book already exists.");
                    return;
                }

                MySqlCommand cmd = new MySqlCommand("INSERT INTO book_dtls (book_name, author_name, book_category, count,lang_code,published_name,published_place,published_year) VALUES (@name, @auth, @cat, @count,@code,@inst_name,@place,@year)", con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@auth", author);
                cmd.Parameters.AddWithValue("@cat", category);
                cmd.Parameters.AddWithValue("@count", count);
                cmd.Parameters.AddWithValue("@code", lang_code);
                cmd.Parameters.AddWithValue("@inst_name", published_name);
                cmd.Parameters.AddWithValue("@place", published_place);
                cmd.Parameters.AddWithValue("@year", published_year);

                cmd.ExecuteNonQuery();

                ShowSuccess("Book added successfully.");
                LoadGrid();
                ClearForm();
            }
            catch (Exception ex)
            {
                ShowError("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

                string fileExt = Path.GetExtension(FileUpload1.FileName);
                if (fileExt.ToLower() != ".xlsx")
                {
                    lblMessage.Text = "Please upload a valid .xlsx file.";
                    return;
                }

                try
                {
                    string filePath = Server.MapPath("~/Uploads/" + FileUpload1.FileName);
                    FileUpload1.SaveAs(filePath);

                    FileInfo fileInfo = new FileInfo(filePath);
                    using (ExcelPackage package = new ExcelPackage(fileInfo))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
                        int rowCount = worksheet.Dimension.Rows;

                        string connStr = "server=localhost;user id=root;password=Neet@2022;database=lms;";
                        using (MySqlConnection conn = new MySqlConnection(connStr))
                        {
                            conn.Open();
                            for (int row = 2; row <= rowCount; row++) // Assuming row 1 is header
                            {
                                string book_name = worksheet.Cells[row, 2].Text;
                                string author_name = worksheet.Cells[row, 3].Text;
                                string book_category = worksheet.Cells[row, 4].Text;
                                int count = int.TryParse(worksheet.Cells[row, 5].Text, out int c) ? c : 0;
                                string lang_code = worksheet.Cells[row, 6].Text;
                                string published_name = worksheet.Cells[row, 7].Text;
                                string published_place = worksheet.Cells[row, 8].Text;
                                string published_year = worksheet.Cells[row, 9].Text;

                                string query = @"INSERT INTO book_dtls 
                            (book_name, author_name, book_category, count, lang_code, published_name, published_place, published_year) 
                            VALUES (@book_name, @auth, @cat, @count, @lang, @pname, @pplace, @pyear)";

                                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                                {
                                    cmd.Parameters.AddWithValue("@book_name", book_name);
                                    cmd.Parameters.AddWithValue("@auth", author_name);
                                    cmd.Parameters.AddWithValue("@cat", book_category);
                                    cmd.Parameters.AddWithValue("@count", count);
                                    cmd.Parameters.AddWithValue("@lang", lang_code);
                                    cmd.Parameters.AddWithValue("@pname", published_name);
                                    cmd.Parameters.AddWithValue("@pplace", published_place);
                                    cmd.Parameters.AddWithValue("@pyear", published_year);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        lblMessage.Text = "Books imported successfully!";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Please select an Excel file to upload.";
            }
        }
        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";

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

        private void LoadGrid()
        {
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT * FROM book_dtls", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
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
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text.Trim();
            string author = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text.Trim();
            string category = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text.Trim();
            string countStr = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text.Trim();
            string lang_code = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text.Trim();
            string published_name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text.Trim();
            string published_place = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text.Trim();
            string published_year = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text.Trim();


            if (!int.TryParse(countStr, out int count))
            {
                ShowError("Count must be a number.");
                return;
            }
            else if (!int.TryParse(lang_code, out int count_1))
            {
                ShowError("Lang_code  must be a number.");
                return;
            }

            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE book_dtls SET book_name=@name, author_name=@auth, book_category=@cat, count=@count, lang_code=@code, published_name=@inst_name, published_place=@place, published_year=@year WHERE book_id=@id", con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@auth", author);
                cmd.Parameters.AddWithValue("@cat", category);
                cmd.Parameters.AddWithValue("@count", count);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@code", lang_code);
                cmd.Parameters.AddWithValue("@inst_name", published_name);
                cmd.Parameters.AddWithValue("@place", published_place);
                cmd.Parameters.AddWithValue("@year", published_year);

                cmd.ExecuteNonQuery();

                GridView1.EditIndex = -1;
                ShowSuccess("Book updated successfully.");
                LoadGrid();
            }
            catch (Exception ex)
            {
                ShowError("Error updating book: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("DELETE FROM book_dtls WHERE book_id=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();

                ShowSuccess("Book deleted successfully.");
                LoadGrid();
            }
            catch (Exception ex)
            {
                ShowError("Error deleting book: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
