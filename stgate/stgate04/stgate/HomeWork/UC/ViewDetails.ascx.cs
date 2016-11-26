using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;

public partial class ViewDetails : System.Web.UI.UserControl
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/events.mdb");
    string FilesPath = "../Files/doc/";

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadContain()
    {
        string RetData = string.Empty;
        if (Request.QueryString["id"] == null)
        {
            return "لا يوجد بيانات";
        }
        string filePath = MapPath(FilesPath + Request.QueryString["id"]);
        if (File.Exists(filePath))
        {
            TextReader TR = new StreamReader(filePath);
            RetData = TR.ReadToEnd();
            TR.Close();
            TR.Dispose();
        }
        return HttpUtility.HtmlDecode(RetData);
    }
}