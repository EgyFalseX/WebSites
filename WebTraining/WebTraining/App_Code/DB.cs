using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Collections;
using System.Data.OleDb;

/// <summary>
/// Summary description for DB
/// </summary>
/// 

public class DB
{
    public static string DBConStrABOUT = ConnectionStr("ABOUT.mdb");

    public DB()
    {

    }
    public static OleDbConnection ABOUTConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(DBConStrABOUT);
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }
    static string ConnectionStr(string DataBaseName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\App_Data\" + DataBaseName);

        return constr;
    }
    public static DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, ABOUTConnection);
        try
        {da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    public static string Insertcontact(string coname, string sefaid, string contypeid, string tel, string mail, string massage)
    {
        OleDbConnection con = ABOUTConnection;
        OleDbCommand cmd = new OleDbCommand("", con);
        if (sefaid == string.Empty)
            sefaid = "NULL";
        if (contypeid == string.Empty)
            contypeid = "NULL";
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO contact (coname, sefaid, contypeid, tel, mail, massage, condate)
            VALUES ('{0}', {1}, {2}, '{3}', '{4}', '{5}', NOW())", coname, sefaid, contypeid, tel, mail, massage);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            return ex.Message;
        }
        con.Close();
        return string.Empty;
    }
}
