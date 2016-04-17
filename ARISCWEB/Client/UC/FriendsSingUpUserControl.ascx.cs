using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHiddenField;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class FriendsSingUpUserControl : System.Web.UI.UserControl
    {
        //UploadImageUserControl up1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           // prepareDataSources();
            //UploadImageUserControl up = (UploadImageUserControl)FormView1.FindControl("UploadImageUserControl1");
            //UploadImageUserControl1 up = (UploadImageUserControl1)FormView1.FindControl("UploadImageUserControl1");
            UploadImageUserControl1.GetFileNameEvent += up_GetFileNameEvent;
            UploadImageUserControl1.PathID = 1;
            UploadImageUserControl1.MFileSize = 100000;
            UploadImageUserControl1.FireEvent();
        }
        void up_GetFileNameEvent(string fileName)
        {
           // TextBox EventImageTextBox = (TextBox)FormView1.FindControl("EventImageTextBox");
            EventImageTextBox.Text = fileName;
          
            //Response.Redirect(Request.Url.ToString());
            //Image1.ImageUrl = "../" + fileName;
            //Response.Redirect(Request.Url.ToString());
        }
        protected void LblTitle_Init(object sender, EventArgs e)
        {
            //if (Request.QueryString["CourseId"] != null)
            //    LblTitle.Text = "حجز دورة " + DB.SelectCourseName(Request.QueryString["CourseId"].ToString());
        }
        protected void RBtnClear_Click(object sender, EventArgs e)
        {
            ClearForm();

        }

        private void ClearForm()
        {
            RTxtTraineeName.Text = string.Empty;
            RTxtNameInEnglish.Text = string.Empty;
            RCBCityId.Value = null;
            fieldRTxt.Text = string.Empty;
            facebookASPxTextBox.Text = string.Empty;
            genderASPxRadioButtonList.Value = string.Empty;
            phoneASPxTextBox.Text = string.Empty;
            emailASPxTextBox.Text = string.Empty;
            jobRTxt.Text = string.Empty;
            EventImageTextBox.Text = string.Empty;
            passwordASPxTextBox.Text = string.Empty;
          
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
        //        DisplayMessage("تم ارسال بيانات الحجز ولا يعتبر تسجيلكم مؤكداً إلا بعد تحويل رسوم الدورة ونرجو الاتصال على خدمة العملاء أو ارسال ايصال السداد فور تحويل الرسوم", false);
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
            RCBCityId.Value == null ||
            passwordASPxTextBox.Text == string.Empty ||
            fieldRTxt.Text == string.Empty ||
            phoneASPxTextBox.Text == string.Empty ||
            genderASPxRadioButtonList.Value  == null ||
            jobRTxt.Text==string.Empty ||
            emailASPxTextBox.Text == string.Empty||
                EventImageTextBox.Text==string.Empty)
            {
                DisplayMessage("من فضلك قم بإدخال جميع البيانات المطلوبة المميزة بـ(*)", false);
                readMsgASPxPopupControl.ShowOnPageLoad = true;
            }
            else
            {


                //    readSqlDataSource.InsertCommand = "insert into tblmsgsyndicateReplay values(" + Convert.ToInt32(Session["msgid"]) + "," + Convert.ToInt32(Session["SyndicateID"]) + ",'" + DateTime.Now + "','" + sendMsgASPxMemo.Text + "')";
                //    readSqlDataSource.Insert();
                //    replayMsgASPxPopupControl.ShowOnPageLoad = false;
                //}catch{}
                //if (Request.QueryString["CourseId"] == null)
                //{
                //    DisplayMessage("من فضلك اختار دوره قبل الارسال", false);
                //    return;
                //}
               
                string strInsert = @"Insert into TBLFriends(FriendArabicName,FriendEnglishName,GenderID,Mobile,Email,FacebookEmail,City,FieldText,JobName,Pass,Photo) values('" + RTxtTraineeName.Text + "','" + RTxtNameInEnglish.Text + "'," + genderASPxRadioButtonList.Value + ",'" + phoneASPxTextBox.Text + "','" + emailASPxTextBox.Text + "','" + facebookASPxTextBox.Text + "'," + RCBCityId.Value + ",'" + fieldRTxt.Text + "','" + jobRTxt.Text + "','" + passwordASPxTextBox.Text + "','" + EventImageTextBox.Text + "')";
                DBConnectClass conn = new DBConnectClass("AriscFriend.mdb");
                OleDbCommand cmd = new OleDbCommand(strInsert, DBConnectClass.conn);
             
                //friendsSqlDataSource.InsertCommand = "";
                //friendsSqlDataSource.InsertCommand = strInsert;
                //friendsSqlDataSource.Insert();
                cmd.ExecuteNonQuery();
                OleDbDataAdapter da = new OleDbDataAdapter("select max(FriendID) from TBLFriends", DBConnectClass.conn);
                
                DataTable dt=new DataTable();
                da.Fill(dt);
                string user = "arisc" + dt.Rows[0][0].ToString();


                da.SelectCommand.CommandText = "select FriendID,Pass,Email from TBLFriends where FriendID=" + dt.Rows[0][0].ToString();
                dt.Clear();
                dt.Columns.Clear();
              
                da.Fill(dt);
                int fID = Convert.ToInt32(dt.Rows[0][0]);
                string pass = dt.Rows[0][1].ToString();
                string mail = dt.Rows[0][2].ToString();

                //change pic name
                string[] paths = EventImageTextBox.Text.Split('/');
                string newpath = "../" + EventImageTextBox.Text.Substring(0, EventImageTextBox.Text.LastIndexOf("/")) + "/" + fID + ".jpg";
                File.Move(MapPath("../" + EventImageTextBox.Text), MapPath(newpath));
                

                friendsSqlDataSource.UpdateCommand = "update TBLFriends set username='" + user + "' where FriendID=" + fID.ToString();
                friendsSqlDataSource.Update();


                //if (ResultMsg != string.Empty)
                //{
                  
                    SendMail(user,pass,mail);
                    DisplayMessage("تم التسجيل بنجاح و تم إرسال رسالة لكم بمعلومات الدخول على بريدكم الالكتروني", false);
                    readMsgASPxPopupControl.ShowOnPageLoad=true;
                    ClearForm();
                    //RBtnClear_Click(RBtnClear, new EventArgs());
                //}
                //else
                //    DisplayMessage(ResultMsg, false);
            }

        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        private static void SendMail(string username,string password,string email)
        {
            MessagesClass contactUsMsgMethod = new MessagesClass();
            contactUsMsgMethod.contactUsMsg = "<div dir='rtl' style='font-weight:bold'>";
            contactUsMsgMethod.contactUsMsg += "تم التسجيل بنجاح" + "<br/>";
            contactUsMsgMethod.contactUsMsg += " إسم المستخدم: " + username + "<br/>";
            contactUsMsgMethod.contactUsMsg += " كلمة المرور: " + password + "<br/>"; 
            contactUsMsgMethod.contactUsMsg += " صفحتنا على الفيسبوك: " + "https://www.facebook.com/ariscweb/";
            contactUsMsgMethod.contactUsMsg += "</div>";
            SendEmailClass contactUsMethod = new SendEmailClass();
            contactUsMethod.IsArabic = true;
            contactUsMethod.FromEmail = "ariscwebinfo@gmail.com";
            contactUsMethod.ToEmail = email;
            contactUsMethod.Subject = "ARISC";
            contactUsMethod.Body = contactUsMsgMethod.GetContactUsMsg();
            contactUsMethod.SendEmailMethod();
        }
        protected void readASPxButton_Click(object sender, EventArgs e)
        {
            //string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex,"msgtext").ToString();
            //readMsgASPxMemo.Text = text; 
           // readMsgASPxPopupControl.ShowOnPageLoad = true;
           

            //int readed = Convert.ToInt32(ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "Readed"));
            //if (readed==0)
            //{

    
            //    //readMsgASPxMemo.Text  = ASPxGridView1.GetRowValues(ASPxGridView1.GetSelectedFieldValues(),"msgtext").ToString(); 


            //    string insertStr = "insert into readmsgsyndicate(msgid,SyndicateId,readdate) values(" + Convert.ToInt32(Session["msgid"]) + "," + Convert.ToInt32(Session["SyndicateID"]) + ",'" + DateTime.Now + "')";
            //    readSqlDataSource.InsertCommand = insertStr;
            //    readSqlDataSource.Insert();
            //}
        }
        protected void replayASPxButton_Click(object sender, EventArgs e)
        {

          //  replayMsgASPxPopupControl.ShowOnPageLoad = true;
            

      
           


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
        protected void RBtnOk_Click(object sender, EventArgs e)
        {
            readMsgASPxPopupControl.ShowOnPageLoad = false;
         
        }

}
