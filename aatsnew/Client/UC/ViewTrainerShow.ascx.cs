using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewTrainerShow : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void prepareDataSources()
    {
        DSData.DataFile = DB.AATSWEBPath;
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        prepareDataSources();
    }
    protected void RBtnView_Click(object sender, EventArgs e)
    {
        RadListViewViewer.FilterExpressions.Clear();
        if (RCBItems.SelectedIndex > -1 && CBAll.Checked == false)
        {
            Telerik.Web.UI.RadListViewEqualToFilterExpression<Int32> expression1 = new Telerik.Web.UI.RadListViewEqualToFilterExpression<Int32>("Trainer_type_id");
            expression1.CurrentValue = Int32.Parse(RCBItems.SelectedValue);
            RadListViewViewer.FilterExpressions.Add(expression1);
        }
        RadListViewViewer.DataBind();

        //[Another Way]//RadListViewViewer.FilterExpressions.BuildExpression().Contains(XXX)
    }
    protected void btnNameSearch_Click(object sender, EventArgs e)
    {
        RadListViewViewer.FilterExpressions.Clear();
        if (tbSearch.Text.Trim() != string.Empty)
            RadListViewViewer.FilterExpressions.BuildExpression().Contains("TrainerName", tbSearch.Text.Trim()).Build();
        RadListViewViewer.DataBind();
    }
    #endregion

    
}