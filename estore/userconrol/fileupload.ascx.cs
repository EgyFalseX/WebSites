using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class fileupload : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddImage_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile.FileName != "")
        {
            if (FileUpload1.PostedFile.ContentType.StartsWith("image") || (FileUpload1.PostedFile.ContentType == "image/pjpeg") || (FileUpload1.PostedFile.ContentType == "image/gif") || (FileUpload1.PostedFile.ContentType == "application/msword") || (FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document") || (FileUpload1.PostedFile.ContentType == "application/pdf") || (FileUpload1.PostedFile.ContentType == "image/x-png"))
            {


                try
                {

                    //save file

                    FileUpload1.SaveAs(MapPath("~/UploadImages/" + FileUpload1.FileName));

                    //Response.Write("<script language =Javascript> alert('File Uploaded Successfully, Click Show Images');</script>");

                    System.Threading.Thread.Sleep(8000);

                   
                }

                catch (System.IO.DirectoryNotFoundException)
                {

                    createDir();

                }

            }
            else
            {
                Label1.Text = "امتداد الملف غير مدعوم";
            }

        }

        else
        {

            Label1.Text = "يجب اختيار المرفق";
        }
      


    }

    private bool checkFileType(string fileName)
    {

        string fileExt = Path.GetExtension(FileUpload1.FileName);

        switch (fileExt.ToLower())
        {

            case ".gif":

                return true;

            case ".png":

                return true;

            case ".jpg":

                return true;

            case ".jpeg":

                return true;

            default:

                return false;

        }


    }

    private void createDir()
    {

        DirectoryInfo myDir = new DirectoryInfo(MapPath("~/UploadImages/"));

        myDir.Create();

        //Now save file

        FileUpload1.SaveAs(MapPath("~/UploadImages/" + FileUpload1.FileName));

        Response.Write("<script language =Javascript> alert('File Uploaded Successfully,Click Show Images');</script>");

    }

    public string filename
    {
        get { return FileUpload1.FileName; }
    }
    public void save_as(string path)
    {
        FileUpload1.SaveAs(path);
    }

   


}


