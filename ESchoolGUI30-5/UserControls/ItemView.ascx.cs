using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_ItemView : System.Web.UI.UserControl
{
    public int PairntID
    {
        get { return Convert.ToInt32(Session["PairntID"]); }
        set { Session["PairntID"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList1_PreRender(object sender, EventArgs e)
    {
        
    }
    public void loadItems(int pid)
    {

        DB b = new DB();
        DataList1.DataSource = b.getitems(pid);
        DataList1.DataBind();
    }
}
