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


public partial class UploadFileUserControl : System.Web.UI.UserControl
    {
        public delegate void FileNameEventHandler(string fileName);
        public event FileNameEventHandler GetFileNameEvent;
       // string saveInDBPath;
        public int PathID{
            get { return Convert.ToInt32(ViewState["PathID"]); }

            set { ViewState["PathID"]=value; }
        
        }
        public string PathName
        {
            get { return Convert.ToString(ViewState["PathName"]); }

            set { ViewState["PathName"] = value; }

        }
        public int MFileSize {
            get { return Convert.ToInt32(ViewState["MFileSize"]); }
            set { ViewState["MFileSize"] = value; }
        
        }
        public int SetImageHeight{

            get { return Convert.ToInt32(ViewState["SetImageHeight"]); }
            set { ViewState["SetImageHeight"] =value ; }
        
        }
        public int SetImageWidth {
            get { return Convert.ToInt32(ViewState["SetImageWidth"]); }
            set { ViewState["SetImageWidth"]=value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void uploadASPxButton_Click(object sender, EventArgs e)
        {
            ASPxUploadControl uc = imageASPxUploadControl;
            //string pathname;
            PathesClass pathesobject = new PathesClass();
            pathesobject.pathID = PathID;
            PathName = pathesobject.GetPathName();

            //Image i = new Image();

            uc.ValidationSettings.MaxFileSize = MFileSize;
            if (uc.IsValid == true )
                if (uc.PostedFile.FileName != "")
                {
                    string ext = Path.GetExtension(uc.PostedFile.FileName);
                   // if(Path.GetExtension(uc.PostedFile.FileName)==".jpg" || Path.GetExtension(uc.PostedFile.FileName)==".jpeg")
                        
                    //if (IsImageDRight(uc.PostedFile.InputStream))
                    //{
                    bool isFound = Directory.Exists(Server.MapPath("" + PathName));
                        if (!isFound)
                            Directory.CreateDirectory(Server.MapPath("" + PathName));

                        string uploadDirectory = Server.MapPath("" + PathName);
                        string imgName = DateTime.Now.ToString("d.M.yyyy HH.mm.ss").Trim() + ext;
                        ViewState["saveInDBPath"] = PathName + imgName;
                        string path = uploadDirectory + imgName;
                        uc.PostedFile.SaveAs(path);
                        msgUploadASPxLabel.Text = "تم رفع الملف بنجاح من فضلك لا تنسى الضغط على حفظ";
                        //try
                        //{
                            
                        //}
                       // catch { }
                    //}
                }
        }
        public void FireEvent()
        {
            // PathName = pathName;
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
            if (img.Width != SetImageWidth || img.Height != SetImageHeight)
            {
                msgUploadASPxLabel.Text = "يجب أن تكون أبعاد الصورة كالأتي: الطول: " + SetImageHeight + " العرض: " + SetImageWidth;
                isRight= false;
            }
            return isRight;
           
        }

 

    }
