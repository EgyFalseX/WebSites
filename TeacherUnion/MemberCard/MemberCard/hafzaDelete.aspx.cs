using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class hafzaDelete : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberCard.IsAuth)
        {
            Response.Redirect("~/MemberCard/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            DSData.Delete();
            lblState.Text = "تم الحذف بنجاح";
            lblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblState.Text = ex.Message;
            lblState.ForeColor = System.Drawing.Color.Red;
        }

    }
}