using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace adiha
{
    public partial class login : System.Web.UI.Page
    {
        public string msg;
        public string sqlLogin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                string fileName = "adiDB.mdf";
                string tableName = "adi";
                sqlLogin = "SELECT * FROM " + tableName + " WHERE username ='" + username + "' AND password ='" + password + "'";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);
                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "משתמש לא נמצא";
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Session["username"] = table.Rows[0]["username"];
                    Session["firstname"] = table.Rows[0]["firstname"];
                    Response.Redirect("ShowTableData2.aspx");
                }
            }
            if (Request.Form["idcun"] != null)
            {
                Response.Redirect("update.aspx");
            }
        }
    }
}