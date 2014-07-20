using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoViewer : System.Web.UI.Page
{
    dsImageGallaryTableAdapters.VideoLinksTableAdapter adp = new dsImageGallaryTableAdapters.VideoLinksTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ASPxTreeListData_FocusedNodeChanged(object sender, EventArgs e)
    {
        object id = ASPxTreeListData.FocusedNode.GetValue("Id");
        Response.Redirect("VideoCategoryContains.aspx?id=" + id);

    }
}