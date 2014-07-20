using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTrainee : System.Web.UI.UserControl
{
    #region -   Variables   -

    #endregion
    #region -   Functions   -
    private void prepareDataSources()
    {
        DSCdcountry.DataFile = DB.AATSWEBPath;
        DSCdNationality.DataFile = DB.AATSWEBPath;
    }
    public string GetSelectedCourseID()
    {
        string ReturnMe = string.Empty;
        if (Request.QueryString["CourseId"] != null)
            ReturnMe = "CourseId=" + Request.QueryString["CourseId"];
        else
            Response.Redirect("ViewCourseDetails.aspx");
        return ReturnMe;
    }
    private void DisplayMessage(string text, bool isError)
    {
        //RadGridEdit.Controls.Add(new LiteralControl(text));
        RadNotificationInfo.Text = text;

        if (isError)
        {
            RadNotificationInfo.Title = "خطــــــــاء";
            RadNotificationInfo.TitleIcon = "deny";
            RadNotificationInfo.ContentIcon = "deny";
        }
        else
        {
            RadNotificationInfo.Title = "تمت العمليه";
            RadNotificationInfo.TitleIcon = "info";
            RadNotificationInfo.ContentIcon = "info";
        }
        RadNotificationInfo.Show();
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["CourseId"] == null)
        {
            DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
            Response.Redirect("ViewCourseDetails.aspx");
        }
        prepareDataSources();
        
        if (!IsPostBack)
        {
            for (int i = 1; i < RadPanelBarCourseItem.Items.Count; i++)
            {
                RadPanelBarCourseItem.Items[i].NavigateUrl += GetSelectedCourseID();
            }
        }

    }
    protected void LblTitle_Init(object sender, EventArgs e)
    {
        if (Request.QueryString["CourseId"] != null)
            LblTitle.Text = "حجز دورة " + DB.SelectCourseName(Request.QueryString["CourseId"].ToString());
    }
    protected void RBtnClear_Click(object sender, EventArgs e)
    {
        RTxtTraineeName.Text = string.Empty;
        RTxtNameInEnglish.Text = string.Empty;
        RCBNationalityId.SelectedValue = null;
        RCBcountryId.SelectedValue = null;
        RTxtCity.Text = string.Empty;
        RTxtAddress.Text = string.Empty;
        RTxttel.Text = string.Empty;
        RTxtMobile.Text = string.Empty;
        RTxtEmail.Text = string.Empty;
        RTxtmony.Text = string.Empty;
        RTxtaccname.Text = string.Empty;
    }
    protected void RBtnSend_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CourseId"] == null)
        {
            DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
            return;
        }
        string ResultMsg = DB.InsertTrainee(RTxtTraineeName.Text, RTxtNameInEnglish.Text, RCBNationalityId.SelectedValue, RCBcountryId.SelectedValue, RTxtCity.Text, RTxtAddress.Text, RTxttel.Text, RTxtMobile.Text, RTxtEmail.Text, RTxtmony.Text, RTxtaccname.Text, Request.QueryString["CourseId"]);
        if (ResultMsg == string.Empty)
        {
            DisplayMessage("شكرا لك لقد تمت عملية تسجيلكم بالدورة وسيتم الاتصال بكم", false);
            RBtnClear_Click(RBtnClear, new EventArgs());
        }
        else
            DisplayMessage(ResultMsg, false);
    }
    #endregion

    
}