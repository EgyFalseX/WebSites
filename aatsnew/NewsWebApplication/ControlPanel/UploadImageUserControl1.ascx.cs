using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxTabControl;
using DevExpress.Web.ASPxUploadControl;
//using DevExpress.Web.Demos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;


    public partial class UploadImageUserControl1 : System.Web.UI.UserControl
    {
        public delegate void FileNameEventHandler(string fileName);
        public event FileNameEventHandler GetFileNameEvent;
        public int PathID{get;set;}
        public int MFileSize { get; set; }
        public int SetImageHeight{get;set;}
        public int SetImageWidth { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void uploadASPxButton_Click(object sender, EventArgs e)
        {
            ASPxUploadControl uc = imageASPxUploadControl;
            string pathname;
            NewsWebApplication_PathesClass pathesobject = new NewsWebApplication_PathesClass();
            pathesobject.pathID = PathID;
            pathname = pathesobject.GetPathName();

            //Image i = new Image();

            uc.ValidationSettings.MaxFileSize = MFileSize;
            if (uc.IsValid == true )
                if (uc.PostedFile.FileName != "")
                {
                    if (IsImageDRight(uc.PostedFile.InputStream))
                    {
                        bool isFound = Directory.Exists(Server.MapPath("~/" + pathname));
                        if (!isFound)
                            Directory.CreateDirectory(Server.MapPath("~/" + pathname));

                        string uploadDirectory = Server.MapPath("~/" + pathname);
                        string imgName = DateTime.Now.ToString("d_M_yyyy_HH_mm_ss.").Trim() + ImageFormat.Jpeg;
                        string saveInDBPath = pathname + imgName;
                        string path = uploadDirectory + imgName;
                        uc.PostedFile.SaveAs(path);
                        msgUploadASPxLabel.Text = "Uploaded Successfully!";
                        GetFileNameEvent(saveInDBPath);
                    }
                }
        }
        protected bool IsImageDRight(Stream imagePath)
        {
            bool isRight = true;
            //System.Drawing.Image img = System.Drawing.Image.FromStream(imagePath);
            //if (img.Width != SetImageWidth || img.Height != SetImageHeight)
            //{
            //    msgUploadASPxLabel.Text = "يجب أن تكون أبعاد الصورة كالأتي: الطول: " + SetImageHeight + " العرض: " + SetImageWidth;
            //    isRight= false;
            //}
            return isRight;
           
        }

 

    }
