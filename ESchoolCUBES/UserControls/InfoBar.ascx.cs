using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class UserControls_InfoBar : System.Web.UI.UserControl
{
    public string InfoString;
    public string InfoTitleString;
    public string InfoLinksString;
    public string InfoTargetString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetInfos()
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("", AccessCon);
        OleDbDataReader AccessDR;
        AccessCon.Open();
        AccessCmd.CommandText = "SELECT name_info FROM tb_info WHERE (day_info = " + DateTime.Today.Day.ToString() + ")";
        AccessDR = AccessCmd.ExecuteReader();
        int i = 1;
        while (AccessDR.Read())
        {
            InfoString += AccessDR.GetValue(0).ToString() + "<br/><br/>@.@";
            InfoTitleString += "معلومه تهمك" + i + ":@.@";
            InfoTargetString += "_parent@.@";
            InfoLinksString += "nothing2Go@.@";
            i++;
        }
        if (AccessDR.HasRows)
        {
            InfoString = InfoString.Substring(0, InfoString.Length - 3);
            InfoTitleString = InfoTitleString.Substring(0, InfoTitleString.Length - 3);
            InfoTargetString = InfoTargetString.Substring(0, InfoTargetString.Length - 3);
            InfoLinksString = InfoLinksString.Substring(0, InfoLinksString.Length - 3);
        }
        AccessCon.Close();
        return "Done";
    }
}
