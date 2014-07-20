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
        if (!sessionMemberCard.IsAuth)
        {
            Response.Redirect("~/MemberCard/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!sessionMemberCard.IsAdmin)
            cbSyndicateId.Enabled = false;
        if (!IsPostBack)
        {
            if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType)
                cbSyndicateId.Enabled = false;
        }
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //if (!sessionMemberCard.IsAdmin)
        //{
        //    e.Command.CommandText = "SELECT [MemberId], [MemberName] FROM [TBLAllMember] WHERE Closed = 'False' AND SyndicateId = " + sessionMemberCard.SyndicateId;
        //}
        if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType || sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubSyn)
            e.Command.CommandText = "SELECT [MemberId], [MemberName] FROM [TBLAllMember] WHERE userin = " + sessionMemberCard.UserID;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (!mcMemberCard.IsNullOrEmpty(cb.Value))
        {
            Response.Redirect("TBLAllMember.aspx?mm=" + cb.Value.ToString());
        }
    }
    protected void DSCDSyndicate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (sessionMemberCard.IsAdmin)
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        else
        {
            cbSyndicateId.Value = sessionMemberCard.SyndicateId;
        }
    }
}