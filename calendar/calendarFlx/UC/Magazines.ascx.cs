using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Magazines : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["View"] == null)
            return;
        if (Request.QueryString["View"].ToString() == "All")
        {
            AccessDataSourceMagazines.SelectCommand = @"SELECT (Select addd From addno Where addno = addcont.addno) AS addd, [contid], [addno], 
            [subject], [subwrit], [subjectdet], [subimage] FROM [addcont]";
            
        }
    }
}