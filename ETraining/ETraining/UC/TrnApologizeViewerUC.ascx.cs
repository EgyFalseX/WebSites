using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_TrnApologizeViewerUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ET_Lib.CheckEmpType(ET_Lib.EmpType_Enum.Trainer) == false)
        {
            LblState.Text = "لا يحق لك التواجد هنا";
            LblState.Visible = true;
            return;
        }
        LblApologizeDate.Text = DateTime.Now.ToShortDateString().ToString();
        if (!IsPostBack)
        {
            if (ET_Lib.Empid != null && Request.QueryString["Courseid"] != null)
            {
                GetCourseName(Request.QueryString["Courseid"].ToString());
                LoadData();
                ViewState["TRshehId"] = TRshehId(ET_Lib.Empid, Request.QueryString["Courseid"].ToString());
            }
            else
            {
                LblState.Text = "من فضلك قم بالتسجيــل اولا";
                LblState.Visible = true;
                return;
            }
            if (CheckApologizeExisted())
            {
                BtnAdd.Text = "تم الاعتزار سابقا";
                BtnAdd.Enabled = false;
            }
        }
    }
    private void LoadData()
    {
        DataTable ApologizedInfoTbl = new DataTable("FalseX");
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT TRshehId FROM DowratTrsheh WHERE (EmpId = " + ET_Lib.Empid + ")", Con);
        string Commandx = "SELECT (Select DowraName From Dowraat Where DowraId = DowratTrsheh.DowraId)  AS DowraName , DowraApology.ApologyDate, DowraApology.ApologyReson FROM (DowraApology INNER JOIN DowratTrsheh ON DowraApology.TRshehId = DowratTrsheh.TRshehId) Where DowraApology.TRshehId = 0 ";
        OleDbDataReader Dr;
        OleDbDataAdapter DA = new OleDbDataAdapter("", ET_Lib.E_trainingConnection);
        try
        {
            Con.Open();
            Dr = Cmd.ExecuteReader();
            while (Dr.Read())
            {
                Commandx = Commandx + " Or DowraApology.TRshehId = " + Dr.GetValue(0).ToString();
            }
            DA.SelectCommand.CommandText = Commandx;
            DA.Fill(ApologizedInfoTbl);
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        GridViewApologize.DataSource = ApologizedInfoTbl;
        GridViewApologize.DataBind();
    }

    private string TRshehId(string EmpID, string CourseID)
    {
        string ReturnMe = string.Empty;
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT TRshehId FROM DowratTrsheh WHERE (EmpId = " + EmpID + ") AND (DowraId = " + CourseID + ")", Con);
        OleDbDataReader Dr;
        try
        {
            Con.Open();
            Dr = Cmd.ExecuteReader();
            if (Dr.HasRows)
            {
                Dr.Read();
                ReturnMe = Dr.GetValue(0).ToString();
            }
            else
            {
                ReturnMe = "NULL";
            }
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            ReturnMe = "NULL";
        }
        return ReturnMe ;
    }
    private bool CheckApologizeExisted()
    {
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT TRshehId, ApologyDate, ApologyReson FROM DowraApology WHERE (TRshehId = " + ViewState["TRshehId"].ToString() + ")", Con);
        OleDbDataReader Dr;
        try
        {
            Con.Open();
            Dr = Cmd.ExecuteReader();
            if (Dr.HasRows)
            {
                Dr.Read();
                TxtReason.Text = Dr.GetValue(2).ToString();
                LblApologizeDate.Text = Convert.ToDateTime(Dr.GetValue(1).ToString()).ToShortDateString().ToString();
                Cmd.CommandText = "SELECT DowraName FROM Dowraat WHERE (DowraId = " + Request.QueryString["Courseid"].ToString() + ")";
                Dr.Close();
                LblCourseName.Text = Cmd.ExecuteScalar().ToString();
                Con.Close();
                return true;
            }
            else
            {
                Con.Close();
                return false;
            }
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            Con.Close();
            return false;
        }
    }
    private void GetCourseName(string CourseID)
    {
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT DowraName FROM Dowraat WHERE (DowraId = " + CourseID + ")", Con);
        try
        {
            Con.Open();
            LblCourseName.Text = Cmd.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        Con.Close();
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        string ApoloReason = "NULL";
        if (TxtReason.Text.Trim().Length != 0)
        {
            ApoloReason = TxtReason.Text;
        }
        OleDbCommand Cmd = new OleDbCommand("", Con);
        try
        {
            Con.Open();
            Cmd.CommandText = "UPDATE DowraApology SET ApologyDate = #" + DateTime.Today.ToShortDateString().ToString() + "#, ApologyReson = '" + ApoloReason + "' WHERE (DowraApology.TRshehId = " + TRshehId(ET_Lib.Empid, Request.QueryString["Courseid"].ToString()) + ")";
            if (Cmd.ExecuteNonQuery() == 0)
            {
                Cmd.CommandText = "INSERT INTO DowraApology (TRshehId, ApologyDate, ApologyReson) VALUES (" + TRshehId(ET_Lib.Empid, Request.QueryString["Courseid"].ToString()) + ", #" + DateTime.Today.ToShortDateString().ToString() + "#, '" + ApoloReason + "')";
                Cmd.ExecuteNonQuery();
            }
            Response.Redirect("~/TrainerCourses.aspx");
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        Con.Close();
    }
}
