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


public partial class FriendArticlesDataUserControl : System.Web.UI.UserControl
    {
        //UploadImageUserControl up1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           // prepareDataSources();
            //UploadImageUserControl up = (UploadImageUserControl)FormView1.FindControl("UploadImageUserControl1");
            //UploadImageUserControl1 up = (UploadImageUserControl1)FormView1.FindControl("UploadImageUserControl1");
            if ((Session["UserName"] == null) || (Session["Password"] == null))
                Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
            
        }

        protected void LblTitle_Init(object sender, EventArgs e)
        {
            //if (Request.QueryString["CourseId"] != null)
            //    LblTitle.Text = "حجز دورة " + DB.SelectCourseName(Request.QueryString["CourseId"].ToString());
        }
        protected void RBtnClear_Click(object sender, EventArgs e)
        {

            titleASPxTextBox.Text = string.Empty;
            ASPxHtmlEditor1.Html = null;

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
            if (titleASPxTextBox.Text == string.Empty || ASPxHtmlEditor1.Html == null)
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
                //},

                string strInsert = @"Insert into TBLFriendsArticles(ArticleTitle,UserName) values('" + titleASPxTextBox.Text +"','"+Session["UserName"]+ "')";
                DBConnectClass conn = new DBConnectClass("AriscFriend.mdb");
                OleDbCommand cmd = new OleDbCommand(strInsert, DBConnectClass.conn);
             
                //friendsSqlDataSource.InsertCommand = "";
                //friendsSqlDataSource.InsertCommand = strInsert;
                //friendsSqlDataSource.Insert();
                cmd.ExecuteNonQuery();
                OleDbDataAdapter da = new OleDbDataAdapter("select max(ArticleID) from TBLFriendsArticles", DBConnectClass.conn);
                
                DataTable dt=new DataTable();
                da.Fill(dt);
                int id = Convert.ToInt32(dt.Rows[0][0]);


                string detailsFile = Server.MapPath("ArticleFiles\\" + id);

                File.WriteAllText(detailsFile, ASPxHtmlEditor1.Html);
                DSCdArticles.UpdateCommand = "update TBLFriendsArticles set ArticleDetailsFile='" + detailsFile + "' where ArticleID=" + id;
                DSCdArticles.Update();
                //if (ResultMsg != string.Empty)
                //{
                  
                   
                    DisplayMessage("تم الحفظ بنجاح", false);
                    readMsgASPxPopupControl.ShowOnPageLoad=true;
                    //RBtnClear_Click(RBtnClear, new EventArgs());
                //}
                //else
                //    DisplayMessage(ResultMsg, false);
            }

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
            contactUsMethod.FromEmail = "ahmed2test@gmail.com";
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
