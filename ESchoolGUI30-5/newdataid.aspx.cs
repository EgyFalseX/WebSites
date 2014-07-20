using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.OleDb;

public partial class newdataid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 
    public string ShowNewsTitle()
    {
     
         
        string NewsTitle = string.Empty;
        string NewsID = Request.QueryString["id"];
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("SELECT news_title FROM News WHERE (code_news = " + NewsID + ")", AccessCon);
        try
        {
            AccessCon.Open();
            NewsTitle = AccessCmd.ExecuteScalar().ToString();
        }
        catch
        {
            NewsTitle = "Error Getting data";
        }
        AccessCon.Close();
        return NewsTitle;
    }

    public string ShowNewsDetails()
    {
        string NewsDetails = string.Empty;
        string NewsID = Request.QueryString["id"];
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("SELECT news_details FROM News WHERE (code_news = " + NewsID + ")", AccessCon);
        try
        {
            AccessCon.Open();
            NewsDetails = AccessCmd.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            NewsDetails = ex.Message;
        }
        AccessCon.Close();
        return NewsDetails;
    }
   
}