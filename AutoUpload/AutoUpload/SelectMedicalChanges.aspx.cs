using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectMedicalChanges : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuth)
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void btnMem_Click(object sender, EventArgs e)
    {
        if (MC.IsNullOrEmpty(cbMemberMem.Value))
        {
            return;
        }
        Response.Redirect(string.Format(@"MedicalEdit.aspx?id={0}&type=1", cbMemberMem.Value));
    }
    protected void btnMem2_Click(object sender, EventArgs e)
    {
        if (MC.IsNullOrEmpty(cbMemberMem3.Value))
        {
            return;
        }
        Response.Redirect(string.Format(@"MedicalEdit.aspx?id={0}&type=2", cbMemberMem3.Value));
    }
}