using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_TrnCourseTrainerViewerUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["CourseID"] != null)
            {
                LoadData(Request.QueryString["CourseID"].ToString());
            }

        }
    }
    private void LoadData(string CourseID)
    {
        LblState.Visible = false;
        DataTable AgendaViewer = new DataTable("");
        using (OleDbDataAdapter Da = new OleDbDataAdapter(String.Format("SELECT Emp_Data.EmpName, (SELECT JobName FROM Cdjob WHERE job = Emp_Data.job) As JobName, Emp_Data.email FROM (DowraModreb INNER JOIN Emp_Data ON DowraModreb.EmpId = Emp_Data.EmpId) WHERE DowraModreb.DowraId = {0}", CourseID), ET_Lib.E_trainingConnection))
        {
            try
            {
                Da.Fill(AgendaViewer);
                GridViewTrainerViewer.DataSource = AgendaViewer;
                GridViewTrainerViewer.DataBind();
            }
            catch (Exception ex)
            {
                GridViewTrainerViewer.DataSource = null;
                GridViewTrainerViewer.DataBind();
                LblState.Text = ex.Message;
                LblState.Visible = true;
            }
        }
    }
}
