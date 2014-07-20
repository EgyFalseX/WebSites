using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;


public partial class empkgMasterPage : System.Web.UI.MasterPage
{
    public string TitlesString;
    public string LinksString;
    public string HeadersString;
    public string TargetString;
    public string news;
    public string InfoString;
    public string InfoTitleString;
    public string InfoLinksString;
    public string InfoTargetString;
    public string GetBarTitles()
    {
        //OleDbConnection AccessCon = new OleDbConnection(Glob.ConnStringNews);
        //OleDbCommand AccessCmd = new OleDbCommand("", AccessCon);
        //OleDbDataReader AccessDR;

        //AccessCon.Open();
        //AccessCmd.CommandText = "SELECT code_news,news_title, Timeline FROM News where id_starting=1  ORDER BY Timeline DESC";
        //AccessDR = AccessCmd.ExecuteReader();
        ////string OutP = string.Empty;
        //while (AccessDR.Read())
        //{
        //    //OutP += "<a href=newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + ">" + AccessDR.GetValue(1).ToString() + "</a> <img src=images/separator.jpg />";
        //    LinksString += AccessDR.GetValue(0).ToString() + "@.@";
        //    TitlesString += "<a href=~/newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + ">" + AccessDR.GetValue(1).ToString() + "</a>" + "@.@";
        //    HeadersString += "<img src='logo_new.png' width='25' height='15' />اخر الاخبار@.@";
        //    TargetString += "_parent@.@";
        //}
        //if (AccessDR.HasRows)
        //{
        //    LinksString = LinksString.Substring(0, LinksString.Length - 3);
        //    TitlesString = TitlesString.Substring(0, TitlesString.Length - 3);
        //    HeadersString = HeadersString.Substring(0, HeadersString.Length - 3);
        //    TargetString = TargetString.Substring(0, TargetString.Length - 3);

        //}
        //AccessCon.Close();
        return "Done";
    }
    public string GetInfos()
    {

        //OleDbConnection AccessCon = new OleDbConnection(Glob.ConnStringInfo);
        //OleDbCommand AccessCmd = new OleDbCommand("", AccessCon);
        //OleDbDataReader AccessDR;
        //AccessCmd.CommandText = "SELECT name_info FROM tb_info WHERE (day_info = " + DateTime.Today.Day.ToString() + ")";
        //try
        //{
        //    AccessCon.Open();
        //    AccessDR = AccessCmd.ExecuteReader();
        //    while (AccessDR.Read())
        //    {
        //        // news += "<li> <div class='thumbnail'> <img src='images/1.jpg'> </div> <div class='info'> <a href='newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + "'>" + AccessDR.GetValue(1).ToString() + "</a>  <span class='cat'>Category: Illustrations</span>  </div> <div class='clear'></div> </li>";

        //        //                news += "<li>  <div class='info'> <a href='newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + "'>" + AccessDR.GetValue(1).ToString() + "</a>  <span class='cat'> ----------------- </span>  </div> <div class='clear'></div> </li>";
        //        news += "<li>  <div class='info'> " + AccessDR.GetValue(0).ToString() + " <span class='cat'> ----------------- </span>  </div> <div class='clear'></div> </li>";


        //    }

        //}
        //catch (Exception ex)
        //{
        //    AccessCon.Close();
        //    return ex.Message;
        //}
        //AccessCon.Close();
        return "Done";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //GetInfos();
        //if (TheSessions.EmploeeID == null)
        //{
        //    Label1.Visible = false;
        //    lbl_Fullname.Visible = false;

        //    Button14.Visible = false;

        //    Response.Redirect("emplogin.aspx");
        //}
        //else
        //{
        //    Button14.Visible = true;
        //    Label1.Visible = true;
        //    lbl_Fullname.Visible = true;
        //    Employee Emp = new Employee();
        //    lbl_Fullname.Text = Emp.GetEmpFullhName(Convert.ToInt32(TheSessions.EmploeeID));
        //    string s = Emp.GetGender();
        //    if (s.Trim() == "ذكر")
        //    {
        //        GenderImg.ImageUrl = "Man.png";
        //        GenderImg.ToolTip = "ذكر";
        //    }
        //    else
        //    {
        //        GenderImg.ImageUrl = "Woman.png";
        //        GenderImg.ToolTip = "انثى";
        //    }

        //}

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "")
        {

        }
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        //TheSessions.EmploeeID = null;
        //TheSessions.RoleIDs = null;
        //Response.Redirect("mainpage.aspx");
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
    protected void BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        TheSessions.UserID = null;
        Response.Redirect("~/Login.aspx");
    }
}
