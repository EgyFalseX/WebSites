using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class Editcoursenotime : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadData()
    {
        DataTable dt = DB.SelectCoursesNoTime();
        DataRow row = dt.NewRow(); dt.Rows.InsertAt(row, 0);
        DDLItems.DataSource = dt;
        ViewState["dt"] = dt;
        DDLItems.DataBind();
    }
    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            RAsyncUploadAdd.TemporaryFolder = DB.tempDir;
            RAsyncUploadAdd.TargetFolder = DB.tempDir;
            RAsyncUploadEdit.TemporaryFolder = DB.tempDir;
            RAsyncUploadEdit.TargetFolder = DB.tempDir;
            if (Request.QueryString["CourseId"] != null)
            {
                DataTable dt = (DataTable)ViewState["dt"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["CourseId"].ToString() == Request.QueryString["CourseId"].ToString())
                    {
                        DDLItems.SelectedIndex = i;
                        break;
                    }
                }
            }
            DDLItems_SelectedIndexChanged(DDLItems, new EventArgs());
        }
    }
    protected void IBAdd_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (TxtAdd.Text == string.Empty)
            return;
        
        string CourseId = string.Empty;
        string StartDate = string.Empty;
        if (RDPStartDateAdd.SelectedDate != null)
            StartDate = RDPStartDateAdd.SelectedDate.Value.ToString();
        string EndDate = string.Empty;
        if (RDPEndDateAdd.SelectedDate != null)
            EndDate = RDPEndDateAdd.SelectedDate.Value.ToString();

        string ResultMSG = DB.InsertCourseNoTime(ref CourseId, TxtAdd.Text, StartDate, EndDate, cbShowOnline.Checked);
        if (ResultMSG != string.Empty || CourseId == string.Empty)
        {
            LblMsg.Text = ResultMSG;
            LblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (RAsyncUploadAdd.UploadedFiles.Count > 0)
        {
            if (System.IO.File.Exists(MapPath(DB.tempDir) + RAsyncUploadAdd.UploadedFiles[0].GetName()))
                System.IO.File.Move(MapPath(DB.tempDir) + RAsyncUploadAdd.UploadedFiles[0].GetName(), String.Format("{0}{1}-1.jpg", DB.CourseNoTimeFileDir, CourseId));
        }
        
        LblMsg.Text = "تم الاضافه";
        LblMsg.ForeColor = System.Drawing.Color.Green;
        TxtAdd.Text = string.Empty;
        cbShowOnline.Checked = true;
        LoadData();
    }
    protected void DDLItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLItems.SelectedValue == string.Empty)
        {
            TxtEdit.Text = string.Empty;
            ImgEdit.ImageUrl = string.Empty;
            HLDetails.NavigateUrl = string.Empty;
            RDPStartDateEdit.SelectedDate = null;
            RDPEndDateEdit.SelectedDate = null;
            cbShowOnlineEdit.Checked = true;
            return;
        }
        DataRow row = ((DataTable)ViewState["dt"]).Rows[DDLItems.SelectedIndex];
        TxtEdit.Text = row["CourseName"].ToString();
        ImgEdit.ImageUrl = row["imageline1Link"].ToString();
        HLDetails.NavigateUrl = "../EditCourseNoTimeDetails.aspx?CourseId=" + DDLItems.SelectedValue + "&Courseitem=1";
        HLReservation.NavigateUrl = "../ViewReservation.aspx?CourseId=" + DDLItems.SelectedValue;
        
        if (row["StartDate"].ToString() == string.Empty)
            RDPStartDateEdit.SelectedDate = null;
        else
            RDPStartDateEdit.SelectedDate = (DateTime)row["StartDate"];
        if (row["EndDate"].ToString() == string.Empty)
            RDPEndDateEdit.SelectedDate = null;
        else
            RDPEndDateEdit.SelectedDate = (DateTime)row["EndDate"];
        cbShowOnlineEdit.Checked = Convert.ToBoolean(row["ShowOnline"]);
    }
    protected void IBEdit_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 1 || TxtEdit.Text.Length == 0)
        {
            LblMsg.Text = "من فضلك اختار دوره وادخل التغير ثم اضغط تعديل";
            return;
        }
        string StartDate = string.Empty;
        if (RDPStartDateEdit.SelectedDate != null)
            StartDate = RDPStartDateEdit.SelectedDate.Value.ToString();
        string EndDate = string.Empty;
        if (RDPEndDateEdit.SelectedDate != null)
            EndDate = RDPEndDateEdit.SelectedDate.Value.ToString();
        DB.UpdateCourseNoTime(DDLItems.SelectedValue, TxtEdit.Text, StartDate, EndDate, cbShowOnlineEdit.Checked);
        if (RAsyncUploadEdit.UploadedFiles.Count > 0)
        {
            if (System.IO.File.Exists(MapPath(DB.tempDir) + RAsyncUploadEdit.UploadedFiles[0].GetName()))
            {
                System.IO.File.Delete(String.Format("{0}{1}-1.jpg", DB.CourseNoTimeFileDir, DDLItems.SelectedValue));
                System.IO.File.Move(MapPath(DB.tempDir) + RAsyncUploadEdit.UploadedFiles[0].GetName(), String.Format("{0}{1}-1.jpg", DB.CourseNoTimeFileDir, DDLItems.SelectedValue));
            }
        }
        LblMsg.Text = "تم التعديل";
        LblMsg.ForeColor = System.Drawing.Color.Green;

        TxtEdit.Text = string.Empty;
        ImgEdit.ImageUrl = string.Empty;
        
        LoadData();
    }
    protected void IBDelete_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 1)
        {
            LblMsg.Text = "من فضلك اختار عنصر ثم اضغط حذف";
            return;
        }
        string ResultMSG = DB.DeleteCourseNoTime(DDLItems.SelectedValue);
        if (ResultMSG != null)
        {
            LblMsg.Text = ResultMSG;
            LblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }
        LblMsg.Text = "تم الحذف";
        LblMsg.ForeColor = System.Drawing.Color.Green;

        TxtEdit.Text = string.Empty;
        ImgEdit.ImageUrl = string.Empty;
        RDPStartDateEdit.SelectedDate = null;
        RDPEndDateEdit.SelectedDate = null;
        
        LoadData();
    }

    #endregion
    
}