using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_InsCoursesViewerUC : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! IsPostBack)
        {
            ViewState["ItemPerPage"] = 2;
            Repeater1.Visible = false;
            LoadTypes();
        }
    }
    private void LoadTypes()
    {
        //OleDbConnection Con = ET_Lib.E_trainingConnection;
        //OleDbCommand Cmd = new OleDbCommand("", Con);
        DataTable Typez = new DataTable("");
        OleDbDataAdapter Da = new OleDbDataAdapter("SELECT DowraTypeID, DowraTypeName FROM DowraType", ET_Lib.E_trainingConnection);
        try
        {
            Da.Fill(Typez);
            DDLTypes.DataSource = Typez;
            DDLTypes.DataTextField = "DowraTypeName";
            DDLTypes.DataValueField = "DowraTypeID";
            DDLTypes.DataBind();
        }
        catch (Exception ex)
        {
            LblState.Visible = true;
            LblState.Text = ex.Message;
        }
    }
    private void LoadData()
    {
        DataTable CoursesInfo = new DataTable("CoursesInfo");
        try
        {
            using (OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT DowraId, (SELECT DowraTypeName FROM DowraType WHERE (DowraTypeID = Dowraat.DowraTypeID)) As CourseType, DowraName, (SELECT PlaceName FROM CdPlace WHERE (DowraPlace = Dowraat.DowraPlace)) As CoursePlace, StartDate, EndDate, Price, (iif ([WithExam] = True,'نعم','لا')) As WithExam, ExamMax, ExamMin, (iif ([ApologyAllow] = True,'نعم','لا')) As ApologyAllow, rem, (Select LabName From CdLab Where LabId = Dowraat.LabId) As LabName, '~/CourseAgendaDetials.aspx?CourseID=' & DowraId AS AgendaURL, '~/CourseTrainerDetials.aspx?CourseID=' & DowraId AS TrainerURL FROM Dowraat Where DowraTypeID =" + DDLTypes.SelectedValue, ET_Lib.E_trainingConnection))
            {
                AccessDA.Fill(CoursesInfo);
                ViewState["CoursesInfoTbl"] = CoursesInfo;
            }
            if (CoursesInfo.Rows.Count > (int)ViewState["ItemPerPage"])
            {//Fill Repeater with Page Names
                DataTable RepeaterPagesNames = new DataTable("");
                RepeaterPagesNames.Columns.Add("PageName");
                for (int i = 1; i < CoursesInfo.Rows.Count / (int)ViewState["ItemPerPage"]; i++)
                {
                    RepeaterPagesNames.Rows.Add(i.ToString());
                }
                //Repeater1.DataSource = RepeaterPagesNames;
                //Repeater1.DataBind();
            }
            DataTable PageZero = new DataTable("");
            DataList1.DataSource = CoursesInfo;
            DataList1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    protected void Repeater1_PreRender(object sender, EventArgs e)
    {
        //foreach (RepeaterItem item in Repeater1.Items)
        //{
        //    LinkButton li = (LinkButton)item.FindControl("LinkButton1");
        //    if (li.Text == ViewState["pageid"].ToString())
        //    {
        //        li.Enabled = false;
        //    }
        //    else
        //    {
        //        li.Enabled = true;
        //    }
        //}
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton li1 = (LinkButton)sender;
        ViewState["pageid"] = li1.Text;
        LoadData();

    }
    protected void DDLTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLTypes.SelectedIndex != -1)
        {
            LoadData();
        }
    }
}
