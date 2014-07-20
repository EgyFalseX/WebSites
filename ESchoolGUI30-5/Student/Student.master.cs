using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_Student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.StudentID == null)
        {
            Label1.Visible = false;
            StName.Visible = false;
          
            Button14.Visible = false;
        }
        else
        {
            Students st = new Students();
            Button14.Visible = true;
            Label1.Visible = true;
            StName.Visible = true;
            StName.Text = new Codes().StudentName(Convert.ToInt64(TheSessions.StudentID));
            string s = st.GetGender();
            if (s.Trim() == "1")
            {
                GenderImg.ImageUrl = "Man.png";
                GenderImg.ToolTip = "ذكر";
            }
            else
            {
                GenderImg.ImageUrl = "Woman.png";
                GenderImg.ToolTip = "انثى";
            }
            
        }

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "")
        {
             
        }
    }
    
    protected void Button14_Click(object sender, EventArgs e)
    {
        TheSessions.StudentID = null;
        TheSessions.RoleIDs = null;
        Response.Redirect("../HomePage.aspx");
    }
}
