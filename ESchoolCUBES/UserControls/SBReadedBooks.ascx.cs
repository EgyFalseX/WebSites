using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class UserControl_SBReadedBooks : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable DT = new DataTable("ReadedBooks");
        try
        {
            if (TheSessions.StudentID != null)
            {
                OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT motaraded.[number], book.name_book, motaraded.[date] FROM (motaraded INNER JOIN book ON motaraded.[number] = book.[number]) WHERE (motaraded.code_name = " + TheSessions.StudentID + ")", MySchool.LibraryConnection);
                AccessDA.Fill(DT);
            }
            GridViewReadedBooks.DataSource = DT;
            ViewState["ReadedBooksTable"] = DT;
            GridViewReadedBooks.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
}
