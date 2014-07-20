using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class TrainershowViewer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        DSData.FilterExpression = null;
        if (CBSelectAll.Checked)
        {
            DSData.FilterExpression = "Trainer_type_id <> 0";
        }
        else if (CBFilter.SelectedIndex != -1)
        {
            DSData.FilterExpression = "Trainer_type_id = " + CBFilter.SelectedItem.Value;
        }
        DSData.DataBind();
        ASPxDataViewViewer.DataBind();
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        
    }
}