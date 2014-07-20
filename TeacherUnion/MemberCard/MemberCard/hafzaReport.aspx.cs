using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class hafzaReport : System.Web.UI.Page
{
    hafzaRpt rpt = new hafzaRpt();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberCard.IsAuth)
            Response.Redirect("~/MemberCard/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (ViewState["id"] != null)
        {
            LoadReport();
        }
        
    }
    private void LoadReport()
    {
        if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubSyn)
        {
            rpt.hafzaRptTableAdapter1.FillBySyndicateId_hafzaid(rpt.dsMemberCard1.hafzaRpt,
           Convert.ToInt16(sessionMemberCard.SyndicateId), Convert.ToInt16(ViewState["id"]));
        }
        else if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType)
        {
            rpt.hafzaRptTableAdapter1.FillByhafzaid_userin(rpt.dsMemberCard1.hafzaRpt,
          Convert.ToInt32(sessionMemberCard.UserID), Convert.ToInt16(ViewState["id"]));
        }
       
        rpt.FillDataSource();
        ReportViewerRPT.Report = rpt;
        ReportToolbar1.ReportViewer = ReportViewerRPT; 
    }
    protected void cb_ButtonClick(object source, DevExpress.Web.ASPxEditors.ButtonEditClickEventArgs e)
    {
        if (e.ButtonIndex == 0)
        {
            if (cb.Value != null)
            {
                string[] row = cb.SelectedItem.Text.Split(Convert.ToChar(";"));
                ViewState["id"] = row[0];
                AccessDSData.UpdateParameters[0].DefaultValue = TBNote.Text;
                AccessDSData.UpdateParameters[1].DefaultValue = row[0];
                AccessDSData.Update();
                //UpdateNotes(TBNote.Text, row[0]);
                LoadReport();
            }
        }
    }
    public static void UpdateNotes(string note, string id)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = mcMemberCard.ConnectionMemberCard;
        OleDbCommand cmd = new OleDbCommand("", con);

        cmd.CommandText = string.Format(@"UPDATE hafza Set note = '{0}' WHERE hafzaid = {1}", note, id);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            string exMsg = ex.Message;
        }
        finally
        {
            con.Close();
        }
    }

}