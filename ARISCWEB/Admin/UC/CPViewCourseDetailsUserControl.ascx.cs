using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class CPViewCourseDetailsUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CoursesClass s = new CoursesClass();
                s.ID = Convert.ToInt32(Request.QueryString["CourseID"]);

                if(File.Exists(Server.MapPath("UploadFiles\\Courses\\Details\\" + s.ID.ToString())))
                ASPxHtmlEditor1.Html = File.ReadAllText(Server.MapPath("UploadFiles\\Courses\\Details\\" + s.ID.ToString()));

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CoursesClass s = new CoursesClass();
            s.ID = Convert.ToInt32(Request.QueryString["CourseID"]);

                s.Contain = Server.MapPath("UploadFiles\\Courses\\Details\\" + s.ID.ToString());
                msgLabel.Text = s.UpdateDetails();
                File.WriteAllText(s.Contain, ASPxHtmlEditor1.Html);
           
        }
    }
