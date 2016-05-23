using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewConcilor : System.Web.UI.UserControl
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
    #endregion
    
}