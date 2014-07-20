using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.StudentID == null)
        {
            Label1.Visible = false;
            StName.Visible = false;
            Button1.Visible = false;
            Button14.Visible = false;
        }
        else
        {
            Button1.Visible = true;
            Button14.Visible = true;
            Label1.Visible = true;
            StName.Visible = true;
            StName.Text = new Codes().StudentName(Convert.ToInt64(TheSessions.StudentID));
        }

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "")
        {
             
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TheSessions.StudentID = null;
        Response.Redirect("./Default.aspx");
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        TheSessions.StudentID = null;
        Response.Redirect("../HomePage.aspx");
    }
}
