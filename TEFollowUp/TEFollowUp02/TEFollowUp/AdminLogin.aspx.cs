using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Login : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsTEFollowUp.UserID == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable userData = MCTEFollowUp.LoadDataTable(string.Format(@"SELECT UserID, UserName, [Password], IsAdmin, empid, read_writ, guest
        FROM FollowupUsers WHERE (UserName = '{0}') AND ([Password] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCTEFollowUp.Connection.ConnectionString);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsTEFollowUp.UserID = userData.Rows[0]["UserID"].ToString();
        if (userData.Rows[0]["empid"].ToString() != string.Empty)
            TheSessionsTEFollowUp.empid = userData.Rows[0]["empid"].ToString();
        else
            TheSessionsTEFollowUp.empid = "-100";
        
        TheSessionsTEFollowUp.read_writ = (bool)userData.Rows[0]["read_writ"];
        if (userData.Rows[0]["IsAdmin"].ToString() == string.Empty)
            TheSessionsTEFollowUp.IsAdmin = false;
        else
            TheSessionsTEFollowUp.IsAdmin = Convert.ToBoolean(userData.Rows[0]["IsAdmin"]);
        if (userData.Rows[0]["guest"].ToString() != string.Empty)
            TheSessionsTEFollowUp.guest = Convert.ToBoolean(userData.Rows[0]["guest"]);
        else
            TheSessionsTEFollowUp.guest = false;

        //Get User School & moder
        DataTable schoolTbl = MCTEFollowUp.LoadDataTable("SELECT schoolid, moder, (SELECT schoolname FROM cdschool WHERE schoolid = tblempdata.schoolid) AS schoolname FROM tblempdata WHERE empid = " + TheSessionsTEFollowUp.empid, false);
        if (schoolTbl.Rows.Count == 0)
        {
            TheSessionsTEFollowUp.schoolid = "-100";
            TheSessionsTEFollowUp.moder = false;
        }
        else
        {
            if (schoolTbl.Rows[0]["schoolid"].ToString() == string.Empty)
                TheSessionsTEFollowUp.schoolid = "-100";
            else
                TheSessionsTEFollowUp.schoolid = schoolTbl.Rows[0]["schoolid"].ToString();

            if (schoolTbl.Rows[0]["moder"].ToString() != string.Empty)
                TheSessionsTEFollowUp.moder = Convert.ToBoolean(schoolTbl.Rows[0]["moder"]);
            else
                TheSessionsTEFollowUp.moder = false;

            TheSessionsTEFollowUp.schoolname = schoolTbl.Rows[0]["schoolname"].ToString();
        }
        

        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/TEFollowUp/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}