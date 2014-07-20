using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MagazinesAdminUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_magazine"] == null)
            Response.Redirect("Loginmagazine.aspx");
        SqlDataSourceCodez.ConnectionString = ConnectionStr("magazine.mdb");
        SqlDataSourceid_starting.ConnectionString = ConnectionStr("magazine.mdb");
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
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }
}