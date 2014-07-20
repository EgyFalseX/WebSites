using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_InsTrainerAttendanceUC : System.Web.UI.UserControl
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
        }
    }
    private void LoadCrouses()
    {
        DataTable CoursesTbl = new DataTable("FalseX");
        using (OleDbDataAdapter Da = new OleDbDataAdapter("SELECT DowraId,(Select DowraName From Dowraat Where DowraId = DowraModreb.DowraId) As DowraName FROM DowraModreb Where EmpId = " + ET_Lib.Empid, ET_Lib.E_trainingConnection))
        {
            Da.Fill(CoursesTbl);
            ET_Lib.EmptyRow(CoursesTbl);
            DDLCourses.DataSource = CoursesTbl;
            DDLCourses.DataTextField = "DowraName";
            DDLCourses.DataValueField = "DowraId";
            DDLCourses.DataBind();
        }
    }
    protected void DDLCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLCourses.SelectedIndex == -1)
        {
            GridViewTrainers.DataSource = new DataTable();
            GridViewTrainers.DataBind();
            BtnSaveAtt.Enabled = false;
            return;
        }
        if (DDLCourses.SelectedValue.ToString() == DBNull.Value.ToString())
        {
            BtnSaveAtt.Enabled = false;
            return;
        }
        LoadTrainers();
        BtnSaveAtt.Enabled = true;
    }
    private void LoadTrainers()
    {
        DataTable TrainersTbl = new DataTable("FalseX");
        if (DDLCourses.SelectedValue != string.Empty)
        {
            using (OleDbDataAdapter Da = new OleDbDataAdapter("SELECT Emp_Data.EmpName, Emp_Data.NiId, Emp_Data.EmpId, DowratTrsheh.TRshehId,(SELECT hodor AS Attended FROM DowraHodor Where TRshehId = DowratTrsheh.TRshehId And HodorDate = Date()) As Attended FROM (DowratTrsheh INNER JOIN Emp_Data ON DowratTrsheh.EmpId = Emp_Data.EmpId) WHERE (NOT EXISTS (SELECT TRshehId FROM DowraApology WHERE (TRshehId = DowratTrsheh.TRshehId))) AND (DowratTrsheh.DowraId = " + DDLCourses.SelectedValue.ToString() + ")", ET_Lib.E_trainingConnection))
            {
                Da.Fill(TrainersTbl);
            }    
        }
        ViewState["TrainersTbl"] = TrainersTbl;
        GridViewTrainers.DataSource = TrainersTbl;
        GridViewTrainers.DataBind();
    }
    protected void BtnSaveAtt_Click(object sender, EventArgs e)
    {
        if (DDLCourses.SelectedValue.ToString() == DBNull.Value.ToString())
        {
            LblState.Text = "من فضلك قم بأختيار الدوره اولا";
            LblState.Visible = true;
            return;
        }
        LblState.Visible = false;
        DataTable TrainersTbl = (DataTable)ViewState["TrainersTbl"];
        string TRshehId = string.Empty;
        string hodor = string.Empty;
        string EmpId = string.Empty;
        string HodorDate = DateTime.Today.ToShortDateString().ToString();
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("", Con);
        try
        {
            Con.Open();
            foreach (GridViewRow Row in GridViewTrainers.Rows)
            {
                string UpdateComplate = string.Empty;
                CheckBox CB = (CheckBox)Row.FindControl("CBAttended");
                TRshehId = TrainersTbl.Rows[Row.RowIndex]["TRshehId"].ToString();
                EmpId = TrainersTbl.Rows[Row.RowIndex]["EmpId"].ToString();
                /////////////
                string x = TrainersTbl.Rows[Row.RowIndex]["EmpName"].ToString();
                if (CB != null && CB.Checked)
                    hodor = "1";
                else
                    hodor = "0";
                Cmd.CommandText = "UPDATE DowraHodor SET hodor = " + hodor + " WHERE (DowraHodor.TRshehId = " + TRshehId + ") AND (DowraHodor.HodorDate = #" + HodorDate + "#) AND (DowraHodor.EmpId = " + EmpId + ")";
                UpdateComplate = Cmd.ExecuteNonQuery().ToString();
                if (UpdateComplate == "0")
                {
                    Cmd.CommandText = "INSERT INTO DowraHodor (TRshehId, HodorDate, hodor, EmpId) VALUES (" + TRshehId + ", #" + HodorDate + "#, " + hodor + ", " + EmpId + ")";
                    Cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        Con.Close();
    }
}
