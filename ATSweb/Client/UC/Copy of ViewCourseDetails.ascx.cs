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
            return "<br><br><br>" + "حدد الدوره التدريبيه من القائمه ثم اضغط علي مفتاح اختر";
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
        return ReturnMe;
    }

    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 0; i < RadPanelBarCourseItem.Items.Count; i++)
            {
                RadPanelBarCourseItem.Items[i].NavigateUrl += GetSelectedCourseID();
                
            }
        }
    }
    protected void RCBCources_Init(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)sender;
        if (Request.QueryString["CourseId"] != null)
        {
            RCB.SelectedValue = Request.QueryString["CourseId"];
        }
       
    }
    protected void SelectCource_Click(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadButton btn = (Telerik.Web.UI.RadButton)sender;
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)btn.Parent.FindControl("RCBCources");

        if (DB.IsNullOrEmpty(RCB.SelectedValue))
        {
            Response.Redirect("ViewCourseDetails.aspx");
        }
        else
        {
            Response.Redirect("ViewCourseDetails.aspx?Courseitem=1&CourseId=" + RCB.SelectedValue);
        }
    }
    #endregion   
    
}