using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class MainVideoEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dsImageGallaryTableAdapters.QueriesTableAdapter adp = new dsImageGallaryTableAdapters.QueriesTableAdapter();
        adp.UpdateOptionMainVideo(txtLink.Text);
    }
}