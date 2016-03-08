using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ViewCourseDetailsTextUserControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((Session["UserName"] == null) || (Session["Password"] == null))
            //    Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
            CoursesClass s = new CoursesClass();


            s.ID = Convert.ToInt32(Request.QueryString["CourseID"]);
            System.Data.DataTable dt = s.GetSlidersDataByID();
            string y = "", text = "";
            y = dt.Rows[0][3].ToString();
            if (File.Exists(y))
            {

                StreamReader streamReader = new StreamReader(y);
                text = streamReader.ReadToEnd();

            }
            //ASPxHtmlEditor1.Html = text;
            // Response.Write("alert('" + y + "')");
            Response.Write("<center><Table width='800' hight='140'><tr><td>");
            Response.Write("<img class='auto-style1' src='../images/Banar.jpg'/>");
            Response.Write("</td></tr>");
            Response.Write("<tr><td>" + text + "</td></tr></table><center>");
        
        }
    }
