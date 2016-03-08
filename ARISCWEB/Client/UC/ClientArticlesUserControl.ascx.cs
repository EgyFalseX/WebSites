using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ClientArticlesUserControl : System.Web.UI.UserControl
    {
        //UploadImageUserControl up1 = null;
        string y = "";
    string text = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["Password"] == null))
                Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

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
            //string text = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex,"msgtext").ToString();
            //readMsgASPxMemo.Text = text; 
            //readMsgASPxPopupControl.ShowOnPageLoad = true;


            //string readed = Convert.ToString(ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "Readed"));
            //if (readed=="")
            //{
                HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["Read"] as GridViewDataColumn, "msgIDHiddenField");

                int x = Convert.ToInt32(hf.Value);
                
                Response.Redirect("ReadArticlesData.aspx?ArticleID=" + x);


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

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["ArDetails"] as GridViewDataColumn, "msgIDHiddenField");

            OleDbDataAdapter da = new OleDbDataAdapter("select ArticleDetailsFile from TBLFriendsArticles where ArticleID=" + hf.Value, DBConnectClass.conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
       
            ViewState["y"] = dt.Rows[0][0].ToString();
            if (File.Exists(ViewState["y"].ToString()))
            {

                StreamReader streamReader = new StreamReader(ViewState["y"].ToString());
                ViewState["text"] = streamReader.ReadToEnd();
               
                ASPxHtmlEditor ed = (ASPxHtmlEditor)ASPxGridView1.FindEditRowCellTemplateControl(ASPxGridView1.Columns["ArDetails"] as GridViewDataColumn, "ASPxHtmlEditor1");
                ed.Html = ViewState["text"].ToString();
               // ed.Settings.AllowPreview = true;
                ed.ActiveView = HtmlEditorView.Preview;


            }
         

        }
        protected void saveASPxButton_Click(object sender, EventArgs e)
        {
            HiddenField hf = (HiddenField)ASPxGridView1.FindRowCellTemplateControl(ASPxGridView1.FocusedRowIndex, ASPxGridView1.Columns["ArDetails"] as GridViewDataColumn, "msgIDHiddenField");

            ASPxHtmlEditor ed = (ASPxHtmlEditor)ASPxGridView1.FindEditRowCellTemplateControl(ASPxGridView1.Columns["ArDetails"] as GridViewDataColumn, "ASPxHtmlEditor1");

            string detailsFile = Server.MapPath("ArticleFiles\\" + hf.Value);
            
            File.WriteAllText(detailsFile, ed.Html);
            DSCdArticles.UpdateCommand = "update TBLFriendsArticles set ArticleDetailsFile='" + detailsFile + "' where ArticleID=" + hf.Value;
            DSCdArticles.Update();
        }
        protected void editASPxButton_Click(object sender, EventArgs e)
        {
            ASPxGridView1.StartEdit(ASPxGridView1.FocusedRowIndex);
        }
}
