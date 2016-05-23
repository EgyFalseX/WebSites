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
    private int _W = 450;

    // player height
    private int _H = 300;

    // autoplay disabled
    bool auto = false;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadData(Convert.ToInt32(Request.QueryString["id"]));
            }
            if (Request.QueryString["vid"] != null)
            {
                LoadVideo(Request.QueryString["vid"].ToString());
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
    private void LoadVideo(string id)
    {
        dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
        lblDesc.Text = adp.GetLinkDesc(Request.QueryString["vid"].ToString());
        adp.UpdateVCount(Request.QueryString["vid"].ToString());
        lblvcount.Text = string.Format("مرات المشاهده {0}", adp.GetVCount(Request.QueryString["vid"].ToString()).ToString());
        Literal1.Text = YouTubeScript.Get(Request.QueryString["vid"], auto, _W, _H);
    }
   
}