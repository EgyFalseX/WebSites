using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class picMultiEditor : System.Web.UI.Page
{
    const string imageFolder = "schoolPhoto/";
    static List<string> ImgLst = new List<string>(10);
    public static string ConnectionStr
    {
        get
        {
            string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
            HttpServerUtility sv = HttpContext.Current.Server;
            constr += sv.MapPath(@"~/App_Data/DataDB.mdb");
            return constr;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (HttpContext.Current.Session["UserIDgallary"] == null)
        //    Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        if (!IsPostBack)
        {
            ImgLst.Add("ImgGlry01"); ImgLst.Add("ImgGlry02"); ImgLst.Add("ImgGlry03"); ImgLst.Add("ImgGlry04");
            ImgLst.Add("ImgGlry05"); ImgLst.Add("ImgGlry06"); ImgLst.Add("ImgGlry07"); ImgLst.Add("ImgGlry08");
            ImgLst.Add("ImgGlry09"); ImgLst.Add("ImgGlry10");
            ClearImgLst();
        }
    }
    void ClearImgLst()
    {
        for (int i = 0; i < ImgLst.Count; i++)
            HttpContext.Current.Session[ImgLst[i]] = null;
    }
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        LblState.Text = string.Empty;

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        string FName = "schoolPhoto" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + uploader.UploadedFiles[0].FileName;
        if (uploader.UploadedFiles.Length == 0)
            return;
        for (int i = 0; i < uploader.UploadedFiles.Length; i++)
        {
            if (uploader.UploadedFiles[i].FileBytes.Length == 0)
                break;
            uploader.UploadedFiles[i].SaveAs(MapPath(imageFolder + FName + i), true);
            Session[ImgLst[i]] = FName + i;
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(ConnectionStr);
        OleDbCommand cmd = new OleDbCommand("", con);
        cmd.CommandText = @"INSERT INTO [RotatorData] ([aboutid], [Caption], [ImageLink]) VALUES (@aboutid, @Caption, @ImageLink)";
        OleDbParameter PramID = new OleDbParameter("@aboutid", OleDbType.Integer); PramID.Value = Request.QueryString["Id"];
        OleDbParameter PramTxt = new OleDbParameter("@Caption", OleDbType.WChar); PramTxt.Value = string.Empty;
        OleDbParameter PramLink = new OleDbParameter("@ImageLink", OleDbType.WChar); PramLink.Value = string.Empty;
        cmd.Parameters.AddRange(new OleDbParameter[] { PramID, PramTxt, PramLink });
        
        try
        {
            con.Open();
            // Link 01
            if (HttpContext.Current.Session[ImgLst[0]] != null)
            {
                PramTxt.Value = txt1.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[0]];
                cmd.ExecuteNonQuery();
            }
            // Link 02
            if (HttpContext.Current.Session[ImgLst[1]] != null)
            {
                PramTxt.Value = txt2.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[1]];
                cmd.ExecuteNonQuery();
            }
            // Link 03
            if (HttpContext.Current.Session[ImgLst[2]] != null)
            {
                PramTxt.Value = txt3.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[2]];
                cmd.ExecuteNonQuery();
            }
            // Link 04
            if (HttpContext.Current.Session[ImgLst[3]] != null)
            {
                PramTxt.Value = txt4.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[3]];
                cmd.ExecuteNonQuery();
            }
            // Link 05
            if (HttpContext.Current.Session[ImgLst[4]] != null)
            {
                PramTxt.Value = txt5.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[4]];
                cmd.ExecuteNonQuery();
            }
            // Link 06
            if (HttpContext.Current.Session[ImgLst[5]] != null)
            {
                PramTxt.Value = txt6.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[5]];
                cmd.ExecuteNonQuery();
            }
            // Link 07
            if (HttpContext.Current.Session[ImgLst[6]] != null)
            {
                PramTxt.Value = txt7.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[6]];
                cmd.ExecuteNonQuery();
            }
            // Link 08
            if (HttpContext.Current.Session[ImgLst[7]] != null)
            {
                PramTxt.Value = txt8.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[7]];
                cmd.ExecuteNonQuery();
            }
            // Link 09
            if (HttpContext.Current.Session[ImgLst[8]] != null)
            {
                PramTxt.Value = txt9.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[8]];
                cmd.ExecuteNonQuery();
            }
            // Link 10
            if (HttpContext.Current.Session[ImgLst[9]] != null)
            {
                PramTxt.Value = txt10.Text;
                PramLink.Value = HttpContext.Current.Session[ImgLst[9]];
                cmd.ExecuteNonQuery();
            }
            con.Close();
            btnSave.JSProperties["cpShowPopup"] = "تم الاضـــافه ...";
        }
        catch (Exception ex)
        {
            con.Close();
            LblState.Text = ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        
    }
}