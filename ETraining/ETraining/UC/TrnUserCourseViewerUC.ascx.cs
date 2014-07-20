using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_TrnUserCourseViewerUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (ET_Lib.Empid != null)
            {
                LoadData(ET_Lib.Empid);
            }
            else
            {
                LblState.Text = "من فضلك قم بالتسجيــل اولا";
                LblState.Visible = true;
            }
            
        }
    }
    private void LoadData(string EmpID)
    {
        LblState.Visible = false;
        DataTable CoursesInfo = new DataTable("CoursesInfo");
        try
        {
            using (OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT Dowraat.DowraId, (SELECT DowraTypeName FROM DowraType WHERE (DowraTypeID = Dowraat.DowraTypeID)) AS CourseType, Dowraat.DowraName, (SELECT PlaceName FROM CdPlace WHERE (DowraPlace = Dowraat.DowraPlace)) AS CoursePlace, Dowraat.StartDate, Dowraat.EndDate, Dowraat.Price, (iif ([Dowraat.WithExam] = True,'نعم','لا')) As ArWithExam,Dowraat.WithExam, Dowraat.ExamMax, Dowraat.ExamMin, (iif ([Dowraat.ApologyAllow] = True,'نعم','لا')) As ArApologyAllow,Dowraat.ApologyAllow, Dowraat.rem, Dowraat.EvalAllow, (Select LabName From CdLab Where LabId = Dowraat.LabId) As LabName, '~/CourseAgendaDetials.aspx?CourseID=' & Dowraat.DowraId AS AgendaURL, '~/CourseTrainerDetials.aspx?CourseID=' & Dowraat.DowraId AS TrainerURL, '~/TrnApologizeDetials.aspx?CourseID=' & Dowraat.DowraId AS ApologyURL, '~/TrnRateCourse.aspx?CourseID=' & Dowraat.DowraId AS CourseRateURL, '~/TrnRateIns.aspx?CourseID=' & Dowraat.DowraId AS InsRateURL FROM (Dowraat RIGHT OUTER JOIN DowraModreb ON Dowraat.DowraId = DowraModreb.DowraId) WHERE DowraModreb.EmpId = " + EmpID, ET_Lib.E_trainingConnection))
            {
                AccessDA.Fill(CoursesInfo);
                ViewState["CoursesInfoTbl"] = CoursesInfo;
            }
            DataList1.DataSource = CoursesInfo;
            DataList1.DataBind();
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message.ToString();
            LblState.Visible = true;
        }
    }

}
