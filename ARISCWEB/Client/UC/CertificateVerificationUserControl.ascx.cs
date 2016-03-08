using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_UC_CertificateVerificationUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void selectAddASPxButton_Click(object sender, EventArgs e)
    {
      // DBConnectClass con= new DBConnectClass("AATSWEB.mdb");
        ViewState["code"] = codeASPxTextBox.Text;
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT TBLTrainee.TraineeName, TBLTraineeCertificates.ReceiptDate, TBLTraineeCertificates.UniqueNo, TBLCourses.CourseName, TBLTraineeCertificates.CourseId,TBLCourses.StartDate, TBLCourses.EndDate FROM ((TBLTrainee INNER JOIN TBLTraineeCertificates ON TBLTrainee.TraineeID = TBLTraineeCertificates.TraineeID) INNER JOIN TBLCourses ON TBLTraineeCertificates.CourseId = TBLCourses.CourseId) WHERE (TBLTraineeCertificates.UniqueNo ='" + ViewState["code"] + "')", certificateSqlDataSource.ConnectionString);
       // DBConnectClass.OpenConn();
        DataTable dt = new DataTable();
        da.Fill(dt);   
        ClearMethod();
        if (dt.Rows.Count > 0)
        {
            nameASPxLabel.Text = dt.Rows[0][0].ToString();
            courseASPxLabel.Text = dt.Rows[0][3].ToString();
            DateTime sd = Convert.ToDateTime(dt.Rows[0][5]);

            startDateASPxLabel.Text = sd.ToString("dd/MM/yyyy");

            DateTime ed = Convert.ToDateTime(dt.Rows[0][6]);
            endDateASPxLabel.Text = ed.ToString("dd/MM/yyyy"); ;
        }
        else
            msgNotifyASPxLabel.Text = "هذه الشهادة غير مسجلة لدينا";

    }

    private void ClearMethod()
    {
        msgNotifyASPxLabel.Text = "";
        nameASPxLabel.Text = "";
        courseASPxLabel.Text = "";
        startDateASPxLabel.Text = "";
        endDateASPxLabel.Text = "";
    }
}