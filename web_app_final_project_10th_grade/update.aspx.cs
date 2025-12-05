using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;


namespace adiha
{
    public partial class update : System.Web.UI.Page
    {
        public string yearList = ""; //ליצירת רשימת שנים

        public string msg = "";
        public string sqlUpdate = "";
        public string sqlSelect = "";
        public string yrBorn = "";
        public string uName, fName, lName, email, prefix, phone, pw, count, cit;




        protected void Page_Load(object sender, EventArgs e)
        {
            string myTime = DateTime.Now.ToString();
            int year = DateTime.Now.Year;
            int from = year - 30;
            int to = year - 10;
           

            string fileName = "adiDB.mdf";
            //uName = Session["username"].ToString();
            //string user = Session["username"].ToString();

            if(uName=="אורח")
            {
                msg = "אינך משתמש רשום במערכת";
                Response.Redirect("adi.aspx");
            }

            sqlSelect = "SELECT * FROM adi WHERE userName= '" + uName + "' ";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);




            //is existing user??
            int length = table.Rows.Count;
            if (length == 0)
                msg = "אינך משתמש רשום במערכת ";
            else
            {
                phone= table.Rows[0]["phone"].ToString().Trim();
                prefix = table.Rows[0]["prefix"].ToString().Trim();
                fName = table.Rows[0]["fName"].ToString().Trim();
                lName= table.Rows[0]["lName"].ToString().Trim();
                uName = table.Rows[0]["uName"].ToString().Trim();
                pw = table.Rows[0]["pw"].ToString().Trim();
                count = table.Rows[0]["count"].ToString().Trim(); 
                cit = table.Rows[0]["cit"].ToString().Trim();
                email = table.Rows[0]["email"].ToString().Trim();
                
                
            }



            if(this.IsPostBack)
            {
                phone = Request.Form["phone"];
                prefix = Request.Form["prefix"];
                fName = Request.Form["fName"];
                lName = Request.Form["lName"];
                uName = Request.Form["uName"];
                pw = Request.Form["pw"];
                count = Request.Form["count"];
                cit = Request.Form["cit"];
                email = Request.Form["email"];

                prefix += phone;

                //בניית שאילתת העדכון
                sqlUpdate = "UPDATE adi ";
                sqlUpdate += "SET firstName = '" + fName + "', ";
                sqlUpdate += "lastName = '" + lName + "', ";
                sqlUpdate += "email = '" + email + "' , ";
                sqlUpdate += "phonenumber = '" + prefix + "',";
                sqlUpdate += "password= '" + pw + "' ";
                sqlUpdate += "WHERE username = '" + uName + "'";

                Helper.DoQuery(fileName, sqlUpdate);
                msg = "updating successfully ";
            }
            if (Request.Form["before"] != null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}