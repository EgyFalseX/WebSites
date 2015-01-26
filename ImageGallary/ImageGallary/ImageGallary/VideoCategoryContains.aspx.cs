using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoCategoryContains : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadData(Convert.ToInt32(Request.QueryString["id"]));
            }
            
        }
    }
    private void LoadData(int id)
    {
        dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
        dsImageGallary.VideoLinksDataTable tbl = adp.GetDataByVideoFolder(id);
        ASPxDataViewData.DataSource = tbl;
        ASPxDataViewData.DataBind();
    }
}