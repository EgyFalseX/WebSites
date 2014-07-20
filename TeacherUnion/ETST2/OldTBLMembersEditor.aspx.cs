using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OldTBLMembersEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuth)
        {
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!TheSessions.IsAdmin)
            cbSyndicateId.Enabled = false;
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (!TheSessions.IsAdmin)
        {
            e.Command.CommandText = "SELECT [MemberId], [MemberName] FROM OldTBLMembers WHERE Closed = False AND SyndicateId = " + TheSessions.SyndicateId + "  AND (Imported = false) ORDER BY MemberName";
        }
        else
        {
            e.Command.CommandText = @"SELECT MemberId, MemberName FROM OldTBLMembers WHERE (SyndicateId = ?) AND (Imported = false) ORDER BY MemberName";
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (!MC.IsNullOrEmpty(cb.Value))
        {
            Response.Redirect("~/TBLMembers.aspx?mmo=" + cb.Value.ToString());
        }
    }
    protected void DSCDSyndicate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        else
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + TheSessions.SyndicateId;
    }
}
