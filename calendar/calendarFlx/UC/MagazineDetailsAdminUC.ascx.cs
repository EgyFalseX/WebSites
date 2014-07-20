using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.IO;
using System.Data.OleDb;

public partial class MagazineDetailsAdminUC : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_magazine"] == null)
            Response.Redirect("Loginmagazine.aspx");
        SqlDataSourceCodez.ConnectionString = ConnectionStr("magazine.mdb");
        SqlDataSourceaddno.ConnectionString = ConnectionStr("magazine.mdb");
    }
    protected void RadGridEditor_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            DisplayMessage(String.Format("We Didn't Edit Because{0}{1}", Environment.NewLine, e.Exception.Message));
        }
        else
            DisplayMessage("Edit Complated");
    }
    protected void RadGridEditor_ItemInserted(object source, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            DisplayMessage(String.Format("We Didn't Add Because{0}{1}", Environment.NewLine, e.Exception.Message));
        }
        else
            DisplayMessage("Adding Complated");
    }
    protected void RadGridEditor_ItemDeleted(object source, Telerik.Web.UI.GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            DisplayMessage(String.Format("We Didn't Delete Because : {0}{1}", Environment.NewLine, e.Exception.Message));
        }
        else
            DisplayMessage("Deleting Complated");
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
        LblState.Text = string.Empty;
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }
    protected void RCBaddcont_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        //RadUploadPicUrl.UploadedFiles.Clear();
        if (RCBaddcont.SelectedIndex < 0)
            return;
        LblState.Text = string.Empty;
    }
    protected void RBtnUpdate_Click(object sender, EventArgs e)
    {
        if (FUImage.HasFile == false)
            return;
        if (RCBaddcont.SelectedIndex < 0)
            return;
        string NewFileName = "NULL";
        if (FUImage.HasFile)
        {
            
            NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + System.IO.Path.GetFileName(FUImage.PostedFile.FileName);
            FUImage.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(@"images") + "/" + NewFileName);
        }
        OleDbConnection con = new OleDbConnection(ConnectionStr("magazine.mdb"));
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = String.Format(@"Update addcont Set subimage = '../images/{0}' Where contid = {1}", NewFileName, RCBaddcont.SelectedValue);
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