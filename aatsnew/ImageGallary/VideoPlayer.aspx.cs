using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoPlayer : System.Web.UI.Page
{
    #region init settings
    // player width
    private int _W = 640;

    // player height
    private int _H = 505;

    // autoplay disabled
    bool auto = false;
    #endregion

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
                lblDesc.Text = adp.GetLinkDesc(Request.QueryString["id"].ToString());
                adp.UpdateVCount(Request.QueryString["id"].ToString());
                lblvcount.Text = string.Format("مرات المشاهده {0}", adp.GetVCount(Request.QueryString["id"].ToString()).ToString());
                Literal1.Text = YouTubeScript.Get(Request.QueryString["id"], auto, _W, _H);
            }
        }

    }
    #region User events
    /// <summary>
    /// Script to start video at predefined time, change border color
    /// </summary>
    protected void Button1_Click(object sender, EventArgs e)
    {
        // set start time = 15 sec, change border colors
        //Literal1.Text = YouTubeScript.Get(cmbPlaylist.SelectedValue, true, _W, _H, true, "maroon", "", 10);
    }

    /// <summary>
    /// Script to start video at predefined time, remove border
    /// </summary>
    protected void Button2_Click(object sender, EventArgs e)
    {
        // set start time = 60 sec, remove border
        //Literal1.Text = YouTubeScript.Get(cmbPlaylist.SelectedValue, true, _W, _H, false, "", "", 60);
    }
    #endregion
    protected void btnBacktoCategory_Click(object sender, EventArgs e)
    {
        dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
        int id = (int)adp.GetLinkVideoFolder(Request.QueryString["id"].ToString());
        Response.Redirect("VideoVideoViewer.aspx?id=" + id);

    }
}