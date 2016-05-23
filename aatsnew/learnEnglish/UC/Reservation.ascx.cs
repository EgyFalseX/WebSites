using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reservation : System.Web.UI.UserControl
{
    #region -   Variables   -

    #endregion
    #region -   Functions   -
    private void prepareDataSources()
    {
        DSCdcountry.DataFile = DB.AATSWEBPath;
        DSCdNationality.DataFile = DB.AATSWEBPath;
        DSMenuItem.DataFile = DB.AATSWEBPath;
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
        prepareDataSources();
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
                RCBCourseId.SelectedValue = Request.QueryString["id"];
        }
    }
    protected void LblTitle_Init(object sender, EventArgs e)
    {
        //if (Request.QueryString["id"] != null)
        //    LblTitle.Text = "حجز دورة " + DB.SelectCourseName(Request.QueryString["CourseId"].ToString());
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
        RCBCourseId.SelectedValue = string.Empty;
    }
    protected void RBtnSend_Click(object sender, EventArgs e)
    {
        //if (Request.QueryString["CourseId"] == null)
        //{
        //    DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
        //    return;
        //}
        string ResultMsg = DB.InsertTraineeLearnEnglish(RTxtTraineeName.Text, RTxtNameInEnglish.Text, RCBNationalityId.SelectedValue, RCBcountryId.SelectedValue, RTxtCity.Text, RTxtAddress.Text, RTxttel.Text, RTxtMobile.Text, RTxtEmail.Text
            , RTxtmony.Text, RTxtaccname.Text, RCBCourseId.SelectedValue);
        if (ResultMsg == string.Empty)
        {
            DisplayMessage("تم ارسال بيانات الحجز ولا يعتبر تسجيلكم مؤكداً إلا بعد تحويل رسوم الدورة ونرجو الاتصال على خدمة العملاء أو ارسال ايصال السداد فور تحويل الرسوم", false);
            RBtnClear_Click(RBtnClear, new EventArgs());
        }
        else
            DisplayMessage(ResultMsg, false);
    }
    #endregion

    
}