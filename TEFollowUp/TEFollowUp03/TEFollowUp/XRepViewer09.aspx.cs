using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer09 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!TheSessionsTEFollowUp.IsAdmin)
        //    Response.Redirect("AccessDenied.aspx");
    }
    protected void cbMoshref_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if (cbMoshref.Value != null && cbyear.Value != null)
        {
            HttpContext.Current.Session["XRep09ID"] = cbMoshref.Value;
            HttpContext.Current.Session["XRep09Year"] = cbyear.Value;
            HttpContext.Current.Session["XRep09YearName"] = cbyear.Text;
            HttpContext.Current.Session["XRep09EmpName"] = cbMoshref.Text;
            ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
        }
    }
}