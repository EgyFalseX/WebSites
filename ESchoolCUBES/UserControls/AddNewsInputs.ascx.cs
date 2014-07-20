using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class UserControls_AddNewsInputs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["status"] != null)
        {
            switch (Request.QueryString["status"].ToString())
            {
                case "success":
                    //if success
                    LblStatus.ForeColor = System.Drawing.Color.Green;
                    LblStatus.Text = "تمت الاضافه";
                    break;
                case "failed":
                    //if failed
                    LblStatus.Text = "خطاء!!  لم تتم الاضافه";
                    LblStatus.ForeColor = System.Drawing.Color.Red;
                    break;
                case "missing":
                    //if missing
                    LblStatus.Text = "خطأ!! البيانات ليست كامله";
                    LblStatus.ForeColor = System.Drawing.Color.Blue;
                    break;
                default:
                    break;
            }

        }

    }

    protected void BtnAddNews_Click(object sender, EventArgs e)
    {
        if (TxtDetails.Text.Trim().Length > 0 && TxtTitle.Text.Trim().Length > 0 && TxtDate.Text.Trim().Length > 0)
        {
            OleDbConnection AccessCon = MySchool.ServicesConnection;
            OleDbCommand AccessCmd;
            if (CBShow.Checked)
            {
                AccessCmd = new OleDbCommand("INSERT INTO News (news_title, news_details, Timeline, id_starting) VALUES ('" + TxtTitle.Text.Trim() + "', '" + TxtDetails.Text.Trim() + "', #" + TxtDate.Text.Trim() + "#,2)", AccessCon);
            }
            else
            {
                AccessCmd = new OleDbCommand("INSERT INTO News (news_title, news_details, Timeline, id_starting) VALUES ('" + TxtTitle.Text.Trim() + "', '" + TxtDetails.Text.Trim() + "', #" + TxtDate.Text.Trim() + "#,1)", AccessCon);
            }

            try
            {
                AccessCon.Open();
                AccessCmd.ExecuteNonQuery();
                AccessCon.Close();
            }
            catch
            {
                AccessCon.Close();
                Response.Redirect("AddNews.aspx?status=failed");
            }
            Response.Redirect("AddNews.aspx?status=success");
        }
        else
        {
            Response.Redirect("AddNews.aspx?status=missing");
        }

    }

}
