using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class TataematGride : System.Web.UI.UserControl
{
    
    public string StudentID;

    protected void Page_Load(object sender, EventArgs e)
    {
        //StudentID ex. = 1415002052
        StudentID = (string)HttpContext.Current.Session["STID"];
        loaddata();
    }

    public void loaddata()
    {
        DataTable ReqTable = new DataTable("Tataem_Table");
        DataTable CodeTable = new DataTable("Code_Table");
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT type_eltataem, date_eltataem, stu_code FROM [stu_ eltataem] WHERE (stu_code = " + StudentID + ")", MySchool.StudentConnection);
        try
        {
            AccessDA.Fill(ReqTable);
            AccessDA = new OleDbDataAdapter("SELECT code_eltataem,name_eltataem FROM eltataem_code", MySchool.TheCodesConnection);
            AccessDA.Fill(CodeTable);
            int TablemNumirc = 0;
            foreach (DataRow RowX in ReqTable.Rows)
            {
                foreach (DataRow CRow in CodeTable.Rows)
                {
                    RowX[2] = TablemNumirc + 1;
                    TablemNumirc++;
                    if (RowX[0].ToString() == CRow[0].ToString())
                    {
                        RowX[0] = CRow[1].ToString();
                        break;
                    }
                }
            }
        }
        catch
        {
            //Put Handler for errors
        }
        GridViewTataem.DataSource = ReqTable;
        GridViewTataem.DataBind();
    }

    protected void GridViewTataem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewTataem.PageIndex = e.NewPageIndex;
        loaddata();
    }
}
