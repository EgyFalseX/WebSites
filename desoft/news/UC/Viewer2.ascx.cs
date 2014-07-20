using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Viewer2 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            DataRowView row = (DataRowView)e.Item.DataItem;
            if (row.Row["ItemInfo"].ToString().Length > 260)
            {
                row.Row["ItemInfo"] = row.Row["ItemInfo"].ToString().Remove(260);
            }
            
        }
    }
}