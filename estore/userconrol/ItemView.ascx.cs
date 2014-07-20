using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_ItemView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DB b = new DB();
        DataList1.DataSource = b.getitems();
        DataList1.DataBind();
  
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList1_PreRender(object sender, EventArgs e)
    {
        
    }
}
