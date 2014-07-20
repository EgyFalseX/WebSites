using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TBLMembersEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberWeb.IsAuth)
        {
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!sessionMemberWeb.IsAdmin)
            cbSyndicateId.Enabled = false;
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (!sessionMemberWeb.IsAdmin)
        {
            e.Command.CommandText = "SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE Closed = 'False' AND SyndicateId = " + sessionMemberWeb.SyndicateId;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (!mcMemberWeb.IsNullOrEmpty(cb.Value))
        {
            Response.Redirect("~/TBLMembers.aspx?mm=" + cb.Value.ToString());
        }
    }
    protected void DSCDSyndicate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (sessionMemberWeb.IsAdmin)
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        else
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + sessionMemberWeb.SyndicateId;
    }
}