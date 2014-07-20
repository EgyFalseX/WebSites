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
using Telerik.Web.UI;

public partial class UserControl_SLLibraryScreen : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            ViewState["id"] = Request.QueryString["id"].ToString();
        }
        else
        {
            ViewState["id"] = "0";
        }
        LoadAllCat();
    }
    public void LoadAllCat()
    {
        DataTable DT = new DataTable("GeneralTable");
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT     (\"~/library.aspx?id=\" & Categories.CatID) AS CatID, CatName, CatImage, CatInfo, VisitCounter, CatOrder, CatParent ,(select count(*) from Books where  Books.CatID=Categories.CatID ) as [BooksCount]   FROM         Categories  WHERE     (CatParent ="+ViewState["id"]+") ORDER BY CatOrder", MySchool.SLConnection);
        AccessDA.Fill(DT);
        DataListCats.DataSource = DT;
        DataListCats.DataBind();
    }
}
