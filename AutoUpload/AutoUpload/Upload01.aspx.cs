using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Upload01 : System.Web.UI.Page
{
    public static string FilesPath = "../Assets/Images/db.mdb";

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        //string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UC = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        
        if (UC.UploadedFiles.Length == 0)
            return;
        UC.UploadedFiles[0].SaveAs(MapPath(MC.FilesPath), true);
        e.CallbackData = FilesPath;
    }
}