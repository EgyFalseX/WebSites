using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHiddenField;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CPFilesUserControl : System.Web.UI.UserControl
    {

        UploadFileUserControl up = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if(!Page.IsPostBack)
            //   ViewState["path"] = "UploadFiles\\";

            if ((Session["UserName"] == null) || (Session["Password"] == null) || (Session["IsAdmin"] == null))
                Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

            if (!IsPostBack)
            {
                UploadFileUserControl2.PathID = 1;

                UploadFileUserControl2.GetFileNameEvent += UploadFileUserControl2_GetFileNameEvent;
                UploadFileUserControl2.PathName = fileAddPathTextBox.Text;
                UploadFileUserControl2.MFileSize = 100000;
                UploadFileUserControl2.FireEvent();
            }
            //    for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            //    {
            //         up = (UploadFileUserControl)ASPxGridView1.FindRowCellTemplateControl(i, (GridViewDataColumn)ASPxGridView1.Columns["IMG"], "UploadFileUserControl1");
            //         TextBox txImage = (TextBox)ASPxGridView1.FindRowCellTemplateControl(i, (GridViewDataColumn)ASPxGridView1.Columns["IMG"], "filePathTextBox");
                   
            //if(txImage.Text=="")
            //    txImage.Text = ViewState["path"].ToString();
         

            //up.PathName = txImage.Text;
            //        up.GetFileNameEvent += up_GetFileNameEvent;
            //        up.PathID = 1;
            //        up.MFileSize = 100000;
            //        up.FireEvent(txImage.Text);
            //    }

            
           // up.SetImageHeight= 380;
           // up.SetImageWidth = 980;
         
            
           // TextBox tx = (TextBox)FormView1.FindControl("DateTextBox");
          //  tx.Text = DateTime.Now.Date.ToString();

           // TextBox txImage = (TextBox)FormView1.FindControl("EventImageTextBox");



          

        }

        void UploadFileUserControl2_GetFileNameEvent(string fileName)
        {
            fileAddPathTextBox.Text = fileName;
        }

       
           // }



        void up_GetFileNameEvent(string fileName)
        {
            ASPxTextBox txImage = (ASPxTextBox)ASPxGridView1.FindEditRowCellTemplateControl((GridViewDataColumn)ASPxGridView1.Columns["IMG"], "filePathTextBox");

            txImage.Text = fileName;
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
            //    HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Replay"] as GridViewDataColumn, "msgIDHiddenField");

            //    int x = Convert.ToInt32(hf.Value);
            //    Session["msgid"] = x;


            //    readSqlDataSource.UpdateCommand = "update tblmsgsyndicate set msgadminreplay='" + sendMsgASPxMemo.Text + "' where msgid=" + Convert.ToInt32(Session["msgid"]);
            //    readSqlDataSource.Update();
            //    replayMsgASPxPopupControl.ShowOnPageLoad = false;
            //}catch{}

        }
        protected void readASPxButton_Click(object sender, EventArgs e)
        {
            //string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "msgtext").ToString();
         
            HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Read"] as GridViewDataColumn, "msgIDHiddenField");

            int x = Convert.ToInt32(hf.Value);
            //readMsgASPxMemo.Text = text; 
            //readMsgASPxPopupControl.ShowOnPageLoad = true;
            Response.Redirect("../Client/ReadArticlesData.aspx?ArticleID=" + x);

            //string readed = Convert.ToString(ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "Readed"));
            //if (readed=="")
            //{
            //    HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Read"] as GridViewDataColumn, "msgIDHiddenField");

            //    int x = Convert.ToInt32(hf.Value);
            //    Session["msgid"] = x;
            //    //readMsgASPxMemo.Text  = ASPxGridView1.GetRowValues(ASPxGridView1.GetSelectedFieldValues(),"msgtext").ToString(); 


            //    string insertStr = "update tblmsgsyndicate set adminreaddate='" + DateTime.Now + "' where msgid=" + Convert.ToInt32(Session["msgid"]);
            //    readSqlDataSource.UpdateCommand = insertStr;
            //    readSqlDataSource.Update();
            //}
        }
        protected void replayASPxButton_Click(object sender, EventArgs e)
        {

            replayMsgASPxPopupControl.ShowOnPageLoad = true;
            

        }
        protected void fileASPxButton_Click(object sender, EventArgs e)
        {
            //string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "msgfilepath").ToString();
            //if (text != "" && text != null)
            //{
            //    FileInfo fileInfo = new FileInfo(Server.MapPath(text));

            //    if (fileInfo.Exists)
            //    {
            //        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            //        response.ClearContent();
            //        response.Clear();
            //        response.ContentType = "text/plain";
            //        response.AddHeader("Content-Disposition",
            //                           "attachment; filename=" + text + ";");
            //        response.TransmitFile(Server.MapPath(text));
            //        response.Flush();
            //        response.End();
            //    }
            //}
           


        }
        protected void isActiveASPxCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            //ASPxCheckBox ch = (ASPxCheckBox)sender;

            //string id = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "FileID").ToString();
            //filesSqlDataSource.UpdateCommand = "update TBLFriendsArticles set IsDisplay=" + ch.Checked + " where ArticleID=" + id;
            //filesSqlDataSource.Update();
        }
        protected void saveASPxButton_Click(object sender, EventArgs e)
        {
            //string id = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "FileID").ToString();
            //TextBox ImageTextBox = (TextBox)ASPxGridView1.FindEditRowCellTemplateControl(ASPxGridView1.Columns["IMG"] as GridViewDataColumn, "filePathTextBox");
            //filesSqlDataSource.UpdateCommand = "update TBLFiles set FilePath='" + ImageTextBox.Text  + "' where FileID=" + id;
            //filesSqlDataSource.Update();
        }
        protected void saveAddASPxButton_Click(object sender, EventArgs e)
        {
            if (fileAddPathTextBox.Text.Trim() != "")
            {
                filesSqlDataSource.InsertCommand = "insert into TBLFiles(FileTitle,FileText,FilePath,FileCategoryID,UserName) values('" + titleASPxTextBox.Text + "','" + textASPxMemo.Text + "','" + fileAddPathTextBox.Text + "'," + categComboBox.Value + ",'" + Session["UserName"] + "')";
                filesSqlDataSource.Insert();
                msgASPxLabel.ForeColor = Color.Green;
                msgASPxLabel.Text = "تم الحفظ بنجاح";
            }
            else
            {
                msgASPxLabel.ForeColor = Color.Red;
                msgASPxLabel.Text = "يجب إدخال الملف";
            }
        }
        protected void cleanASPxButton_Click(object sender, EventArgs e)
        {
            CleanForm();

        }

        private void CleanForm()
        {
            msgASPxLabel.Text = "";
            fileAddPathTextBox.Text = "";
            titleASPxTextBox.Text = "";
            textASPxMemo.Text = "";
            categComboBox.Value = null;
        }
        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
           
        }
        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            //if (e.CommandArgs.CommandName=="Update")
            //{
 up = (UploadFileUserControl)ASPxGridView1.FindEditRowCellTemplateControl((GridViewDataColumn)ASPxGridView1.Columns["IMG"], "UploadFileUserControl1");
            ASPxTextBox txImage = (ASPxTextBox)ASPxGridView1.FindEditRowCellTemplateControl((GridViewDataColumn)ASPxGridView1.Columns["IMG"], "filePathTextBox");

            //if (txImage.Text == "")
            //    txImage.Text = ViewState["path"].ToString();

            up.PathID = 1;  
            up.GetFileNameEvent += up_GetFileNameEvent;
            up.PathName = txImage.Text;

          
            up.MFileSize = 100000;
            up.FireEvent();

           // }
        }
}
