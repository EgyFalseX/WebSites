using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ViewChanges : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionRetirementWeb.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (sessionRetirementWeb.IsAdmin == false)
            Response.Redirect("~/");
    }
    
    protected void btnViewMember_Click(object sender, EventArgs e)
    {
        if (cbSyndicate.SelectedIndex < 0)
            return;
        DSDataMember.DataFile = MapPath(@"~/App_Data/" + cbSyndicate.SelectedItem.GetValue("dataname"));
        DSDataMember.SelectParameters[0].DefaultValue = cbSyndicate.Value.ToString();
        DSDataMember.Select(DataSourceSelectArguments.Empty);
        DSDataMember.DataBind();
    }
    protected void btnViewWarasa_Click(object sender, EventArgs e)
    {
        if (cbSyndicate.SelectedIndex < 0)
            return;
        DSDataMember.DataFile = MapPath(@"~/App_Data/" + cbSyndicate.SelectedItem.GetValue("dataname"));
        DSDataWarasa.SelectParameters[0].DefaultValue = cbSyndicate.Value.ToString();
        DSDataWarasa.Select(DataSourceSelectArguments.Empty);
        DSDataWarasa.DataBind();
    }
   
}