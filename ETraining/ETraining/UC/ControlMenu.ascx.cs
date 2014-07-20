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

public partial class ControlMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMenu();
        }
    }
    public void LoadMenu()
    {
        ET_Lib db = new ET_Lib();
        DataTable dt = db.getMenuTitle(Session["RoleIDs"].ToString());
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void Repeater1_PreRender(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            HiddenField hd = (HiddenField)item.FindControl("HiddenField1");
            ET_Lib db = new ET_Lib();
            DataList dl = (DataList)item.FindControl("DataList1");
            dl.DataSource = db.getitems(Convert.ToInt32(hd.Value));
            dl.DataBind();

        }
    }

}
