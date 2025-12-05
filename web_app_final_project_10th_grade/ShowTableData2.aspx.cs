using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace adiha
{
    public partial class ShowTableData2 : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlSelect = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "adiDB.mdf";
            string tableName = "Adi";
            string sqlSelect = "SELECT * FROM " + tableName;
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
            int length = table.Rows.Count;
            if (length == 0)
                msg = "אין נרשמים";
            else
            {
                st += "<tr>";
                st += "<th>מספר טלפון</th>";
                st += "<th>שם פרטי</th>";
                st += "<th>שם משפחה</th>";
                st += "<th>שם משתמש</th>";
                st += "<th>סיסמה</th>";
                st += "<th>מדינה</th>";
                st += "<th>עיר</th>";
                st += "<th>אימייל</th>";
                st += "</tr>";
                for (int i = 0; i < length; i++)
                {
                    st += "<tr>";
                    st += "<td>" + table.Rows[i]["phonenumber"] + "</td>";
                    st += "<td>" + table.Rows[i]["firstname"] + "</td>";
                    st += "<td>" + table.Rows[i]["lastname"] + "</td>";
                    st += "<td>" + table.Rows[i]["username"] + "</td>";
                    st += "<td>" + table.Rows[i]["password"] + "</td>";
                    st += "<td>" + table.Rows[i]["country"] + "</td>";
                    st += "<td>" + table.Rows[i]["city"] + "</td>";
                    st += "<td>" + table.Rows[i]["email"] + "</td>";
                    st += "</tr>";
                }
                msg = "נרשמו " + length + " אנשים";
            }    
        }
    }
}