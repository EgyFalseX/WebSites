using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoVideoViewer : System.Web.UI.Page
{
    #region init settings
    // player width
    private int _W = 550;

    // player height
    private int _H = 300;

    // autoplay disabled
    bool auto = false;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            LoadData(Convert.ToInt32(Request.QueryString["id"]));
        }

        if (Request.QueryString["vid"] != null)
            LoadVideo(Request.QueryString["vid"].ToString());
        else
        {
            dsImageGallaryTableAdapters.QueriesTableAdapter adp = new dsImageGallaryTableAdapters.QueriesTableAdapter();
            string id = adp.Get1stVideoByFolder(Convert.ToInt32(Request.QueryString["id"]));
            if (id != string.Empty)
                LoadVideo(id);
        }
        
    }
    private void LoadData(int id)
    {
        dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
        dsImageGallary.VideoLinksDataTable tbl = adp.GetDataByVideoFolder(id);
        ASPxDataViewData.DataSource = tbl;
        ASPxDataViewData.DataBind();
    }
    private void LoadVideo(string id)
    {
        dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
        lblDesc.Text = adp.GetLinkDesc(id);
        adp.UpdateVCount(id);
        lblvcount.Text = string.Format("مرات المشاهده {0}", adp.GetVCount(id).ToString());
        Literal1.Text = YouTubeScript.Get(id, auto, _W, _H);
    }
   
}