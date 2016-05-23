using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class ViewCourseDetails : System.Web.UI.UserControl
{
    #region -    Functions    -

    public string LoadContain()
    {
        if (Request.QueryString["CourseId"] == null || Request.QueryString["Courseitem"] == null)
            return string.Empty;
        string Path = DB.SelectCourseDataPath(Request.QueryString["CourseId"], Request.QueryString["Courseitem"]);

        if (Path == string.Empty)
            return string.Empty;
       
        //Path = MapPath(Path);
        if (!File.Exists(Path))
            return string.Empty;
        else
        {
            TextReader TR = new StreamReader(Path);
            string RetData = TR.ReadToEnd().ToString();
            TR.Close();
            TR.Dispose();
            return HttpUtility.HtmlDecode(RetData);
        }
    }
    public string GetSelectedCourseID()
    {
        string ReturnMe = string.Empty;
        if (Request.QueryString["CourseId"] != null)
            ReturnMe = "CourseId=" + Request.QueryString["CourseId"];
        else
            Response.Redirect("CourseViewer.aspx");
        return ReturnMe;
    }

    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["CourseId"] == null)
        {
            Response.Redirect("CourseViewer.aspx");
            return;
        }

        if (!IsPostBack)
        {
            for (int i = 1; i < RadPanelBarCourseItem.Items.Count; i++)
            {
                RadPanelBarCourseItem.Items[i].NavigateUrl += GetSelectedCourseID();
            }
        }
    }
   
    #endregion   
    
}