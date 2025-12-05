using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;              // very important
using System.Web.DynamicData;
// 
namespace adiha
{
    public partial class Register : System.Web.UI.Page
    {

        public string st="";
        public string yearBorn="";
        public string msg = "";      //מחזרזת טקסט שתשמור הודעה למשתמש אם הכל תקין יחסית לשם שתמש נכנס
        public string sqlMsg = ""; //מחרוזת שתכיל את תוכן השאילתה
       
    
        protected void Page_Load(object sender, EventArgs e)
        {
            string myTime = DateTime.Now.ToString();
            int year = DateTime.Now.Year;
            int from = year - 30;
            int to = year - 10;

            for (int y = from; y < to; y++)
                yearBorn += "<option value='" + y + "'>" + y + "</option>";

            

            if (Request.Form["submit"] !=null)
            {
                st += "<table dir = 'ltr' border='1'>";
                st += "<tr><th colspan='2'> הפריטים שהתקבלו</th></tr>";

                string uName = Request.Form["uName"];
                string fName = Request.Form["fName"];
                string lName = Request.Form["lName"];
                string email = Request.Form["email"];
                string country = Request.Form["country"];
                string city = Request.Form["city"];
                string prefix = Request.Form["prefix"];
                string phoneNum = Request.Form["phoneNum"];
                string pass = Request.Form["pass"];
                string secpass = Request.Form["secPass"];


                st += "<tr><td>user name: </td><td>" + uName + "</td></tr>";
                st += "<tr><td>first name: </td><td>" + fName + "</td></tr>";
                st += "<tr><td>last name: </td><td>" + lName + "</td></tr>";
                st += "<tr><td>email: </td><td>" + email + "</td></tr>";
                st += "<tr><td>country: </td><td>" + country + "</td></tr>";
                st += "<tr><td>city: </td><td>" + city + "</td></tr>";
                st += "<tr><td>phone number: </td><td>" + prefix+phoneNum + "</td></tr>";
                st += "<tr><td>password </td><td>" + pass + "</td></tr>";
                st += "</table>";
                

                string fileName="adiDB.mdf";
                string tableName = "adi";
                //בדיקה האם משתמש קיים 
                string sqlSelect = "SELECT * FROM " + tableName + " WHERE userName='" + uName + "'";
                //sqlMsg = sqlSelect;
                
                if(Helper.IsExist(fileName,sqlSelect))
                {
                    msg = "user name has been taken.. try another one";
                    sqlMsg = sqlSelect;
                }

                else
                {
                    string sqlInsert = "INSERT INTO " + tableName; 
                    sqlInsert += " VALUES (" + prefix + phoneNum + " , '" + fName + "' , '" + lName + "' , '";
                    sqlInsert += uName + "'  , '" + pass + "' , '"+ country +"' , '" + city + "' , '" + email + "')";
                    
                    sqlMsg = sqlInsert;
                    Helper.DoQuery(fileName, sqlInsert);
                    msg = "Success inserting user to the table";
                     

                  
                    
                }
            
                
            }
        }
    }
}