using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class StudentViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GVEditor_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Saf")
        {
            string StudentCode = e.GetListSourceFieldValue("stid").ToString();
            DataTable SafTbl = MCfrsan.LoadDataTable(@"SELECT alsofof_code, alsofof_name FROM alsofof", false);

            DataTable dt = MCfrsan.LoadDataTable(@"SELECT (SELECT alsofof_code FROM student_t WHERE stu_code = student.stu_code AND asase_code = (SELECT MAX(asase_code) FROM student_t)) AS alsofof_code FROM student where stu_code = " + StudentCode, false, MCfrsan.ConnectionStringdataschool());

            foreach (DataRow row in SafTbl.Rows)
            {
                if (row["alsofof_code"].ToString() == dt.Rows[0][0].ToString())
                {
                    e.Value = row["alsofof_name"].ToString();
                    break;
                }
            }
            
        }

    }
}