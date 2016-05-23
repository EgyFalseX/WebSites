using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;

public partial class ViewDetails : System.Web.UI.UserControl
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/FlexibleData.mdb");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadContain()
    {
        if (Request.QueryString["id"] == null)
        {
            return string.Empty;
        }
        

        string ThePath = string.Empty;
        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbCommand cmd = new OleDbCommand(String.Format("SELECT Data_Pathe FROM MenuItem WHERE (ItemID = {0})", Request.QueryString["id"]), Con);
            try
            {
                Con.Open();
                ThePath = cmd.ExecuteScalar().ToString();
                if (ThePath != string.Empty)
                    ThePath = MapPath(ThePath);
                if (File.Exists(ThePath))
                {
                    TextReader TR = new StreamReader(ThePath);
                    RetData = TR.ReadToEnd();
                    TR.Close();
                    TR.Dispose();
                }

            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }

        return HttpUtility.HtmlDecode(RetData);

    }
}