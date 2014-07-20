using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorEmp1 : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadDefaultData()
    {
        //Qua
        DataTable Qua = MC.LoadDataTable("SELECT QualID,QualName FROM CdQual");
        DropDownListQual.DataSource = Qua;
        DropDownListQual.DataValueField = "QualID";
        DropDownListQual.DataTextField = "QualName";
        DropDownListQual.DataBind();
        //Geha
        DataTable Geha = MC.LoadDataTable("SELECT QualGehaName,QualGehaId FROM Geha");
        DropDownListQualGeha.DataSource = Geha;
        DropDownListQualGeha.DataValueField = "QualGehaId";
        DropDownListQualGeha.DataTextField = "QualGehaName";
        DropDownListQualGeha.DataBind();
        //Takder
        DataTable Takder = MC.LoadDataTable("SELECT QualTakder,QualTakerName FROM CdQualTakder");
        DropDownListQualTakdeer.DataSource = Takder;
        DropDownListQualTakdeer.DataValueField = "QualTakder";
        DropDownListQualTakdeer.DataTextField = "QualTakerName";
        DropDownListQualTakdeer.DataBind();
        //Job
        DataTable Job = MC.LoadDataTable("SELECT JobId,JobId1 FROM CdJob");
        DropDownListJob.DataSource = Job;
        DropDownListJob.DataValueField = "JobId";
        DropDownListJob.DataTextField = "JobId1";
        DropDownListJob.DataBind();
        //JobDesc
        DataTable JobDesc = MC.LoadDataTable("SELECT JobDescId,JobDescName,JobBisicSalary FROM CdJobDesc");
        DropDownListJobDesc.DataSource = JobDesc;
        DropDownListJobDesc.DataValueField = "JobDescId";
        DropDownListJobDesc.DataTextField = "JobDescName";
        DropDownListJobDesc.DataBind();
        //Branch
        DataTable Branch = MC.LoadDataTable("SELECT Branchecode, Branchename FROM CdBranches");
        DropDownListBranch.DataSource = Branch;
        DropDownListBranch.DataValueField = "Branchecode";
        DropDownListBranch.DataTextField = "Branchename";
        DropDownListBranch.DataBind();
        //Edara
        DataTable Edara = MC.LoadDataTable("SELECT EdaraId,EdaraName FROM CdEdara");
        DropDownListEdara.DataSource = Edara;
        DropDownListEdara.DataValueField = "EdaraId";
        DropDownListEdara.DataTextField = "EdaraName";
        DropDownListEdara.DataBind();
        //Depertement
        DataTable Depertement = MC.LoadDataTable("SELECT DepID, DepName FROM CdDepertement");
        DropDownListDept.DataSource = Depertement;
        DropDownListDept.DataValueField = "DepID";
        DropDownListDept.DataTextField = "DepName";
        DropDownListDept.DataBind();
        //SalaryType
        DataTable SalaryType = MC.LoadDataTable("SELECT SalaryTypeId,SalaryTypeName FROM CdSalaryType");
        DropDownListSalaryType.DataSource = SalaryType;
        DropDownListSalaryType.DataValueField = "SalaryTypeId";
        DropDownListSalaryType.DataTextField = "SalaryTypeName";
        DropDownListSalaryType.DataBind();
    }
    private void Clear()
    { 

    }
    #endregion

#region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        TheSessions.UserID = "1";
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadDefaultData();
        }
    }
    protected void DropDownListQual_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable Qua = new DataTable();
        if (DropDownListQual.SelectedIndex > 0)
            Qua = MC.LoadDataTable("SELECT QualTakasos,QualTakasosName FROM CdQualTakasos Where QualId = " + DropDownListQual.SelectedValue);
        DropDownListQualTakdeer.DataSource = Qua;
        DropDownListQualTakdeer.DataValueField = "QualTakasos";
        DropDownListQualTakdeer.DataTextField = "QualTakasosName";
        DropDownListQualTakdeer.DataBind();
    }
    
#endregion



    protected void BtnSave_Click(object sender, EventArgs e)
    {

    }
}