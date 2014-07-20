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

public partial class index : System.Web.UI.Page
{
    public string InfoString;
    public string InfoTitleString;
    public string InfoLinksString;
    public string InfoTargetString;
    public int infocount;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetInfos()
    {
        infocount=0;
         OleDbConnection AccessCon =  MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("", AccessCon);
        OleDbDataReader AccessDR;
        AccessCmd.CommandText = "SELECT code_news,news_title, Timeline FROM News ORDER BY Timeline DESC";
        try
        {
            AccessCon.Open();
            AccessDR = AccessCmd.ExecuteReader();
            while (AccessDR.Read())
            {
                InfoLinksString += AccessDR.GetValue(0).ToString() + "@.@";
                InfoString += "<a href=newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + ">" + AccessDR.GetValue(1).ToString() + "</a>" + "@.@";
                InfoTitleString += "الاخبــار الجديده@.@";
                InfoTargetString += "_parent@.@";
                infocount++;
            }
            if (AccessDR.HasRows)
            {
                InfoLinksString = InfoLinksString.Substring(0, InfoLinksString.Length - 3);
                InfoString = InfoString.Substring(0, InfoString.Length - 3);
                InfoTitleString = InfoTitleString.Substring(0, InfoTitleString.Length - 3);
                InfoTargetString = InfoTargetString.Substring(0, InfoTargetString.Length - 3);
                
            }
        }
        catch (Exception ex)
        {
            AccessCon.Close();
            return ex.Message;
        }
        AccessCon.Close();
        return "Done";
    }
}
