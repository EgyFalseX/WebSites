using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tbladvEditor : System.Web.UI.Page
{
    dsAdvets ds = new dsAdvets();
    dsAdvetsTableAdapters.tbladvTableAdapter adp = new dsAdvetsTableAdapters.tbladvTableAdapter();
    private void BindData()
    {
        HFId.Value = TheSessions.tbladvEditId.ToString();
        TheSessions.tbladvEditId = null;
        int Id = Convert.ToInt32(HFId.Value);
        dsAdvets.tbladvRow row = adp.GetDataById(Id)[0];

        deadvdate.Date = row.advdate;
        cbIdTypeId.Value = row.IdTypeId.ToString();
        if (!row.IsplacceNull())
            tbplacce.Value = row.placce;
        if (!row.IsremmarksNull())
            tbremmarks.Value = row.remmarks;
        tbnumber.Value = row.number.ToString();
        if (!row.IsegabeatNull())
            tbegabeat.Value = row.egabeat;
        if (!row.IssalbeatNull())
            tbsalbeat.Value = row.salbeat;
        if (!row.IssugeestNull())
            tbsugeest.Value = row.sugeest;
        if (!row.IsresmobileNull())
            tbresmobile.Value = row.resmobile;
        if (!row.IsattachpathNull())
        {
            Session["attachpath"] = row.attachpath;
            myImg.ImageUrl = MC.advetsFilesPath + row.attachpath;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuthadvets)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!IsPostBack)
        {
            if (TheSessions.tbladvEditId != null)
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
        UCpic.UploadedFiles[0].SaveAs(MapPath(MC.advetsFilesPath + FName), true);
        e.CallbackData = FName;
        Session["attachpath"] = FName;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!deadvdate.IsValid || !cbIdTypeId.IsValid || !tbnumber.IsValid)
            return;

        if (MC.IsNullOrEmpty(HFId.Value))
            SaveAsNew();
        else
            SaveAsEdit();
    }
    private void SaveAsNew()
    {
        dsAdvets.tbladvRow row = ds.tbladv.NewtbladvRow();
        row.Id = (int)adp.ScalarQueryNewID();
        
        UpdateDatabase(row);
    }
    private void SaveAsEdit()
    {
        int Id = Convert.ToInt32(HFId.Value);

        UpdateDatabase(adp.GetDataById(Id)[0]);
    }
    private void UpdateDatabase(dsAdvets.tbladvRow row)
    {
        row.datein = DateTime.Now;
        row.userin = Convert.ToInt32(TheSessions.UserIDadvets);
        row.SyndicateId = Convert.ToInt32(TheSessions.SyndicateIdadvets);

        if (!MC.IsNullOrEmpty(deadvdate.Value))
            row.advdate = deadvdate.Date;
        if (!MC.IsNullOrEmpty(cbIdTypeId.Value))
            row.IdTypeId = Convert.ToByte(cbIdTypeId.Value);
        if (!MC.IsNullOrEmpty(tbplacce.Value))
            row.placce = tbplacce.Value.ToString();
        if (!MC.IsNullOrEmpty(tbremmarks.Value))
            row.remmarks = tbremmarks.Value.ToString();
        if (!MC.IsNullOrEmpty(tbnumber.Value))
            row.number = Convert.ToInt32(tbnumber.Value);
        if (!MC.IsNullOrEmpty(tbegabeat.Value))
            row.egabeat = tbegabeat.Value.ToString();
        if (!MC.IsNullOrEmpty(tbsalbeat.Value))
            row.salbeat = tbsalbeat.Value.ToString();
        if (!MC.IsNullOrEmpty(tbsugeest.Value))
            row.sugeest = tbsugeest.Value.ToString();
        if (!MC.IsNullOrEmpty(tbresmobile.Value))
            row.resmobile = tbresmobile.Value.ToString();
        if (!MC.IsNullOrEmpty(Session["attachpath"]))
            row.attachpath = Session["attachpath"].ToString();

        if (row.RowState == System.Data.DataRowState.Detached)
            ds.tbladv.AddtbladvRow(row);

        row.EndEdit();
        adp.Update(row);
        Session.Remove("attachpath");

        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الحفــــظ";
    }
    
}