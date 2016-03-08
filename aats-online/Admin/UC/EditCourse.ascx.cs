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

public partial class EditCourse : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadData()
    {
        DDLItems.DataSource = DB.SelectCourses();
        ViewState["dt"] = (DataTable)DDLItems.DataSource;
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
                        DDLItems_SelectedIndexChanged(DDLItems, new EventArgs());
                        break;
                    }
                }
            }
            
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

        string ResultMSG = DB.InsertCourse(ref CourseId, TxtAdd.Text, TxtAddInfo.Text, StartDate, EndDate, RNTxtPriceAdd.Text);
        if (ResultMSG != string.Empty || CourseId == string.Empty)
        {
            LblMsg.Text = ResultMSG;
            LblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (RAsyncUploadAdd.UploadedFiles.Count > 0)
        {
            if (System.IO.File.Exists(MapPath(DB.tempDir) + RAsyncUploadAdd.UploadedFiles[0].GetName()))
                System.IO.File.Move(MapPath(DB.tempDir) + RAsyncUploadAdd.UploadedFiles[0].GetName(), String.Format("{0}{1}-1.jpg", DB.CourseFileDir, CourseId));
        }
        
        LblMsg.Text = "تم الاضافه";
        LblMsg.ForeColor = System.Drawing.Color.Green;
        TxtAdd.Text = string.Empty;
        TxtAddInfo.Text = string.Empty;

        LoadData();
    }
    protected void DDLItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLItems.SelectedValue == string.Empty)
            return;
        DataRow row = ((DataTable)ViewState["dt"]).Rows[DDLItems.SelectedIndex];
        TxtEdit.Text = row["CourseName"].ToString();
        TxtEditInfo.Text = row["Courseremark"].ToString();
        ImgEdit.ImageUrl = row["imageline1Link"].ToString();
        HLDetails.NavigateUrl = "../EditCourseDetails.aspx?CourseId=" + DDLItems.SelectedValue;
        
        if (row["StartDate"].ToString() == string.Empty)
            RDPStartDateEdit.SelectedDate = null;
        else
            RDPStartDateEdit.SelectedDate = (DateTime)row["StartDate"];
        if (row["EndDate"].ToString() == string.Empty)
            RDPEndDateEdit.SelectedDate = null;
        else
            RDPEndDateEdit.SelectedDate = (DateTime)row["EndDate"];

        RNTxtPriceEdit.Text = row["Price"].ToString();

    }
    protected void IBEdit_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 0 || TxtEdit.Text.Length == 0)
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
        DB.UpdateCourse(DDLItems.SelectedValue, TxtEdit.Text, TxtEditInfo.Text, StartDate, EndDate, RNTxtPriceEdit.Text);
        if (RAsyncUploadEdit.UploadedFiles.Count > 0)
        {
            if (System.IO.File.Exists(MapPath(DB.tempDir) + RAsyncUploadEdit.UploadedFiles[0].GetName()))
            {
                System.IO.File.Delete(String.Format("{0}{1}-1.jpg", DB.CourseFileDir, DDLItems.SelectedValue));
                System.IO.File.Move(MapPath(DB.tempDir) + RAsyncUploadEdit.UploadedFiles[0].GetName(), String.Format("{0}{1}-1.jpg", DB.CourseFileDir, DDLItems.SelectedValue));
            }
        }
        LblMsg.Text = "تم التعديل";
        LblMsg.ForeColor = System.Drawing.Color.Green;

        TxtEdit.Text = string.Empty;
        ImgEdit.ImageUrl = string.Empty;
        TxtEditInfo.Text = string.Empty;
        
        LoadData();
    }
    protected void IBDelete_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 0)
        {
            LblMsg.Text = "من فضلك اختار عنصر ثم اضغط حذف";
            return;
        }
        string ResultMSG = DB.DeleteCourse(DDLItems.SelectedValue);
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
        TxtEditInfo.Text = string.Empty;
        RDPStartDateEdit.SelectedDate = null;
        RDPEndDateEdit.SelectedDate = null;
        RNTxtPriceEdit.Text = string.Empty;

        LoadData();
    }

    #endregion         #region -   Variables   -
    
}