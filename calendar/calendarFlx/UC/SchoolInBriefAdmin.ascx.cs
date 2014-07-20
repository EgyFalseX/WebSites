using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data.OleDb;


public partial class SchoolInBriefAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_ABOUT"] == null)
            Response.Redirect("LoginABOUT.aspx");
        if (RadListView1.Items.Count == 0)
            RadListView1.IsItemInserted = true;
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }
    protected void RCBID_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        //RadUploadPicUrl.UploadedFiles.Clear();
        if (RCBID.SelectedIndex < 0)
            return;
        LblState.Text = string.Empty;
    }
    protected void RBtnUpdate_Click(object sender, EventArgs e)
    {
        if (FUImage.HasFile == false)
            return;
        if (RCBID.SelectedIndex < 0)
            return;
        string NewFileName = "NULL";
        if (FUImage.HasFile)
        {

            NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + System.IO.Path.GetFileName(FUImage.PostedFile.FileName);
            FUImage.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(@"images") + "/" + NewFileName);
        }
        OleDbConnection con = new OleDbConnection(ConnectionStr("ABOUT.mdb"));
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = String.Format(@"Update lines Set imageline1 = '../images/{0}' Where vid = {1}", NewFileName, RCBID.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "Update Complated";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (OleDbException ex)
        {
            LblState.Text = ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
}