using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace adiha
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlDelete = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "adiDB.mdf";
            string tableName = "adi";
               
                string sqlSelect = "SELECT * FROM " + tableName;
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                
                string userToDelete = "";
                int length = table.Rows.Count;
                if (length == 0)
                    msg = "אין נרשמים";
                else
                {
                    st += "<tr>";
                    st += "<th style= 'width:100px;'>טלפון</th>";
                    st += "<th  style= 'width:80px;'>שם פרטי</th>";
                    st += "<th style= 'width:60px;'>שם משפחה</th>";
                    st += "<th style= 'width:140px;'>שם משתמש</th>";
                    st += "<th style= 'width:60px;'>סיסמא</th>";
                    st += "<th style= >מדינה</th>";
                    st += "<th style= 'width:100px;'>עיר</th>";
                    st += "<th style= 'width:100px;'>אימייל</th>";

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

                        

                        userToDelete = table.Rows[i]["userName"].ToString();

                        st += "<td style= 'text-align: center; border: 1px solid black;'>";
                        st += "<a href = 'DeleteRecord.aspx?uName=" + userToDelete + "'>[delete]</a>";
                        st += "</tr>";


                    }

                }

            
            }
        }
    }
