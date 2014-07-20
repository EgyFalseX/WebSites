using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Selecttbladv : System.Web.UI.Page
{
    dsAdvetsTableAdapters.tbladvTableAdapter adp = new dsAdvetsTableAdapters.tbladvTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuthadvets)
        {
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!TheSessions.IsAdminadvets)
            cbSyndicateId.Enabled = false;
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (!TheSessions.IsAdminadvets)
        {
            e.Command.CommandText = @"SELECT tbladv.Id, tbladv.advdate & ' - ' & CDIdType.IdType & ' - ' & tbladv.[number] AS Details
                                    FROM (tbladv LEFT OUTER JOIN CDIdType ON tbladv.IdTypeId = CDIdType.IdTypeId)
                                    WHERE tbladv.SyndicateId = " + TheSessions.SyndicateIdadvets;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;
        if (!MC.IsNullOrEmpty(cb.Value))
        {
            if (!TheSessions.IsAdminadvets)
            {
                if (adp.ScalarQueryAdminReaded(Convert.ToInt32(cb.Value)) == 1)
                {
                    TheSessions.tbladvEditId = Convert.ToInt32(cb.Value);
                    Response.Redirect("tbladvEditor.aspx");
                }
                else
                {
                    lblState.Text = "لا يمكن التعديل";
                }
            }
            
        }
    }
    protected void DSCDSyndicate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdminadvets)
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        else
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + TheSessions.SyndicateIdadvets;
    }
}