using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uploader : System.Web.UI.UserControl
{
    //e:\HostingSpaces\aats\aats-online.com\wwwroot\Admin\files\2012414215716reading-book.png
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
            FUFiles.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(TxtFolder.Text) + "/" + NewFileName);
            //FUFiles.PostedFile.SaveAs(Request.MapPath(TxtFolder.Text) + "/" + NewFileName);
            
            string MPath = string.Empty;
            string[] arr = MapPath("../" + TxtFolder.Text + "/" + NewFileName).Split(Convert.ToChar("\\"));
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] == "wwwroot")
                {
                    MPath = @"http://www." + arr[i - 1];
                    for (int i2 = i + 1; i2 < arr.Length; i2++)
                    {
                        MPath += "/" + arr[i2];
                    }
                }
            }
            LblPath.Text = MPath;
        }
        catch (Exception ex)
        {
            LblPath.Text = ex.Message;
        }
    }
}