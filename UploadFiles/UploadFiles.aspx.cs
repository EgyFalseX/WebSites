using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadFiles : System.Web.UI.Page
{
    public static string SelectString = "SELECT [Id], [FileInformation], [LocalFileName], [ServerPath] FROM [UploadFileInfo] Where [Id] = ";
    public static OleDbConnection Connection
    {
        get
        {
            OleDbConnection con = new OleDbConnection(ConnectionString());
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    static string ConnectionString()
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"DB/UploadFilesPaths.mdb");
        return constr;
    }
    public static DataTable LoadDataTable(string CommandString)
    {
        DataTable ReturnMe = new DataTable("FX2014-09");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
        {
            try
            {
                DA.Fill(ReturnMe);
            }
            catch { }
        }
        return ReturnMe;
    }//Load Table From Database
    public string Id 
    {
        get 
        {
            if (HttpContext.Current.Session["FileId"] == null)
                return string.Empty;
            else
                return HttpContext.Current.Session["FileId"].ToString();
        }
        set
        {
            HttpContext.Current.Session["FileId"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDUploadFiles"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }

    protected void cb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cb.SelectedIndex == -1)
        {
            UCFile.Visible = false;
            return;
        }
        UCFile.Visible = true;
        DataTable dt = LoadDataTable(SelectString + cb.Value);
        UCFile.ValidationSettings.AllowedFileExtensions = new string[] { "." + dt.Rows[0]["LocalFileName"].ToString() };
        Id = cb.Value.ToString();
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        //if (cb.SelectedIndex == -1)
        //    return;
        DataTable dt = LoadDataTable(SelectString + Id);
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UC = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UC.UploadedFiles.Length == 0)
            return;
        string NewPath = MapPath(dt.Rows[0]["ServerPath"].ToString());
        UC.UploadedFiles[0].SaveAs(NewPath, true);
        e.CallbackData = "تم الحفظ بنجاح";
    }
    
}