using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ValidCertificateCheck : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
        PnlInfo.Visible = false;

        System.Data.DataTable dt = DB.SearchForCertificate(RTxtCN.Text.Trim());
        if (dt.Rows.Count > 0)
        {
            PnlInfo.Visible = true;
            LblUniqueNo.Text = dt.Rows[0]["UniqueNo"].ToString();
            LblCourseId.Text = dt.Rows[0]["CourseId"].ToString();
            LblTraineeID.Text = dt.Rows[0]["TraineeID"].ToString();
            Lbltrineer.Text = dt.Rows[0]["trineer"].ToString();
            LblReceiptDate.Text = dt.Rows[0]["ReceiptDate"].ToString();
        }
        else
            LblState.Visible = true;
    }
}