using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class NewsBar : System.Web.UI.UserControl
{
    public string TitlesString;
    public string LinksString;
    public string HeadersString;
    public string TargetString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetBarTitles()
    {
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
                LinksString += AccessDR.GetValue(0).ToString() + "@.@";
                TitlesString += "<a href=newdataid.aspx?id=" + AccessDR.GetValue(0).ToString() + ">" + AccessDR.GetValue(1).ToString() + "</a>" + "@.@";
                HeadersString += "الاخبــار الجديده@.@";
                TargetString += "_parent@.@";
            }
            if (AccessDR.HasRows)
            {
                LinksString = LinksString.Substring(0, LinksString.Length - 3);
                TitlesString = TitlesString.Substring(0, TitlesString.Length - 3);
                HeadersString = HeadersString.Substring(0, HeadersString.Length - 3);
                TargetString = TargetString.Substring(0, TargetString.Length - 3);
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
