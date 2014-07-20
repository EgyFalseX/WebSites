using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_TrnCourseAgendaViewerUC : System.Web.UI.UserControl
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
        using (OleDbDataAdapter Da = new OleDbDataAdapter(String.Format("SELECT ADate, TimeFrom, TimeTo, subject FROM DowraAgenda WHERE (DowraId = {0})", CourseID), ET_Lib.E_trainingConnection))
        {
            try
            {
                Da.Fill(AgendaViewer);
                GridViewAgendaViewer.DataSource = AgendaViewer;
                GridViewAgendaViewer.DataBind();
            }
            catch (Exception ex)
            {
                GridViewAgendaViewer.DataSource = null;
                GridViewAgendaViewer.DataBind();
                LblState.Text = ex.Message;
                LblState.Visible = true;
            }
        }
    }

}
