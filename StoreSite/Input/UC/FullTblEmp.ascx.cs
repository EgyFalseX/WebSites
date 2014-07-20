using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Sql;
using Microsoft.SqlServer.Server;
using Functions;

public partial class FullTblEmp : System.Web.UI.UserControl
{
    SqlConnection Conn = MC.EStoreConnection;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.UserID == string.Empty)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            loadSelect();
        }
    }
    private void loadQual()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT QualID,QualName FROM CdQual", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListQual.DataSource = ds.Tables[0];
        DropDownListQual.DataValueField = "QualID";
        DropDownListQual.DataTextField = "QualName";
        DropDownListQual.DataBind();
    }
    private void loadQualTakdeer()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT QualTakder,QualTakerName FROM CdQualTakder", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListQualTakdeer.DataSource = ds.Tables[0];
        DropDownListQualTakdeer.DataValueField = "QualTakder";
        DropDownListQualTakdeer.DataTextField = "QualTakerName";
        DropDownListQualTakdeer.DataBind();
    }
    private void loadQualTakasos(string qualID)
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT QualId,QualTakasos,QualTakasosName FROM CdQualTakasos WHERE QualId = " + qualID, Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListQualTakasos.DataSource = ds.Tables[0];
        DropDownListQualTakasos.DataValueField = "QualTakasos";
        DropDownListQualTakasos.DataTextField = "QualTakasosName";
        DropDownListQualTakasos.DataBind();
    }
    private void loadQualGeha()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT QualGehaName,QualGehaId FROM Geha", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListQualGeha.DataSource = ds.Tables[0];
        DropDownListQualGeha.DataValueField = "QualGehaId";
        DropDownListQualGeha.DataTextField = "QualGehaName";
        DropDownListQualGeha.DataBind();
    }
    private void loadJob()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT JobId,JobId1 FROM CdJob", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListJob.DataSource = ds.Tables[0];
        DropDownListJob.DataValueField = "JobId";
        DropDownListJob.DataTextField = "JobId1";
        DropDownListJob.DataBind();
    }
    private void loadJobDesc()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT JobDescId,JobDescName,JobBisicSalary FROM CdJobDesc", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListJobDesc.DataSource = ds.Tables[0];
        DropDownListJobDesc.DataValueField = "JobDescId";
        DropDownListJobDesc.DataTextField = "JobDescName";
        DropDownListJobDesc.DataBind();
    }
    private void loadBranch()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT Branchecode,Branchename,BrancheAADDRES,BrancheTel,BrancheMobil,Branchefax FROM CdBranches", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListBranch.DataSource = ds.Tables[0];
        DropDownListBranch.DataValueField = "Branchecode";
        DropDownListBranch.DataTextField = "Branchename";
        DropDownListBranch.DataBind();
    }
    private void loadEdara()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT EdaraId,EdaraName FROM CdEdara", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListEdara.DataSource = ds.Tables[0];
        DropDownListEdara.DataValueField = "EdaraId";
        DropDownListEdara.DataTextField = "EdaraName";
        DropDownListEdara.DataBind();
    }
    private void loadDept()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT DepID,DepName FROM CdDepertement", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListDept.DataSource = ds.Tables[0];
        DropDownListDept.DataValueField = "DepID";
        DropDownListDept.DataTextField = "DepName";
        DropDownListDept.DataBind();
    }
    private void loadSalaryType()
    {
        SqlDataAdapter dap = new SqlDataAdapter("SELECT SalaryTypeId,SalaryTypeName FROM CdSalaryType", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownListSalaryType.DataSource = ds.Tables[0];
        DropDownListSalaryType.DataValueField = "SalaryTypeId";
        DropDownListSalaryType.DataTextField = "SalaryTypeName";
        DropDownListSalaryType.DataBind();
    }
    private void loadSelect()
    {
        loadGrid();
        loadQual();
        loadQualTakasos(DropDownListQual.SelectedItem.Value);
        loadQualTakdeer();
        loadQualGeha();
        loadJob();
        loadJobDesc();
        loadBranch();
        loadEdara();
        loadDept();
        loadSalaryType();
    }
    private void loadGrid()
    {
        Conn.Open();
        /////////////////////////////////
        SqlCommand Acmd = new SqlCommand("SELECT  MAX(EmpID) AS max FROM TblEmp", Conn);
        string newid = Acmd.ExecuteScalar().ToString();
        if (newid == "")
            newid = "1";
        else
            newid = (Convert.ToInt32(newid)).ToString();
        TextEmpID.Text = (Convert.ToInt32(newid)).ToString();
        //SELECT EmpID,EmpName,NationalId,BrithDate
        //SELECT QualId,*QualName,QualTakasos,*QualTakasosName,QualGehaId,*GOV,YearQual,QualTakder,*QualTakerName
        //SELECT JobId,*JobId1,JobDescId,*JobDescName,BranchId,*Branchename,EdaraId,*EdaraName,DepID,*DepName,mobil,WorkHour,SalaryTypeId,*SalaryTypeName 
        //SELECT phone,address,email,BasicSalary FROM TblEmp
        /*INNER JOIN CdQual ON TblEmp.QualId = CdQual.QualId
        INNER JOIN CdQualTakder ON TblEmp.QualTakder = CdQualTakder.QualTakder 
        INNER JOIN CdQualTakasos ON TblEmp.QualTakasos = CdQual.QualTakasos 
        INNER JOIN CdGov ON TblEmp.QualGehaId = CdGov.GOVId
        INNER JOIN CdJob ON TblEmp.JobId = CdQual.JobId
        INNER JOIN CdJobDesc ON TblEmp.JobDescId = CdJobDesc.JobDescId
        INNER JOIN CCdBranches ON TblEmp.BranchId = CdBranches.Branchecode 
        INNER JOIN CdEdara ON TblEmp.EdaraId = CdEdara.EdaraId
        INNER JOIN CdDepertement ON TblEmp.DepID = CdDepertement.DepID
        INNER JOIN CdSalaryType ON TblEmp.SalaryTypeId = CdSalaryType.SalaryTypeId*/
        Acmd.CommandText = "SELECT EmpID,EmpName,NationalId,BrithDate,QualId,QualTakasos,QualGehaId,YearQual,QualTakder,JobId,JobDescId,BranchId,EdaraId,DepID,BasicSalary,WorkHour,SalaryTypeId,mobil,phone,address,email FROM TblEmp";
        SqlDataAdapter dap = new SqlDataAdapter("SELECT EmpID,EmpName,NationalId,BrithDate,QualId,QualTakasos,QualGehaId,YearQual,QualTakder,JobId,JobDescId,BranchId,EdaraId,DepID,BasicSalary,WorkHour,SalaryTypeId,mobil,phone,address,email FROM TblEmp", Conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        SqlDataReader reader = Acmd.ExecuteReader();
        GridViewTblEmp.DataSource = reader;
        //GridViewTblEmp.DataSource = ds;
        GridViewTblEmp.DataBind();
        Conn.Close();
    }
    protected void ButnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string qualid = DropDownListQual.SelectedItem.Value;
            string takderid = DropDownListQualTakdeer.SelectedItem.Value;
            string takhasosid = DropDownListQualTakasos.SelectedItem.Value;
            string gehaid = DropDownListQualGeha.SelectedItem.Value;
            string jobid = DropDownListJob.SelectedItem.Value;
            string jobdescid = DropDownListJobDesc.SelectedItem.Value;
            string branchid = DropDownListBranch.SelectedItem.Value;
            string edaraid = DropDownListEdara.SelectedItem.Value;
            string deptid = DropDownListDept.SelectedItem.Value;
            string salarytype = DropDownListSalaryType.SelectedItem.Value;
            Conn.Open();
            SqlCommand Acmd = new SqlCommand("SELECT  MAX(EmpID) AS max FROM TblEmp", Conn);
            string newid = Acmd.ExecuteScalar().ToString();
            if (newid == "")
                newid = "1";
            else
                newid = (Convert.ToInt32(newid) + 1).ToString();
            //SELECT EmpID,EmpName,NationalId,BrithDate FROM TblEmp
            //SELECT QualId,QualTakasos,QualGehaId,YearQual,QualTakder FROM TblEmp
            //SELECT JobId,JobDescId,BranchId,EdaraId,DepID,mobil,WorkHour,SalaryTypeId FROM TblEmp 
            //SELECT phone,address,email,BasicSalary FROM TblEmp 
            Acmd.CommandText = "INSERT INTO TblEmp(EmpID,EmpName,NationalId,BrithDate,QualId,QualTakasos,QualGehaId,YearQual,QualTakder,JobId,JobDescId,BranchId,EdaraId,DepID,mobil,WorkHour,SalaryTypeId,phone,address,email,BasicSalary) VALUES('" + newid + "','" + TextEmpName.Text + "','" + TextNationId.Text + "','" + TextBrithDate.Text + "','" + qualid + "','" + takhasosid + "','" + gehaid + "','" + TextYearQual.Text + "','" + takderid + "','" + jobid + "','" + jobdescid + "','" + branchid + "','" + edaraid + "','" + deptid + "','" + TextMobile.Text + "','" + TextWorkHour.Text + "','" + salarytype + "','" + TextPhone.Text + "','" + TextAddress.Text + "','" + TextEMail.Text + "','" + TextBasicSalary.Text + "')";
            Acmd.ExecuteNonQuery();
            GridViewTblEmp.DataBind();
            Conn.Close();
            loadGrid();
            TextEmpID.Text = (Convert.ToInt32(newid) + 1).ToString();
            TextEmpName.Text = "";
            TextNationId.Text = "";
            TextBrithDate.Text = "";
            TextMobile.Text = "";
            TextPhone.Text = "";
            TextAddress.Text = "";
            TextEMail.Text = "";
            TextYearQual.Text = "";
            TextBasicSalary.Text = "";
            TextWorkHour.Text = "";
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GridViewTblEmp_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            GridViewTblEmp.EditIndex = e.NewEditIndex;
            loadGrid();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GridViewTblEmp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string newid = GridViewTblEmp.Rows[e.RowIndex].Cells[0].Text;
            Conn.Open();
            //SELECT EmpID,EmpName,NationalId,BrithDate FROM TblEmp
            SqlCommand Acmd = new SqlCommand("DELETE FROM TblEmp WHERE  EmpID='" + newid + "'", Conn);
            Acmd.ExecuteNonQuery();
            GridViewTblEmp.DataBind();
            Conn.Close();
            loadGrid();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GridViewTblEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            TextBox txtEmpID = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[0].Controls[0];
            string newEmpID = txtEmpID.Text;
            TextBox txtEmpName = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[1].Controls[0];
            string newEmpName = txtEmpName.Text;
            TextBox txtNationalId = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[2].Controls[0];
            string newNationalId = txtNationalId.Text;
            TextBox txtBrithDate = (TextBox)GridViewTblEmp.Rows[e.RowIndex].FindControl("TextBox1");
            DateTime newBrithDate = Convert.ToDateTime(txtBrithDate.Text);
            TextBox txtmobil = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[4].Controls[0];
            string newmobil = txtmobil.Text;
            TextBox txtphone = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[5].Controls[0];
            string newphone = txtmobil.Text;
            TextBox txtaddress = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[6].Controls[0];
            string newaddress = txtmobil.Text;
            TextBox txtemail = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[7].Controls[0];
            string newemail = txtemail.Text;
            string qualid = DropDownListQual.SelectedItem.Value;
            string takhasosid = DropDownListQualTakasos.SelectedItem.Value;
            string gehaid = DropDownListQualGeha.SelectedItem.Value;
            TextBox txtyearqual = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[11].Controls[0];
            string newyearqual = txtyearqual.Text;
            string takderid = DropDownListQualTakdeer.SelectedItem.Value;
            string jobid = DropDownListJob.SelectedItem.Value;
            string jobdescid = DropDownListJobDesc.SelectedItem.Value;
            string branchid = DropDownListBranch.SelectedItem.Value;
            string edaraid = DropDownListEdara.SelectedItem.Value;
            string deptid = DropDownListDept.SelectedItem.Value;
            TextBox txtBasicSalary = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[18].Controls[0];
            string newBasicSalary = txtBasicSalary.Text;
            TextBox txtWorkHour = (TextBox)GridViewTblEmp.Rows[e.RowIndex].Cells[19].Controls[0];
            string newWorkHour = txtWorkHour.Text;
            string salarytype = DropDownListSalaryType.SelectedItem.Value;
            Conn.Open();
            //SELECT EmpID,EmpName,NationalId,BrithDate FROM TblEmp
            SqlCommand Acmd = new SqlCommand("UPDATE TblEmp SET EmpName='" + newEmpName + "',NationalId='" + newNationalId + "',BrithDate='" + newBrithDate + "',mobil='" + newmobil + "',phone='" + newphone + "',address='" + newaddress + "',email='" + newemail + "',QualId='" + qualid + "',QualTakasos='" + takhasosid + "',QualGehaId='" + gehaid + "',YearQual='" + newyearqual + "',QualTakder='" + takderid + "',JobId='" + jobid + "',JobDescId='" + jobdescid + "',BranchId='" + branchid + "',EdaraId='" + edaraid + "',DepID='" + deptid + "',BasicSalary='" + newBasicSalary + "',WorkHour='" + newWorkHour + "',SalaryTypeId='" + salarytype + "' WHERE EmpID='" + newEmpID + "'", Conn);
            Acmd.ExecuteNonQuery();
            GridViewTblEmp.DataBind();
            Conn.Close();
            GridViewTblEmp.EditIndex = -1;
            loadGrid();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GridViewTblEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewTblEmp.EditIndex = -1;
        loadGrid();
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {

    }
    protected void TextEmpID_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownListQual_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadQualTakasos(DropDownListQual.SelectedItem.Value);
    }
    protected void DropDownListQualTakasos_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}