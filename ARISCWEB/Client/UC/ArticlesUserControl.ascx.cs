using DevExpress.Web.ASPxEditors;
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


public partial class ArticlesUserControl : System.Web.UI.UserControl
    {
        //UploadImageUserControl up1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
          

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
                //Session["msgid"] = x;
            //    //readMsgASPxMemo.Text  = ASPxGridView1.GetRowValues(ASPxGridView1.GetSelectedFieldValues(),"msgtext").ToString(); 


            //    string insertStr = "update tblmsgsyndicate set adminreaddate='" + DateTime.Now + "' where msgid=" + Convert.ToInt32(Session["msgid"]);
            //    readSqlDataSource.UpdateCommand = insertStr;
            //    readSqlDataSource.Update();
            //}

            Response.Redirect("ReadArticlesData.aspx?ArticleID="+x);
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
       
}
