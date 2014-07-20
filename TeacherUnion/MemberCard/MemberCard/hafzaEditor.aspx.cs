using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class hafzaEditor : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberCard.IsAuth)
        {
            Response.Redirect("~/MemberCard/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        DataView DV = (DataView)DSMembers.Select(DataSourceSelectArguments.Empty);
        lblMemberCount.Text = DV.Count.ToString();
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;
        if (deDate.Value == null)
        {
            lblState.Text = "يجب ادخال التاريخ";
            lblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        try
        {
            DataView DV = (DataView)DSMembers.Select(DataSourceSelectArguments.Empty);
            dsMemberCardTableAdapters.hafzaTableAdapter adp = new dsMemberCardTableAdapters.hafzaTableAdapter();
            dsMemberCardTableAdapters.TBLAllMemberCloseTableAdapter adpClose = new dsMemberCardTableAdapters.TBLAllMemberCloseTableAdapter();

            int id = (int)adp.ScalarQueryNewID();

            for (int i = 0; i < DV.Count; i++)
            {
                adp.Insert(id, Convert.ToInt16(sessionMemberCard.SyndicateId), Convert.ToInt32(DV[i]["MemberId"]),
                    deDate.Date, string.Empty, Convert.ToInt32(sessionMemberCard.UserID));
                adpClose.Update(Convert.ToInt32(DV[i]["MemberId"]));

            }
            lblState.Text = "تم الاعداد بنجاح";
            lblState.ForeColor = System.Drawing.Color.Green;
            deDate.Value = null;
        }
        catch (Exception ex)
        {
            lblState.Text = ex.Message;
            lblState.ForeColor = System.Drawing.Color.Red;
        }
        
    }

}