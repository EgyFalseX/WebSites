using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHiddenField;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ViewCourseDetailsUserControl : System.Web.UI.UserControl
    {
        //UploadImageUserControl up1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            prepareDataSources();

        }

        protected void LblTitle_Init(object sender, EventArgs e)
        {
            //if (Request.QueryString["CourseId"] != null)
            //    LblTitle.Text = "حجز دورة " + DB.SelectCourseName(Request.QueryString["CourseId"].ToString());
        }
        protected void RBtnClear_Click(object sender, EventArgs e)
        {
            RTxtTraineeName.Text = string.Empty;
            RTxtNameInEnglish.Text = string.Empty;
            RCBNationalityId.Value = null;
            RCBcountryId.Value  = null;
            RTxtCity.Text = string.Empty;
            RTxtAddress.Text = string.Empty;
            genderASPxRadioButtonList.Value= string.Empty;
            RTxtMobile.Text = string.Empty;
            RTxtEmail.Text = string.Empty;
            jobRTxt.Text = string.Empty;

        }
        protected void RBtnSend_Click(object sender, EventArgs e)
        {
        //    if (Request.QueryString["CourseId"] == null)
        //    {
        //        DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
        //        return;
        //    }
        //    string ResultMsg = DB.InsertTrainee(RTxtTraineeName.Text, RTxtNameInEnglish.Text, RCBNationalityId.Value.ToString(), RCBcountryId.Value.ToString(), RTxtCity.Text, RTxtAddress.Text, RTxttel.Text, RTxtMobile.Text, RTxtEmail.Text, RTxtmony.Text, RTxtaccname.Text, Request.QueryString["CourseId"]);
        //    if (ResultMsg == string.Empty)
        //    {
        //        DisplayMessage("تم ارسال بيانات الحجز ", false);
        //        RBtnClear_Click(RBtnClear, new EventArgs());
        //    }
        //    else
        //        DisplayMessage(ResultMsg, false);
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            
                

        }

        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
          
         
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "Update")
            //{
            //    up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex].FindControl("UploadImageUserControl1");

            //    up1.GetFileNameEvent += up1_GetFileNameEvent;
            //    up1.FireEvent();
            //}
        }
        //void up1_GetFileNameEvent(string fileName)
        //{
        //    TextBox tx = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("TextBox1");
        //    tx.Text = fileName;
        //}
        protected void ASPxGridView1_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

        }
        protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {

        }
        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {

        }
        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
           // Session["ChassisID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void yesDeleteASPxButton_Click(object sender, EventArgs e)
        {
            //replaySqlDataSource.InsertCommand = "Insert into tblmsgsyndicateReplay values(" + Session["ChassisID"] +
            //replaySqlDataSource.Insert();
            //try
            //{
            if (RTxtTraineeName.Text == string.Empty || RTxtNameInEnglish.Text == string.Empty ||
            RCBNationalityId.Value == null ||
            RCBcountryId.Value == null ||
            RTxtCity.Text == string.Empty ||
            genderASPxRadioButtonList.Value  == string.Empty ||
            RTxtMobile.Text == string.Empty ||
            jobRTxt.Text==string.Empty ||
            RTxtEmail.Text == string.Empty)
            {
                DisplayMessage("من فضلك قم بإدخال جميع البيانات المطلوبة المميزة بـ(*)", false);
            }
            else
            {
                HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Replay"] as GridViewDataColumn, "msgIDHiddenField");

                int x = Convert.ToInt32(hf.Value);
                Session["msgid"] = x;


                //    readSqlDataSource.InsertCommand = "insert into tblmsgsyndicateReplay values(" + Convert.ToInt32(Session["msgid"]) + "," + Convert.ToInt32(Session["SyndicateID"]) + ",'" + DateTime.Now + "','" + sendMsgASPxMemo.Text + "')";
                //    readSqlDataSource.Insert();
                //    replayMsgASPxPopupControl.ShowOnPageLoad = false;
                //}catch{}
                //if (Request.QueryString["CourseId"] == null)
                //{
                //    DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
                //    return;
                //}
                string ResultMsg = DB.InsertTrainee(RTxtTraineeName.Text, RTxtNameInEnglish.Text, RCBNationalityId.Value.ToString(),Convert.ToInt32(genderASPxRadioButtonList.Value) , RCBcountryId.Value.ToString(), RTxtCity.Text, RTxtAddress.Text, jobRTxt.Text, RTxtMobile.Text, RTxtEmail.Text, Session["msgid"].ToString());
                if (ResultMsg == string.Empty)
                {
                    DisplayMessage("تم ارسال بيانات الحجز ولا يعتبر تسجيلكم مؤكداً إلا بعد سداد رسوم الدورة (في حالة الدورات غير المجانية )ونرجو الاتصال على خدمة العملاء للمزيد من المعلومات", false);
                    RBtnClear_Click(RBtnClear, new EventArgs());
                }
                else
                    DisplayMessage(ResultMsg, false);
            }

        }
        protected void readASPxButton_Click(object sender, EventArgs e)
        {
            //string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex,"msgtext").ToString();
            //readMsgASPxMemo.Text = text; 
           // readMsgASPxPopupControl.ShowOnPageLoad = true;
           

            //int readed = Convert.ToInt32(ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "Readed"));
            //if (readed==0)
            //{
              HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Details"] as GridViewDataColumn, "msgIDHiddenField");

              int x = Convert.ToInt32(hf.Value);
              Session["msgid"] = x;
              Response.Redirect("ViewCourseDetailsTextUserControl.aspx?CourseID=" + Session["msgid"]);
            //    //readMsgASPxMemo.Text  = ASPxGridView1.GetRowValues(ASPxGridView1.GetSelectedFieldValues(),"msgtext").ToString(); 


            //    string insertStr = "insert into readmsgsyndicate(msgid,SyndicateId,readdate) values(" + Convert.ToInt32(Session["msgid"]) + "," + Convert.ToInt32(Session["SyndicateID"]) + ",'" + DateTime.Now + "')";
            //    readSqlDataSource.InsertCommand = insertStr;
            //    readSqlDataSource.Insert();
            //}
        }
        protected void replayASPxButton_Click(object sender, EventArgs e)
        {

            replayMsgASPxPopupControl.ShowOnPageLoad = true;
            

        }
        protected void fileASPxButton_Click(object sender, EventArgs e)
        {
            string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "msgfilepath").ToString();
            if (text != "" && text != null)
            {
                FileInfo fileInfo = new FileInfo(Server.MapPath(text));

                if (fileInfo.Exists)
                {
                    System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                    response.ClearContent();
                    response.Clear();
                    response.ContentType = "text/plain";
                    response.AddHeader("Content-Disposition",
                                       "attachment; filename=" + text + ";");
                    response.TransmitFile(Server.MapPath(text));
                    response.Flush();
                    response.End();
                }
            }
           


        }
        private void prepareDataSources()
        {
            DSCdcountry.DataFile = DB.AATSWEBPath;
            DSCdNationality.DataFile = DB.AATSWEBPath;
        }
        //public string GetSelectedCourseID()
        //{
        //    //string ReturnMe = string.Empty;
        //    //if (Request.QueryString["CourseId"] != null)
        //    //    ReturnMe = "CourseId=" + Request.QueryString["CourseId"];
        //    //else
        //    //    Response.Redirect("ViewCourseDetails.aspx");
        //    //return ReturnMe;
        //}
        private void DisplayMessage(string text, bool isError)
        {
           // RadGridEdit.Controls.Add(new LiteralControl(text));
            msgLabel.Text = text;
            //RadNotificationInfo.Text = text;

            //if (isError)
            //{
            //    RadNotificationInfo.Title = "خطــــــــاء";
            //    RadNotificationInfo.TitleIcon = "deny";
            //    RadNotificationInfo.ContentIcon = "deny";
            //}
            //else
            //{
            //    RadNotificationInfo.Title = "تمت العمليه";
            //    RadNotificationInfo.TitleIcon = "info";
            //    RadNotificationInfo.ContentIcon = "info";
            //}
            //RadNotificationInfo.Show();
        }
}
