using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class NewUserControl_HonorBoard : System.Web.UI.UserControl
{
    public string STDID = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        STDID = "1416002071";
        //if (HttpContext.Current.Session["STID"] != null)
        //{
        //    STDID = HttpContext.Current.Session["STID"].ToString();
        //}
        if (!IsPostBack)
        {
            ViewState["pageid"] = 1;
            GetstudentInfo();
            GetPageCount();
        }
    }

    public void GetstudentInfo()
    {
        DataTable StudentInfo = new DataTable("StudentInfoTable");
        try
        {
            OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT stu.pic, stu.stu_name, stu.yy, stu.dd & '/' & stu.mm & '/' & stu.yy AS FalseX, Honor_board.name_Honor_board FROM (stu INNER JOIN Honor_board ON stu.Code_Honor_board = Honor_board.Code_Honor_board) WHERE (stu.stu_code = " + STDID + ") and viewpage =" + ViewState["pageid"], MySchool.ServicesConnection);
            AccessDA.Fill(StudentInfo);
            DataList1.DataSource = StudentInfo;
            DataList1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }

    }

    public void GetPageCount()
    {
        try
        {
            DataTable PaggingInfo = new DataTable("PaggingTable");

            OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT DISTINCT viewpage FROM stu", MySchool.ServicesConnection);
            AccessDA.Fill(PaggingInfo);
            Repeater1.DataSource = PaggingInfo;
            Repeater1.DataBind();
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message.ToString());
        }
    }

    protected void Repeater1_PreRender(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            LinkButton li = (LinkButton)item.FindControl("LinkButton1");
            if (li.Text == ViewState["pageid"].ToString())
            {
                li.Enabled = false;
            }
            else
            {
                li.Enabled = true;
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton li1 = (LinkButton)sender;
        ViewState["pageid"] = li1.Text;
        GetstudentInfo();

    }
}
