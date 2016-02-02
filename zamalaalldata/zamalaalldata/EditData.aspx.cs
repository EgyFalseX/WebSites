using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class EditData : System.Web.UI.Page
{
    dsDataTableAdapters.tblalldataTableAdapter adp = new dsDataTableAdapters.tblalldataTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("Default.aspx");
            return;
        }
        dsEdaraId.DataFile = MapPath(@"~/App_Data/" + sessionzamalaalldata.DatabaseName);
        dsstateid.DataFile = MapPath(@"~/App_Data/" + sessionzamalaalldata.DatabaseName);

        tbID.Value = Request.QueryString["id"].ToString();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //lblStatus.Text = string.Empty;
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionzamalaalldata.DatabaseName);
        adp.Connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + MapPath("../App_Data/") + sessionzamalaalldata.DatabaseName + ";Persist Security Info=True");

        int memberid = Convert.ToInt32(Request.QueryString["id"]);
        dsMain.tblmembernidRow row = new dsMainTableAdapters.tblmembernidTableAdapter().GetDataByID(memberid)[0];
        int EdaraId = Convert.ToInt32(lueEdaraId.Value);
        DateTime taeendate = Convert.ToDateTime(detaeendate.Value);
        byte stateid = Convert.ToByte(luestateid.Value);
        Single salary = Convert.ToSingle(tbsalary.Value);
        int effected = adp.Insert(memberid, row.govid, EdaraId, tbmembername.Value.ToString(), taeendate, stateid, tbgeha.Value.ToString(), salary, tbmail.Value.ToString(), tbmobile.Value.ToString(), DateTime.Now);
        if (effected > 0)
            Response.Redirect("Done.aspx");
        //OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + MapPath("../App_Data/") + sessionzamalaalldata.DatabaseName + ";Persist Security Info=True");
    }
   
}