using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreatePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID2"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void ASPxCallbackPanelMain_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        txt1.Html = LoadPage(cbM1.Value.ToString(), cbM2.Value.ToString());
    }

    public string LoadPage(string Item, string SubItem)
    {
        string Path = string.Empty;
        if (Item != null && SubItem != null)
            Path = "ItemData/" + Item + "-" + SubItem;
        else
            return string.Empty;

        Path = MapPath(Path);
        if (!File.Exists(Path))
            return string.Empty;
        else
        {
            TextReader TR = new StreamReader(Path);
            string tt = TR.ReadToEnd().ToString();
            TR.Close(); TR.Dispose();
            return tt;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cbM1.Value == null || cbM2.Value == null || cbM1.Value.ToString() == string.Empty || cbM2.Value.ToString() == string.Empty)
            ASPxPopupControlEditor.Text = "من فضلك اختر قائمه رئيسيه و فرعيه قبل الحفظ";
        else
        {
            string Path = "ItemData/" + cbM1.Value.ToString() + "-" + cbM2.Value.ToString();
            Path = MapPath(Path);
            File.Create(Path).Close();
            TextWriter TW = new StreamWriter(Path, false);
            TW.Write(txt1.Html);
            TW.Flush();
            TW.Close();
            ASPxPopupControlEditor.Text = "تم الحفــــظ";
        }
        ASPxPopupControlEditor.ShowOnPageLoad = true;
        
    }
}