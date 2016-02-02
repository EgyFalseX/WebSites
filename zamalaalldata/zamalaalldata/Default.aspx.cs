using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zamalaalldata_Default : System.Web.UI.Page
{
    dsMainTableAdapters.tblmembernidTableAdapter adp = new dsMainTableAdapters.tblmembernidTableAdapter();
    dsMainTableAdapters.UserInfoTableAdapter adpUser = new dsMainTableAdapters.UserInfoTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        sessionzamalaalldata.DatabaseName = adpUser.Getdataname(Convert.ToInt32(lueGov.Value));

        dsMain ds = new dsMain();
        if (adp.FillByGov_NID(ds.tblmembernid, Convert.ToByte(lueGov.Value), tbNID.Value.ToString()) > 0)
        {

            
        }
        else
        {
            int id = (int)adp.NewId();
            int effected = adp.Insert(id, Convert.ToByte(lueGov.Value), tbNID.Value.ToString());
            if (effected > 0)
            {
                Response.Redirect("EditData.aspx?id=" + id);
            }
            
        }
        
    }
}