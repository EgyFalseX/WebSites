using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zdataNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        dsData.DataFile = MapPath(@"~/App_Data/" + TheSessionsZamala.dbName);
        if (!TheSessionsZamala.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;
        tbNAME.Validate(); debdate.Validate(); detaeendate.Validate(); tbsalary.Validate();
        if (!tbNAME.IsValid || !debdate.IsValid || !detaeendate.IsValid || !tbsalary.IsValid )
            return;
        string Id = MCZamala.GetNewID("zdata", "memberid");
        dsData.InsertParameters["memberid"].DefaultValue = Id;
        dsData.InsertParameters["NAME"].DefaultValue = tbNAME.Value.ToString();
        dsData.InsertParameters["bdate"].DefaultValue = debdate.Value.ToString();
        dsData.InsertParameters["taeendate"].DefaultValue = detaeendate.Value.ToString();
        dsData.InsertParameters["salary"].DefaultValue = tbsalary.Value.ToString();
        if (dsData.Insert() > 0)
        {
            lblState.Text = "تم الحفظ";
            lblState.ForeColor = System.Drawing.Color.Green;
            tbNAME.Value = string.Empty;
            debdate.Value = string.Empty;
            detaeendate.Value = string.Empty;
            tbsalary.Value = string.Empty;
            tbNAME.Focus();
        }
        else
        {
            lblState.Text = "خطاء لو يتم الحفظ";
            lblState.ForeColor = System.Drawing.Color.Red;

        }

    }
}