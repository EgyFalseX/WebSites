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

public partial class UserControls_AddInfoInputs : System.Web.UI.UserControl
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

    protected void BtnAddInfo_Click(object sender, EventArgs e)
    {
        if (TxtDetails.Text.Trim().Length > 0 && LBDay.SelectedIndex != -1)
        {
            OleDbConnection AccessCon = MySchool.ServicesConnection; 
            OleDbCommand AccessCmd = new OleDbCommand("INSERT INTO tb_info (name_info, day_info) VALUES ('" + TxtDetails.Text.Trim() + "', " + LBDay.SelectedValue + ")", AccessCon);
            try
            {
                AccessCon.Open();
                AccessCmd.ExecuteNonQuery();
                AccessCon.Close();
            }
            catch
            {
                AccessCon.Close();
                Response.Redirect("AddInfo.aspx?status=failed");
            }
            Response.Redirect("AddInfo.aspx?status=success");
        }
        else
        {
            Response.Redirect("AddInfo.aspx?status=missing");
        }

    }

}
