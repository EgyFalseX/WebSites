using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlanViewer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DSData.FilterExpression = string.Empty;

        if (cbCDLagna.SelectedItem != null)
        {
            DSData.FilterExpression += "LagnaId = " + cbCDLagna.SelectedItem.Value;
        }
        if (cbCDLagnaNoaea.SelectedItem != null)
        {
            if (DSData.FilterExpression != string.Empty)
                DSData.FilterExpression += " AND LagnaNoaeaId = " + cbCDLagnaNoaea.SelectedItem.Value;
            else
                DSData.FilterExpression = "LagnaNoaeaId = " + cbCDLagnaNoaea.SelectedItem.Value;
        }
        if (cbcdyear.SelectedItem != null)
        {
            if (DSData.FilterExpression != string.Empty)
                DSData.FilterExpression += " AND yearId = " + cbcdyear.SelectedItem.Value;
            else
                DSData.FilterExpression = "yearId = " + cbcdyear.SelectedItem.Value;
        }
        if (cbcdmonth.SelectedItem != null)
        {
            if (DSData.FilterExpression != string.Empty)
                DSData.FilterExpression += " AND monthId = " + cbcdmonth.SelectedItem.Value;
            else
                DSData.FilterExpression = " monthId = " + cbcdmonth.SelectedItem.Value;
        }

        DSData.DataBind();
        GVEditor.DataBind();
        GVEditor.Visible = true;
    }
}
