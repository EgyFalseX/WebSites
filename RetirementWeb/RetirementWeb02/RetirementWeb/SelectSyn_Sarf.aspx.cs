using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SelectSyn_Sarf : System.Web.UI.Page
{
    dsMainTableAdapters.UserInfoTableAdapter adp = new dsMainTableAdapters.UserInfoTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblStatus.Text = "";
        //DataTable dt = mcRetirementWeb.LoadDataTable("SELECT TOP 1 dataname FROM UserInfo WHERE SyndicateId = " + lueSyn.Value, "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=App_Data/retdatalogin.mdb;Persist Security Info=True");
        object dataname = adp.GetdatanameBySyn(Convert.ToInt32(lueSyn.Value));

        if (dataname == null || dataname.ToString() == string.Empty)
        {
            lblStatus.Text = "لا يوجد بيانات للفرعية";
            lblStatus.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string connecionstring = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + MapPath("../App_Data/") + dataname +  ";Persist Security Info=True";

        DataTable NID = mcRetirementWeb.LoadDataTable("SELECT mnid, memberid FROM tblmember WHERE sarfno = " + tbSarf.Value, connecionstring);
        if (NID.Rows.Count == 0)
        {
            lblStatus.Text = "لا يوجد بيانات للفرعية";
            lblStatus.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (NID.Rows[0][0].ToString() != string.Empty)
        {
            lblStatus.Text = "تم تحديث البيانات";
            lblStatus.ForeColor = System.Drawing.Color.Green;
            return;
        }
        else
        {
            Response.Redirect("NIDGeneralEdit.aspx?id=" + NID.Rows[0][1].ToString() + "&db=" + dataname);
        }

    }
}