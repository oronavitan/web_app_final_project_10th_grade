using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adiha
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "adiDB.mdf";
                string uName = Request.QueryString["uName"].ToString();
                string sqlDelete = "DELETE FROM adi WHERE userName='" + uName + "'";
                Helper.DoQuery(fileName, sqlDelete);
            Response.Redirect("DeleteUser.aspx");

        }
    }
}