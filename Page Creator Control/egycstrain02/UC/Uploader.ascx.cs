﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uploader : System.Web.UI.UserControl
{
    private int THE_SIZE = 350*350;
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
		string NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + System.IO.Path.GetFileName(FUFiles.PostedFile.FileName);

        if (FUFiles.PostedFile.ContentLength > THE_SIZE)
        {
            if (FUFiles.PostedFile.ContentLength > 1024*1024)
            {

                LblPath.Text = String.Format("حجم الملف اكبر من {0} ميجا ", THE_SIZE / 1048576);
            }
            else
            {
                LblPath.Text = String.Format("حجم الملف اكبر من {0} كيلو بايت ", THE_SIZE / 1024);
            }
            
            LblPath.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            FUFiles.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(TxtFolder.Text) + "/" + NewFileName);
            LblPath.Text = "uc"+"/" +TxtFolder.Text + "/" + NewFileName;
            LblPath.ForeColor = System.Drawing.Color.Black;
        }
        return;
        
        
    }
}