using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace lms_1
{
    public partial class bookcollection : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        int pageSize = 9; // Books per page
        int currentPage
        {
            get
            {
                object page = ViewState["CurrentPage"];
                return page == null ? 1 : (int)page;
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadBooks(); // Load all books by default
            }
        }

        private void LoadCategories()
        {
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT DISTINCT book_category FROM book_dtls", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
            finally
            {
                con.Close();
            }
        }

        private void LoadBooks(string category = "")
        {
            try
            {
                con.Open();
                string query = string.IsNullOrEmpty(category)
                    ? "SELECT book_name, author_name, book_category,lang_code, count FROM book_dtls"
                    : "SELECT book_name, author_name, book_category, lang_code, count FROM book_dtls WHERE book_category = @category";

                MySqlCommand cmd = new MySqlCommand(query, con);
                if (!string.IsNullOrEmpty(category))
                    cmd.Parameters.AddWithValue("@category", category);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Pagination
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = pageSize;
                pds.CurrentPageIndex = currentPage - 1;

                btnPrevious.Enabled = !pds.IsFirstPage;
                btnNext.Enabled = !pds.IsLastPage;

                book_list.Text = $"Page {currentPage} of {pds.PageCount}";

                rptBooks.DataSource = pds;
                rptBooks.DataBind();
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            LoadBooks(); // or LoadBooks(selectedCategory)
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            currentPage--;
            LoadBooks(); // or LoadBooks(selectedCategory)
        }

        protected void CategorySelected(object sender, CommandEventArgs e)
        {
            string category = e.CommandArgument.ToString();
            LoadBooks(category);
        }
        protected void btnSearch_Click ( object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim(); // Get search text
            string query;
            if (string.IsNullOrWhiteSpace(search))
            {
                query = "SELECT * FROM book_dtls LIMIT 9";  // Default: show 9 books
            }
            else
            {
                query = @"SELECT * FROM book_dtls 
                     WHERE book_name LIKE @search 
                        OR author_name LIKE @search 
                        OR book_category LIKE @search";
            }

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptBooks.DataSource = dt;
                    rptBooks.DataBind();
                }
            }

        }
    }
}
