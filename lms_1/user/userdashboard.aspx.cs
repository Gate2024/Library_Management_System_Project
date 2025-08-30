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
    public partial class userdashboard : System.Web.UI.Page
    {
        //MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        //DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
         //if (!IsPostBack)
         //   {
         //       LoadBooks();
         //   }

        }
        public void LoadBooks()
        {
            //con.Open();
            //MySqlCommand cmd = new MySqlCommand("SELECT book_name, author_name, book_category FROM book_dtls",con);
            //MySqlDataReader da = cmd.ExecuteReader();
            //rptBooks.DataSource = da;
            //rptBooks.DataBind();
        }
    }
}