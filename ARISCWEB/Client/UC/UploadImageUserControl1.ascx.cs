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
        public int PathID
        {
            get { return Convert.ToInt32(ViewState["PathID"]); }

            set { ViewState["PathID"] = value; }

        }
        public int MFileSize
        {
            get { return Convert.ToInt32(ViewState["MFileSize"]); }
            set { ViewState["MFileSize"] = value; }

        }
        public int SetImageHeight
        {

            get { return Convert.ToInt32(ViewState["SetImageHeight"]); }
            set { ViewState["SetImageHeight"] = value; }

        }
        public int SetImageWidth
        {
            get { return Convert.ToInt32(ViewState["SetImageWidth"]); }
            set { ViewState["SetImageWidth"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void uploadASPxButton_Click(object sender, EventArgs e)
        {
            ASPxUploadControl uc = imageASPxUploadControl;
            string pathname;
            PathesClass pathesobject = new PathesClass("DB.mdb");
            pathesobject.pathID = PathID;
            pathname = pathesobject.GetPathName();

            //Image i = new Image();

            uc.ValidationSettings.MaxFileSize = MFileSize;
            if (uc.IsValid == true)
                if (uc.PostedFile.FileName != "")
                {
                    if (IsImageDRight(uc.PostedFile.InputStream))
                    {
                        bool isFound = Directory.Exists(Server.MapPath("" + pathname));
                        if (!isFound)
                            Directory.CreateDirectory(Server.MapPath("" + pathname));

                        string uploadDirectory = Server.MapPath("" + pathname);
                        string imgName = DateTime.Now.ToString("d.M.yyyy HH.mm.ss.").Trim() + ImageFormat.Jpeg;
                        ViewState["saveInDBPath"] = pathname + imgName;
                        string path = uploadDirectory + imgName;
                        uc.PostedFile.SaveAs(path);
                        msgUploadASPxLabel.Text = "تم رفع الصورة بنجاح";

                    }
                }
        }
        public void FireEvent()
        {
            if (ViewState["saveInDBPath"] != null)
            {
                string s = ViewState["saveInDBPath"].ToString();
                GetFileNameEvent(Convert.ToString(ViewState["saveInDBPath"]));
            }
        }
        protected bool IsImageDRight(Stream imagePath)
        {
            bool isRight = true;
            System.Drawing.Image img = System.Drawing.Image.FromStream(imagePath);
            if (SetImageWidth != 0 && SetImageHeight != 0)
                if (img.Width != SetImageWidth || img.Height != SetImageHeight)
                {
                    msgUploadASPxLabel.Text = "يجب أن تكون أبعاد الصورة كالأتي: الطول: " + SetImageHeight + " العرض: " + SetImageWidth;
                    isRight = false;
                }
            return isRight;

        }

 

    }
