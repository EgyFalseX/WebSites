using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_CategoryCombo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DB db = new DB();
        db.fillCatDrop(DropDownList1);
    }
}
