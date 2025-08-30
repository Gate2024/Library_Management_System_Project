using MySql.Data.MySqlClient;
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
    public partial class Book_List : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            booklist();

        }
        public void booklist ()
        {
            con.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT \r\n    b.book_id,\r\n    b.book_name,\r\n    b.author_name,\r\n    'Returned' AS status\r\nFROM book_dtls b\r\nJOIN issue_dtls i ON b.book_id = i.book_id\r\nJOIN return_dtls r ON i.id = r.issue_id\r\n\r\nUNION\r\n\r\nSELECT \r\n    b.book_id,\r\n    b.book_name,\r\n    b.author_name,\r\n    'Issued' AS status\r\nFROM book_dtls b\r\nJOIN issue_dtls i ON b.book_id = i.book_id\r\nWHERE i.id NOT IN (SELECT issue_id FROM return_dtls)\r\n\r\nUNION\r\n\r\nSELECT \r\n    b.book_id,\r\n    b.book_name,\r\n    b.author_name,\r\n    'Not Issued' AS status\r\nFROM book_dtls b\r\nWHERE b.book_id NOT IN (SELECT book_id FROM issue_dtls);\r\n", con);
            da.Fill(ds);
            book_list.DataSource = ds.Tables[0];
            book_list.DataBind();
        }
    }
}