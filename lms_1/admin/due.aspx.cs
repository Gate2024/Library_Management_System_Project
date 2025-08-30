using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace lms_1.admin
{
    public partial class due : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["str"].ConnectionString);
        DataSet ds = new DataSet ();
        protected void Page_Load(object sender, EventArgs e)
        {
            fineList();
        }

    public void fineList ()
        {
            con.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT \r\n    f.fine_id,\r\n    s.student_name,\r\n    b.book_name,\r\n    i.issue_dt,\r\n    i.return_dt,\r\n    f.late_days,\r\n    f.fine_per_day,\r\n    f.total_fine,\r\n    f.calculated_on\r\nFROM due_dtls f\r\nINNER JOIN issue_dtls i ON f.issue_id = i.Id\r\nINNER JOIN student_dtls s ON i.student_id = s.student_id\r\nINNER JOIN book_dtls b ON i.book_id = b.book_id\r\nORDER BY f.calculated_on DESC\r\n",con);
            da.Fill(ds);
            due_list.DataSource = ds.Tables[0];
            due_list.DataBind();

            
        }
    }
}