using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CPSliderUserControl : System.Web.UI.UserControl
    {
        string keyValue;
        //UploadImageUserControl up;
        UploadImageUserControl up1=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadImageUserControl up = (UploadImageUserControl)FormView1.FindControl("UploadImageUserControl1");
           
            up.GetFileNameEvent += up_GetFileNameEvent;
            up.PathID = 2;
            up.MFileSize = 200000;
            up.SetImageHeight = 380;
            up.SetImageWidth = 980;
            up.FireEvent();

  
           // //ViewState["PathID"] = 2;
           // //ViewState["MFileSize"] = 200000;
           // //ViewState["SetImageHeight"] = 380;
           // //ViewState["SetImageWidth"] = 980;




       


        }


        void up1_GetFileNameEvent(string fileName)
        {
            TextBox tx = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("EventImageTextBox");
            tx.Text = fileName;

        }

        //void up_GetFileNameEvent1(string fileName)
        //{
        //    TextBox tx = (TextBox)GridView1.FindControl("EventImageTextBox");
        //    tx.Text = fileName;
        //}
        void up_GetFileNameEvent(string fileName)
        {
            TextBox tx = (TextBox)FormView1.FindControl("EventImageTextBox");
            tx.Text = fileName;
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            
                

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            msgLabel.Text = "تم الحفظ بنجاح";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            //if(e.CommandName=="Details")
            //{
            //    string x = e.CommandArgument.ToString();
            //  //  string x = GridView1.Rows[0].Cells[0].Text;
            //    string id = GridView1.SelectedRow.Cells[0].Text;

            //    //string id=GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
            //    Response.Redirect("~/ControlPanel/CPSliderDetails.aspx?ID="+id);
            //}

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Edit")
            {
                //    GridView1.SelectRow(Convert.ToInt32(e.CommandArgument));
                //int c = Convert.ToInt32(e.CommandArgument);

                //up1 = (UploadImageUserControl)GridView1.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("UploadImageUserControl1");
                //up1.PathID = 2;
                //up1.MFileSize = 200000;
                //up1.SetImageHeight = 380;
                //up1.SetImageWidth = 980;


            }
            if (e.CommandName == "Update")
            {
                up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex].FindControl("UploadImageUserControl1");

                up1.GetFileNameEvent += up1_GetFileNameEvent;
                up1.FireEvent();
            }
            if (e.CommandName == "Select")
            {
                string x = e.CommandArgument.ToString();
                string id=GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                //Response.Write("<script>");
                //Response.Write(String.Format("window.open('{0}','_blank')","CPSliderDetails.aspx?ID=" + id));
                //Response.Write("</script>");

               // Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('CPSliderDetails.aspx?ID=" + id + "','_newtab');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.open('CPSliderDetails.aspx?ID=" + id +"');", true);
            }

            if (e.CommandName == "DeleteCommand")
            {
                keyValue = GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "Confirm();", true);
                //Response.Write("<script type='text/javascript'> var x=window.confirm('هل أنت متأكد من الحذف؟'); if(x==false){ return;}</script>");
               
                //GridView1.SelectedRow.Cells[]
               
            }
            //if (e.CommandName == "Edit")
            //{
            //    UploadImageUserControl up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex+1].FindControl("UploadImageUserControl1");
            //    up1.GetFileNameEvent += up1_GetFileNameEvent;
            //    up1.PathID = Convert.ToInt32(ViewState["PathID"]);
            //    up1.MFileSize = Convert.ToInt32(ViewState["MFileSize"]);
            //    up1.SetImageHeight = Convert.ToInt32(ViewState["SetImageHeight"]);
            //    up1.SetImageWidth = Convert.ToInt32(ViewState["SetImageWidth"]);
            //}
        }

        [WebMethod]
        public static void CallFunction()
        {
            CPSliderUserControl f = new CPSliderUserControl();
            f.functionA();
       
        }

        public void functionA()
        {
            if (confirmBox())
                functionB(true, keyValue);
            else
                functionB(false, keyValue);
        }
        public bool confirmBox()
        {
            bool flag = false;
            if (HiddenField1.Value.ToLower() == "ok")
            {
                flag = true;
            }
            return flag;
        }
        public void functionB(bool flag,string rowValue)
        {
            if (flag)
            {
                Response.Write("Ok is Clicked");

                Parameter p = new Parameter("@ID", DbType.Int32);
                p.DefaultValue = rowValue ;
                SqlDataSource1.DeleteParameters[0] = p;
                SqlDataSource1.Delete();
                SqlDataSource1.DataBind();
                
            }
            else
            {
                Response.Write("Cancel is Clicked");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex].FindControl("UploadImageUserControl1");
            //up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex].FindControl("UploadImageUserControl1");
            //up1.GetFileNameEvent += up1_GetFileNameEvent;
            
            //up1.FireEvent();
           // TextBox tx = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("EventImageTextBox");
           // tx.Text = fileName;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //UploadImageUserControl up1 = (UploadImageUserControl)GridView1.Rows[GridView1.EditIndex].FindControl("UploadImageUserControl1");
            //up1.GetFileNameEvent += up1_GetFileNameEvent;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
         
        }
    }
