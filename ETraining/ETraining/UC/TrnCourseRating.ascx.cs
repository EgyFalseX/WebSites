using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Xml;

public partial class UC_TrnCourseRating : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ET_Lib.CheckEmpType(ET_Lib.EmpType_Enum.Trainer))//Check If user is logged and have Permission to see the form
        {
            if (!EvalAllow())
            {
                LblState.Text = "لا يمكن تقيم هذه الدوره";
                LblState.Visible = true;
                BtnSave.Visible = false;
                return;
            }
            if (!IsPostBack)
            {
                LoadEvalItem();
                LoadEvalTextItem();
            }
        }
    }
    private bool EvalAllow()
    {
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT DowraId FROM Dowraat WHERE (EvalAllow = True) AND (DowraId = " + Request.QueryString["CourseID"] + ")", Con);
        OleDbDataReader Dr;
        try
        {
            Con.Open();
            Dr = Cmd.ExecuteReader();
            if (Dr.HasRows)
            {
                Con.Close();
                return true;
            }
            
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        Con.Close();
        return false;
    }
    private void LoadEvalItem()
    {
        DataTable EvalItem = new DataTable("FalseX2010");
        OleDbDataAdapter Da = new OleDbDataAdapter("SELECT EvalItemId, EvalItemName, '' AS EvalValue FROM CdEvalItems WHERE (EvalItemType = " + ET_Lib.EvalItemType_Course + ") AND (NOT EXISTS (SELECT TRshehId, EvalItemId, dateEval, EvalDegree FROM DowraEvalioutionTrainer WHERE (TRshehId = (SELECT TRshehId FROM  DowratTrsheh WHERE (EmpId = " + ET_Lib.Empid + ") AND (DowraId = " + Request.QueryString["CourseID"] + "))) AND (EvalItemId = CdEvalItems.EvalItemId)))", ET_Lib.E_trainingConnection);
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
        }
    }
    private void LoadEvalTextItem()
    {
        DataTable EvalTextItem = new DataTable("FalseX2010");
        OleDbDataAdapter Da = new OleDbDataAdapter("SELECT CdEvalItemsText.EvalItemTextId, CdEvalItemsText.EvalItemTextName, IIF(DowraEvalioutionTrainerText.TRshehId = " + GetTRshehId() + ",DowraEvalioutionTrainerText.EvalText,'') AS EvalText FROM (CdEvalItemsText LEFT OUTER JOIN DowraEvalioutionTrainerText ON CdEvalItemsText.EvalItemTextId = DowraEvalioutionTrainerText.EvalItemTextId)",ET_Lib.E_trainingConnection);
        try
        {
            Da.Fill(EvalTextItem);
            DLEvalText.DataSource = EvalTextItem;
            DLEvalText.DataBind();
            ViewState["EvalTextItem"] = EvalTextItem;
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
    }
    protected void DDLRate_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList DDLRateX = (DropDownList)sender;
        DataTable EvalItem = (DataTable)ViewState["EvalItem"];
        if (DDLRateX.SelectedIndex != 0)
        {
            GridViewRow GVR = (GridViewRow)DDLRateX.Parent.Parent;
            EvalItem.Rows[GVR.RowIndex]["EvalValue"] = DDLRateX.SelectedValue;
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        DataTable EvalItem = (DataTable)ViewState["EvalItem"];
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("", Con);
        string TRshehId = string.Empty;
        string EvalItemId = string.Empty;
        try
        {
            Con.Open();
            Cmd.CommandText = "SELECT TRshehId FROM DowratTrsheh WHERE (EmpId = " + ET_Lib.Empid + ") AND (DowraId = " + Request.QueryString["CourseID"] + ")";
            TRshehId = Cmd.ExecuteScalar().ToString();
            foreach (DataRow Row in EvalItem.Rows)
            {
                if (Row["EvalValue"].ToString() != string.Empty)
                {
                    EvalItemId = Row["EvalValue"].ToString();
                    Cmd.CommandText = "INSERT INTO DowraEvalioutionTrainer (TRshehId, EvalItemId, dateEval, EvalDegree) VALUES (" + TRshehId + ", " + Row["EvalItemId"].ToString() + ", #" + DateTime.Today.ToShortDateString() + "#, " + Row["EvalValue"].ToString() + ")";
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
                ReturnMe= Dr.GetValue(0).ToString();
            }
        }
        catch (Exception ex)
        {
            LblState.Text = ex.Message;
            LblState.Visible = true;
        }
        return ReturnMe;
    }
    protected void BtnSaveComment_Click(object sender, EventArgs e)
    {
        Button Btn = (Button)sender;
        DataListItem DLI = (DataListItem)Btn.Parent;
        DataList DL = (DataList)DLI.Parent;
        DataTable EvalTextItem = (DataTable)ViewState["EvalTextItem"];
        string EvalItemTextId = string.Empty;
        EvalItemTextId = EvalTextItem.Rows[DLI.ItemIndex]["EvalItemTextId"].ToString();
        TextBox txt = (TextBox)DLI.FindControl("TxtComment");
        Label Lbl = (Label)DLI.FindControl("LblNotify");
        Lbl.Text = string.Empty;
        int Idx = (int)DLI.ItemIndex;
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("UPDATE DowraEvalioutionTrainerText SET dateEval = #" + DateTime.Today.ToShortDateString() + "#, EvalText = '" + txt.Text + "' WHERE (DowraEvalioutionTrainerText.TRshehId = " + GetTRshehId() + ") AND (DowraEvalioutionTrainerText.EvalItemTextId = " + EvalItemTextId + ")", Con);
        try
        {
            Con.Open();
            if (Cmd.ExecuteNonQuery() == 0)
            {
                Cmd.CommandText = "INSERT INTO DowraEvalioutionTrainerText (TRshehId, EvalItemTextId, dateEval, EvalText) VALUES (" + GetTRshehId() + ", " + EvalItemTextId + ", #" + DateTime.Today.ToShortDateString() + "#, '" + txt.Text + "')";
                Cmd.ExecuteNonQuery();
            }
            Lbl.Text = "تم الاضـــــــافه";
            Lbl.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            Lbl.Text = ex.Message;
            Lbl.ForeColor = System.Drawing.Color.Red;
        }
        Con.Close();
        
    }
}