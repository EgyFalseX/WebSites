using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;

public partial class TBLMembersEditor : System.Web.UI.UserControl
{

    private void LoadInfo(object MemberId)
    {
        DataTable dt = mcEtsNorth.SelectTBLAllMember(MemberId);
        if (dt.Rows.Count == 0)
            Response.Redirect(Request.Url.ToString());

        DataRow row = dt.Rows[0];

        if (row["ModereaId"].ToString() != sessionsEtsNorth.ModereaId && sessionsEtsNorth.IsAdmin == false)
            Response.Redirect("~/AccessDenied.aspx");
        

        tbMemberName.Value = row["MemberName"];
        deBirthDate.Value = row["BirthDate"];
        cbMemberqualId.Value = row["MemberqualId"];
        dequalDate.Value = row["qualDate"];
        cbJobtitleID.Value = row["JobtitleID"];
        deWorkeDate.Value = row["WorkeDate"];
        tbMemberaddres.Value = row["Memberaddres"];
        tbMemberMobil.Value = row["MemberMobil"];
        tbMemberPhone.Value = row["MemberPhone"];
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["mmid"] != null)
            {
                LoadInfo(Request.QueryString["mmid"]);
            }
            else
                Response.Redirect(@"../ViewMemberOptions.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (mcEtsNorth.UpdateTBLAllMember(Request.QueryString["mmid"], tbMemberName.Value, deBirthDate.Value, cbMemberqualId.Value, 
                dequalDate.Value, cbJobtitleID.Value, deWorkeDate.Value, tbMemberaddres.Value, tbMemberMobil.Value, tbMemberPhone.Value))
            {
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم التعديل";
            }
        }
        catch (SqlException ex)
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = ex.Message;
        }
    }
    
}