using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_TrnInstructorRating : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!ET_Lib.CheckEmpType(ET_Lib.EmpType_Enum.Trainer))
        {
            LblState.Text = "لا يمكنك تقييم المدربين";
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (!IsPostBack)
        {
            LoadIns();
        }
    }
    private void LoadIns()
    {
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT EmpId,(Select EmpName From Emp_Data Where EmpId = DowraModreb.EmpId) As EmpName  FROM DowraModreb WHERE (DowraId = " + Request.QueryString["CourseID"] + ")", ET_Lib.E_trainingConnection);
        DataTable InsTbl = new DataTable("FalseX2010");
        try
        {
            da.Fill(InsTbl);
            ET_Lib.EmptyRow(InsTbl);
            DDLIns.DataSource = InsTbl;
            DDLIns.DataTextField = "EmpName";
            DDLIns.DataValueField = "EmpId";
            DDLIns.DataBind();
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
    }
    private void LoadEvalTypes()
    {
        DataTable EvalItem = new DataTable("FalseX2010");
        OleDbDataAdapter Da = new OleDbDataAdapter("SELECT EvalItemId, EvalItemName, '' AS EvalValue FROM CdEvalItems WHERE (EvalItemType = " + ET_Lib.EvalItemType_Ins + ") AND (NOT EXISTS (SELECT TRshehId, EvalItemId, dateEval, EvalDegree FROM DowraEvalioutionModreb WHERE (TRshehId = (SELECT TRshehId FROM  DowratTrsheh WHERE (EmpId = " + ET_Lib.Empid + ") AND (DowraId = " + Request.QueryString["CourseID"] + "))) AND (EvalItemId = CdEvalItems.EvalItemId)))", ET_Lib.E_trainingConnection);
        try
        {
            Da.Fill(EvalItem);
            GVRating.DataSource = EvalItem;
            GVRating.DataBind();
            ViewState["EvalItem"] = EvalItem;
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void DDLIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        LblState.Visible = false;
        if (DDLIns.SelectedIndex <= 0)
        {
            BtnSave.Visible = false;
            return;
        }
        BtnSave.Visible = true;
        LoadEvalTypes();
    }
    private string GetTRshehId()
    {
        //Request.QueryString["CourseID"]
        string ReturnMe = DBNull.Value.ToString();
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT TRshehId FROM DowratTrsheh WHERE (EmpId = " + ET_Lib.Empid + ") AND (DowraId = " + Request.QueryString["CourseID"] + ")", Con);
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
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        return ReturnMe;
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
        DataTable EvalItem = (DataTable)ViewState["EvalItem"];
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("", Con);
        string TRshehId = GetTRshehId();;
        string EvalItemId = string.Empty;
        try
        {
            Con.Open();
            foreach (GridViewRow r in GVRating.Rows)
            {
                DropDownList ddl = (DropDownList)r.FindControl("DDLRate");
                if (ddl.SelectedIndex != 0)
                {
                    Cmd.CommandText = "UPDATE DowraEvalioutionModreb SET dateEval = #" + DateTime.Today.ToShortDateString() + "#, EvalDegree = " + ddl.SelectedValue.ToString() + " WHERE (TRshehId = " + TRshehId + ") AND (EvalItemId = " + EvalItem.Rows[r.RowIndex]["EvalItemId"].ToString() + ") AND (EmpId = " + DDLIns.SelectedValue.ToString() + ")";
                    if (Cmd.ExecuteNonQuery() == 0)
                    {
                        Cmd.CommandText = "INSERT INTO DowraEvalioutionModreb (TRshehId, EvalItemId, EmpId, dateEval, EvalDegree) VALUES (" + TRshehId + ", " + EvalItem.Rows[r.RowIndex]["EvalItemId"].ToString() + ", " + DDLIns.SelectedValue.ToString() + ", #" + DateTime.Today.ToShortDateString() + "#, " + ddl.SelectedValue.ToString() + ")";
                        Cmd.ExecuteNonQuery();
                        LblState.Text = "تم الاضافـــــــــه";
                        LblState.Visible = true;
                        LblState.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
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
