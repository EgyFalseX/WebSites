using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text.RegularExpressions;

public partial class UC_InsTrainersDgreesUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ET_Lib.Empid = "1";
        //HttpContext.Current.Session["CEmpType"] = "2";

        if (ET_Lib.CheckEmpType(ET_Lib.EmpType_Enum.Instructor))//Check If user is logged and have Permission to see the form
        {
            if (!IsPostBack) // Do it only 1st Page load
            {
                LoadCrouses();// Load All Needed Data
            }
        }
        else
        {
            LblState.Text = "للمدربين فقط";
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
    }
    private void LoadCrouses()
    {
        DataTable CoursesTbl = new DataTable("FalseX");
        using (OleDbDataAdapter Da = new OleDbDataAdapter("SELECT DowraId,(Select DowraName From Dowraat Where DowraId = DowraModreb.DowraId) As DowraName,(Select ExamMax From Dowraat Where  DowraId = DowraModreb.DowraId) As ExamMax,(Select StartDate From Dowraat Where  DowraId = DowraModreb.DowraId) As StartDate, (Select EndDate From Dowraat Where  DowraId = DowraModreb.DowraId) As EndDate FROM DowraModreb Where EmpId = " + ET_Lib.Empid, ET_Lib.E_trainingConnection))
        {
            Da.Fill(CoursesTbl);
            ET_Lib.EmptyRow(CoursesTbl);
            DDLCourses.DataSource = CoursesTbl;
            DDLCourses.DataTextField = "DowraName";
            DDLCourses.DataValueField = "DowraId";
            DDLCourses.DataBind();
            ViewState["CoursesTbl"] = CoursesTbl;
        }
    }
    protected void DDLCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        LblState.Visible = false;
        if (DDLCourses.SelectedIndex != -1)
        {
            if (DDLCourses.SelectedValue.ToString() == DBNull.Value.ToString())
            {
                PnlCourseInfo.Visible = false;
                LblName.Text = string.Empty;
                LblDate1.Text = string.Empty;
                LblMaxDgree.Text = string.Empty;
            }
            else
            {
                DataTable CoursesTbl = (DataTable)ViewState["CoursesTbl"];
                PnlCourseInfo.Visible = true;
                LblName.Text = CoursesTbl.Rows[DDLCourses.SelectedIndex]["DowraName"].ToString();
                LblDate1.Text = Convert.ToDateTime(CoursesTbl.Rows[DDLCourses.SelectedIndex]["StartDate"]).ToShortDateString();
                LblDate2.Text = Convert.ToDateTime(CoursesTbl.Rows[DDLCourses.SelectedIndex]["EndDate"]).ToShortDateString();
                LblMaxDgree.Text = CoursesTbl.Rows[DDLCourses.SelectedIndex]["ExamMax"].ToString();
            }
            LoadTrainers();
            return;
        }
        PnlCourseInfo.Visible = false;
        LblName.Text = string.Empty;
        LblDate1.Text = string.Empty;
        LblMaxDgree.Text = string.Empty;
    }
    private void LoadTrainers()
    {
        DataTable TrainersTbl = new DataTable("FalseX");
        if (DDLCourses.SelectedValue.ToString() != DBNull.Value.ToString())
        {
            using (OleDbDataAdapter Da = new OleDbDataAdapter("SELECT Emp_Data.EmpName, Emp_Data.EmpId, DowratTrsheh.TRshehId, (SELECT degree FROM DowraExam WHERE (TRshehId = DowratTrsheh.TRshehId) AND (EmpId = Emp_Data.EmpId)) As Dgree FROM (DowratTrsheh INNER JOIN Emp_Data ON DowratTrsheh.EmpId = Emp_Data.EmpId) WHERE (NOT EXISTS (SELECT TRshehId FROM DowraApology WHERE (TRshehId = DowratTrsheh.TRshehId))) AND (DowratTrsheh.DowraId = " + DDLCourses.SelectedValue.ToString() + ")", ET_Lib.E_trainingConnection))
            {
                Da.Fill(TrainersTbl);
            }
        }
        ViewState["TrainersTbl"] = TrainersTbl;
        GVDgrees.DataSource = TrainersTbl;
        GVDgrees.DataBind();
    }
    protected void GVDgrees_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        return;
    }
    protected void TxtDgree_TextChanged(object sender, EventArgs e)
    {
        LblState.Visible = false;
        TextBox TB = (TextBox)sender;
        GridViewRow GVR = (GridViewRow)TB.Parent.Parent;
        TB.Text = ET_Lib.ToInt(TB.Text).ToString();
        DataTable TrainersTbl = (DataTable)ViewState["TrainersTbl"];
        TrainersTbl.Rows[GVR.RowIndex]["Dgree"] = TB.Text;
        //Check for MaxDgree
        DataTable CoursesTbl = (DataTable)ViewState["CoursesTbl"];
        if (int.Parse(CoursesTbl.Rows[DDLCourses.SelectedIndex]["ExamMax"].ToString()) < int.Parse(TB.Text))
        {
            Response.Write(ET_Lib.Msg("الدرجه العظمي  " + CoursesTbl.Rows[DDLCourses.SelectedIndex]["ExamMax"].ToString()));
            TrainersTbl.Rows[GVR.RowIndex]["Dgree"] = CoursesTbl.Rows[DDLCourses.SelectedIndex]["ExamMax"].ToString();
            TB.Text = TrainersTbl.Rows[GVR.RowIndex]["Dgree"].ToString();
        }
        
    }
    protected void GVDgrees_RowEditing(object sender, GridViewEditEventArgs e)
    {
        LblState.Visible = false;
        DataTable TrainersTbl = (DataTable)ViewState["TrainersTbl"];
        if (TrainersTbl.Rows[e.NewEditIndex]["Dgree"].ToString() == DBNull.Value.ToString())
        {
            LblState.Text = "من فضلك ادخل الدرجــــه";
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string degree = TrainersTbl.Rows[e.NewEditIndex]["Dgree"].ToString();
        string TRshehId = TrainersTbl.Rows[e.NewEditIndex]["TRshehId"].ToString();
        string EmpId = TrainersTbl.Rows[e.NewEditIndex]["EmpId"].ToString();
        string examDate = DateTime.Today.ToShortDateString();
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("UPDATE DowraExam SET examDate = #" + examDate + "#, degree = " + degree + " WHERE (DowraExam.TRshehId = " + TRshehId + ") AND (DowraExam.EmpId = " + EmpId + ")", Con);
        try
        {
            Con.Open();
            if (Cmd.ExecuteNonQuery() == 0)
            {
                Cmd.CommandText = "INSERT INTO DowraExam (TRshehId, examDate, degree, EmpId) VALUES (" + TRshehId + ", #" + examDate + "#, " + degree + ", " + EmpId + ")";
                Cmd.ExecuteNonQuery();
            }
            LblState.Text = "تم الاضــــــــافه";
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        Con.Close();

    }
}
