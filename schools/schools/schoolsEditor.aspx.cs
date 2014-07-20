using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schoolsEditor : System.Web.UI.Page
{
    dsSchools ds = new dsSchools();
    dsSchoolsTableAdapters.schoolsTableAdapter adp = new dsSchoolsTableAdapters.schoolsTableAdapter();
    private void BindData()
    {
        HFId.Value = TheSessions.schoolsschoolId.ToString();
        TheSessions.schoolsschoolId = null;
        int Id = Convert.ToInt32(HFId.Value);

        dsSchools.schoolsRow row = adp.GetDataByschoolId(Id)[0];

        if (!row.IsgovidNull())
            cbgovid.Value = row.govid.ToString();
        if (!row.IshayidNull())
            cbhayid.Value = row.hayid.ToString();
        if (!row.IsschoolnameNull())
            tbschoolname.Value = row.schoolname;
        if (!row.IsschooltypeidNull())
            cbschooltypeid.Value = row.schooltypeid.ToString();
        if (!row.IsaddressNull())
            tbaddress.Value = row.address;
        if (!row.IsschooltelNull())
            tbschooltel.Value = row.schooltel;
        if (!row.IsfaxNull())
            tbfax.Value = row.fax;
        if (!row.IssiteNull())
            tbsite.Value = row.site;
        if (!row.IsmailNull())
            tbmail.Value = row.mail;
        if (!row.IsshowsiteNull())
            cboxshowsite.Checked = row.showsite;

        if (!row.IsimgepathNull())
        {
            Session["attachpath"] = row.imgepath;
            myImg.ImageUrl = MC.schoolsFilesPath + row.imgepath;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.schoolsIsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
                TheSessions.schoolsschoolId = Request.QueryString["id"];
            if (TheSessions.schoolsschoolId != null)
                BindData();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //Response.Redirect(Server.UrlEncode(Request.Url.ToString()).ToString());
        Session.Remove("attachpath");
        Response.Redirect(Request.RawUrl);
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(MC.schoolsFilesPath + FName), true);
        e.CallbackData = FName;
        Session["attachpath"] = FName;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //if !cbschooltypeid.IsValid || !tbschooltel.IsValid)
        //    return;
        if (MC.IsNullOrEmpty(HFId.Value))
            SaveAsNew();
        else
            SaveAsEdit();
    }
    private void SaveAsNew()
    {
        dsSchools.schoolsRow row = ds.schools.NewschoolsRow();
        row.schoolId = (int)new dsSchoolsTableAdapters.QueriesTableAdapter().schoolsNewId();
        
        UpdateDatabase(row);
    }
    private void SaveAsEdit()
    {
        int Id = Convert.ToInt32(HFId.Value);
        UpdateDatabase(adp.GetDataByschoolId(Id)[0]);
    }
    private void UpdateDatabase(dsSchools.schoolsRow row)
    {
        row.datein = DateTime.Now;

        if (!MC.IsNullOrEmpty(cbgovid.Value))
            row.govid = Convert.ToByte(cbgovid.Value);
        if (!MC.IsNullOrEmpty(cbhayid.Value))
            row.hayid = Convert.ToByte(cbhayid.Value);
        if (!MC.IsNullOrEmpty(tbschoolname.Value))
            row.schoolname = tbschoolname.Value.ToString();
        if (!MC.IsNullOrEmpty(cbschooltypeid.Value))
            row.schooltypeid = Convert.ToByte(cbschooltypeid.Value);
        if (!MC.IsNullOrEmpty(tbaddress.Value))
            row.address = tbaddress.Value.ToString();
        if (!MC.IsNullOrEmpty(tbschooltel.Value))
            row.schooltel = tbschooltel.Value.ToString();
        if (!MC.IsNullOrEmpty(tbfax.Value))
            row.fax = tbfax.Value.ToString();
        if (!MC.IsNullOrEmpty(tbsite.Value))
            row.site = tbsite.Value.ToString();
        if (!MC.IsNullOrEmpty(tbmail.Value))
            row.mail = tbmail.Value.ToString();
        if (!MC.IsNullOrEmpty(cboxshowsite.Value))
            row.showsite = cboxshowsite.Checked;

        if (!MC.IsNullOrEmpty(Session["attachpath"]))
            row.imgepath = Session["attachpath"].ToString();

        if (row.RowState == System.Data.DataRowState.Detached)
            ds.schools.AddschoolsRow(row);

        row.EndEdit();
        adp.Update(row);
        Session.Remove("attachpath");

        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الحفــــظ";
    }
    
}