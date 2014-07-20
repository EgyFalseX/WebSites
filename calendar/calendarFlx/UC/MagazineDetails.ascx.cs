using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class MagazineDetails : System.Web.UI.UserControl
{
    //const string ConString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=../App_Data/magazine.mdb";
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["View"] == null)
            return;

        string ConString = ConnectionStr("magazine.mdb");
        string ComString = "SELECT [contid], [subject], [subjectdet], [subimage], [addno] FROM [addcont] WHERE [contid] = " + Request.QueryString["View"];
        OleDbDataAdapter da = new OleDbDataAdapter(ComString, ConString);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ImgIssue.ImageUrl = dt.Rows[0]["subimage"].ToString();
            LblDetails.Text = dt.Rows[0]["subjectdet"].ToString();
            ViewState["dt"] = dt;
            return;
        }
        ImgIssue.ImageUrl = "http://www.google.com.eg/images/srpr/logo3w.png";
        LblDetails.Text = "Nothing...";
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }
    protected void RBBack_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["dt"];
        //dt.Rows[0]["addno"]
        //Response.Redirect("SelectMagazine.aspx");
        Response.Redirect("Magazines.aspx?View=" + dt.Rows[0]["addno"]);
    }
}