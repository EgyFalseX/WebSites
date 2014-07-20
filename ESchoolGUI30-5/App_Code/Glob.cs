using System;
using System.Data;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


/// <summary>
/// Summary description for Glob
/// </summary>
public static class Glob
{
    public static string ConnStringServices = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/Services.mdb") + ";Persist Security Info=True";
    public static string dataschool = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("App_Data/dataschool.mdb") + ";Persist Security Info=True";
    public static string codedb = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("App_Data/code.mdb") + ";Persist Security Info=True";
}
