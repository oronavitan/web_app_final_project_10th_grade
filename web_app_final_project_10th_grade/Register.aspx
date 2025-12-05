<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="adiha.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div align="center">
    <style>
        h1{font-weight:bold; font-family:Calibri Light; font-size:45px;}
        h2{font-weight:bold; font-family:Calibri Light; font-size:30px;}
        body{background-color:azure;}
        h3{font-family:Calibri Light;}
        table{font-family:Calibri Light; direction:rtl; text-align:center; font-size:20px; border:2px solid black; margin:0px auto; }
        td{text-align:center; font-family:Calibri Light; font-size: 20px;}
    </style>
         


    <script>
        function chkForm() {


            //תקינות שם משתמש - שם משתמש קצר מדי או לא קיים
            var uName = document.getElementById("uName").value;
            if (uName.length < 4) {
                document.getElementById("mUName").value = "שם משתמש קצר מדי";
                document.getElementById("mUName").style.display = "inline";
                return false;


            }
            else
                document.getElementById("mUName").style.display = "none";


            // chkfirstName()תקינות שם פרטי //
                var fname = document.getElementById("fName").value;
                if (fname.length < 2) {
                    document.getElementById("mfName").value = "חייב להכניס שם פרטי לפחות 2 אותיות";
                    document.getElementById("mfName").style.display = "inline";
                    return false;
                }
                else
                    document.getElementById("mfName").style.display = "none";

            //chklastName תקינות שם משפחה
            var lname = document.getElementById("lName").value;
            if (lname.length < 2) {
                document.getElementById("mlName").value = "חייב להכניס שם משפחה לפחות 2 אותיות";
                document.getElementById("mlName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mfName").style.display = "none";



            /* chkRadioButton
                var answer = document.getElementByName("gender").value;
                if (!answer[0].checked && !answer[1].checked) {
                    document.getElementById("mGender").value = "חובה לסמן מגדר";
                    document.getElementById("mGender").style.display = "inline";
                    return false;

                }
                else
                    document.getElementById("mGender").style.display = "none";
            */


            //---- בדיקת תקינות לכתובת דוא'ל ----
            var email = document.getElementById("email").value;
            //alert("email: " + email);
            var size = email.length;
            //alert("email length is: " + size);
            var atSign = email.indexOf('@');
            //alert("@ at place: " + atSign);
            var dotSign = email.indexOf('.', atSign);
            //alert("dot at place: " + dotSign);
            //alert("dot - at = " + (dotSign - atSign));
            var msg = "";
            if (size < 6)
                msg = "כתובת דוא'ל קצרה מדי או לא קיימת ";
            else if (atSign == -1)
                msg = "סימן @ לא קיים בכתובת";
            else if (atSign != email.lastIndexOf('@'))
                msg = "אסור יותר מ- @ אחד בכתובת דוא'ל ";
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1)
                msg = "סימן ה-@ אינו יכול להיות במקום ראשון או אחרון ";
            else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == size - 1)
                msg = "נקודה לא יכולה להיות תו ראשון או אחרון בכתובת ";
            else if (dotSign - atSign <= 1)
                msg = "נקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";
            else if (!isQuot(email))
                msg = "כתובת דוא'ל לא יכולה להכיל גרש או גרשיים";
            else if (!isValidString(email))
                msg = "כתובת דוא'ל לא יכולה להכיל תווים אסורים";
            else if (!isHebres(email))
                msg = "כתובת דוא'ל לא יכולה להכיל עברית";

            if (msg != "") {
                document.getElementById("mEmail").value = msg;
                document.getElementById("mEmail").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mEmail").style.display = "none";
            //alert("end of email check");

            /*
            //---   בדיקת שנת לידה ---
            //--- שנת לידה חייבת להיות מספר ---
            var yearBorn = document.getElementById("yearBorn").value;
            //alert("yearBorn = " + yearBorn);
            var d = new Date();
            var year = d.getFullYear();//השנה הנוכחית
            var msg = "";
            if (isNaN(yearBorn))
                msg = "שנת לידה חייבת להכיל ספרות בלבד";
            else if (yearBorn < 1900)
                msg = "שנת לידה חייבת להכיל מספר שלם, 4 ספרתי גדול מ- 1900";
            else if (yearBorn > (year - 5))
                msg = "צעיר מידי מכדי להירשם";

            if (msg != "") {
                document.getElementById("mYearBorn").value = msg;
                document.getElementById("mYearBorn").style.display = "inline";
                msg = "";
                return false;
            }
            else
                document.getElementById("mYearBorn").style.display = "none";

             */

            //---בדיקת קידומת למספר טלפון---
            var prefix = document.getElementById("prefix").value;
            //alert("prefix = " + prefix);
            if (prefix == "choose") {
                document.getElementById("mPhone").value = "לא נבחרה קידומת";
                document.getElementById("mPhone").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mPhone").style.display = "none";

            //--- בדיקת מספר טלפון --- 
            var phone = document.getElementById("phoneNum").value;
            //alert("phone = " + phone);
            if (phone == "" || (phone.length != 7) || (isNaN(phone))) {
               
                document.getElementById("mPhone").value = " מספר הטלפון חייב להיות  7 ספרות ";
                document.getElementById("mPhone").style.display = "inline";
                
                return false;
            }
            else
                document.getElementById("mPhone").style.display = "none";



            //--- בדיקה עבור סיסמא --
            var pw1 = document.getElementById("pass").value;
            //alert("pw1 = " + pw1);
            var pw2 = document.getElementById("secPass").value;
            //alert("pw2 = " + pw2);
            if (pw1.length < 6 || pw1.length > 8) {  //6 דורשים הכנסה של סיסמא בעלת אורך מינימלי 
                 msg = " סיסמא חייבת להיות בין 6 - 8 תווים ";

                document.getElementById("mPass").value = msg;
                document.getElementById("mPass").style.display = "inline";
                msg = "";
                return false;
            }
            else
                document.getElementById("mPass").style.display = "none";


            //--- בדיקה האם הסיסמא שווה לסיסמת האימות ---
            if (pw1 != pw2) {
                msg = " הסיסמא וסיסמת האימות אינם זהות ";

                //alert(msg);
                document.getElementById("msecPass").value = msg;
                document.getElementById("msecPass").style.display = "inline";
                msg = "";
                return false;
            }
            else
                document.getElementById("msecPass").style.display = "none";




            alert("הטופס תקין");
            return true;

        }

        //--- אם מכיל גרש או גרשיים - לא תקין ---            
        function isQuot(mail) {
            var quot = '\"', quot1 = "\'";
            if (mail.indexOf(quot) != -1 || mail.indexOf(quot1) != -1)
                return false;
            return true;
        }

        //--- מכיל תווים אסורים ---
        function isValidString(mail) {
            var badChr = "$%^&*()-! []{}<>?";
            var len = badChr.length;

            var i = 0, pos, ch;
            while (i < len) {
                ch = badChr.charAt(i);
                pos = mail.indexOf(ch);
                if (pos != -1)
                    return false;
                i++;
            }
            return true;
        }

        //--- מכיל תווים בעברית ---
        function isHebres(mail) {
            var badChr = "אבגדהוזחטיכךלמםנןסעפףצץקרשת";
            var len = badChr.length;

            var i = 0, pos, ch;
            while (i < len) {
                ch = badChr.charAt(i);
                pos = mail.indexOf(ch);
                if (pos != -1)
                    return false;
                i++;
            }
            return true;
        }
        

        

        
        
    </script>




    <h1>הרשמו לאתר</h1>
    <h2>:טופס רישום</h2>
        
        <table >
            <tr>
                <td> שם משתמש</td>   
                <td><input type="text" id="uName" name="uName" /> </td>
                <td><input type="text" id="mUName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

             <tr>
                <td> שם פרטי</td>
                <td><input type="text" id="fName" name="fName" /></td>
                  <td><input type="text" id="mfName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

             <tr>
                <td>שם משפחה</td>
                <td><input type="text" id="lName" name="lName" /></td>
                  <td><input type="text" id="mlName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

             <tr>
                <td> דוא"ל</td>
                <td><input type="text" id="email" name="email" /> 
                  <td><input type="text" id="mEmail" size="60"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>
            <tr>    
            <td> מספר טלפון :</td>

                <td dir="ltr">
                    <select name="prefix" id="prefix">
                        <option value="050">050</option>
                         <option value="052">052</option>
                         <option value="053">053</option>
                         <option value="054">054</option>
                         <option value="055">055</option>
                         <option value="057">057</option>
                         <option value="058">058</option>
                         <option value="02">02</option>
                        <option value="03">03</option>
                         <option value="04">04</option>
                         <option value="09">09</option>
                        <option value="08">08</option>
                         <option value="077">077</option>
             
                    </select>

                    &nbsp;&nbsp; - &nbsp;&nbsp;
                    <input type="text" name="phoneNum" id="phoneNum" />
                </td>
                <td>
                    <input type="text" id="mPhone" size="30" 
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>מדינה :</td>
                <td><input type="text" id="country" name="country" =""/> </td>
                <td><input type="text" id="mCountry" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                 </td>              
            </tr>
            <tr>
                <td>עיר :</td>
                <td><input type="text" id="city" name="city" =""/> </td>
                <td><input type="text" id="mCity" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                 </td>              
            </tr>
            <tr>
                <td>סיסמה :</td>
                <td><input type="text" id="pass" name="pass" =""/> </td>
                <td><input type="text" id="mPass" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                 </td>              
            </tr>

            <tr>
                <td> אימות סיסמה: </td>
                <td><input type="text" id="secPass" name="secPass" /> </td>
                <td><input type="text" id="msecPass" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                 </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value="     שלח         " />
                </td>
            </tr>




        </table>
   



     <table style="border:2px solid black; margin:0px auto;">
         <%= st %>
    </table>


        <h3 style="direction:ltr; text-align: center;"><%= sqlMsg%></h3>


     <h3 style="direction:ltr; text-align: center;">
        <%= msg %>
    </h3>
     </div>


 

</asp:Content>
