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
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/FlexibleData.mdb");
    private void LoadSubMenu()
    {
        DataTable dt = new DataTable("FX2012");
        string NavURL = "../ViewDetails.aspx?";

        if (Request.QueryString["id"] != null)
        {
            NavURL += "id=" + Request.QueryString["id"].ToString() + "&";
        }
        using (OleDbDataAdapter da = new OleDbDataAdapter("SELECT '" + NavURL + "Sub=' & SubMenuID AS SubMenuID, SubMenuTitle FROM SubMenu", constr))
        {
            da.Fill(dt);
        }
        RepeaterMenu.DataSource = dt;
        RepeaterMenu.DataBind();
    }
   
    public string LoadContain()
    {
        if (Request.QueryString["id"] == null || Request.QueryString["sub"] == null)
        {
            return string.Empty;
        }
        string ThePath = "../ItemData/" + Request.QueryString["id"] + "-" + Request.QueryString["Sub"];
        ThePath = MapPath(ThePath);
        string RetData = string.Empty;

        if (File.Exists(ThePath))
        {
            TextReader TR = new StreamReader(ThePath);
            RetData = TR.ReadToEnd();
            TR.Close();
            TR.Dispose();
        }
        return HttpUtility.HtmlDecode(RetData);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadSubMenu();
    }
}