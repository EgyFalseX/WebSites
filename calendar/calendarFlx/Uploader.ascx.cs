using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uploader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        LblPath.Text = string.Empty;
        if (TxtFolder.Text.Length == 0 || FUFiles.HasFile == false)
        {
            LblPath.Text = "من فضلك اكتب المسار و اختار ملف";
            return;
        }

        try
        {
            string NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + System.IO.Path.GetFileName(FUFiles.PostedFile.FileName);
            FUFiles.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(@"~/" + TxtFolder.Text) + "/" + NewFileName);
            LblPath.Text = @"~/" + TxtFolder.Text + "/" + NewFileName;
        }
        catch (Exception ex)
        {
            LblPath.Text = ex.Message;
        }
    }
}