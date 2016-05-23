using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class CPNewsUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadImageUserControl1 up = (UploadImageUserControl1)FormView1.FindControl("UploadImageUserControl1");
            up.GetFileNameEvent += up_GetFileNameEvent;
            up.PathID = 2;
            up.MFileSize = 200000;
            up.SetImageHeight = 380;
            up.SetImageWidth = 980;
        }

        void up_GetFileNameEvent(string fileName)
        {
            TextBox tx = (TextBox)FormView1.FindControl("EventImageTextBox");
            tx.Text = fileName;
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
          
            msgLabel.Text = "تم الحفظ بنجاح";
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string x = e.CommandArgument.ToString();
                string id = GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                //Response.Write("<script>");
                //Response.Write(String.Format("window.open('{0}','_blank')","CPSliderDetails.aspx?ID=" + id));
                //Response.Write("</script>");

                // Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('CPSliderDetails.aspx?ID=" + id + "','_newtab');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.open('CPSliderDetails.aspx?ID=" + id + "');", true);
            }
            if (e.CommandName == "DeleteCommand")
            {
                string keyValue = GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                 
                SqlDataSource2.DeleteParameters[0].DefaultValue = keyValue;
                SqlDataSource2.Delete();

            }
          
        }
}
