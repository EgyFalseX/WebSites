using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

/// <summary>
/// Summary description for MC
/// </summary>
public class MCZamala
{
    // Paths
    public static string ReportURL = @"http://LOCALHOST:8081/ReportServer";
    public static string ReportPath = @"/StoreReport/";
    public static string FilesPath = "../Assets/Images/";
    public static string advetsFilesPath = "../Assets/advetsImages/";
    public MCZamala()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   
    public static OleDbConnection ConnectionLogin
    {
        get
        {
            string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
            constr += LoginDatabasePath;
            
            OleDbConnection con = new OleDbConnection(constr);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    public static string LoginDatabasePath
    {
        get
        {
            HttpServerUtility sv = HttpContext.Current.Server;
            return sv.MapPath(@"~/App_Data/datalogin.mdb");
        }
    }
    public static string ConnectionString(string dbName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(string.Format(@"~/App_Data/{0}", dbName));
        return constr;
    }
    
    public static void InsertEmptyValue(ref OleDbCommand cmd)
    {
        foreach (OleDbParameter item in cmd.Parameters)
        {
            if (IsNullOrEmpty(item.Value))
            {
                if (item.OleDbType == OleDbType.Boolean)
                    item.Value = "False";
                else
                    item.Value = DBNull.Value;
            }
        }
    }
    public static bool IsNullOrEmpty(object obj)
    {
        if (obj == null)
            return true;

        if (obj.ToString() == string.Empty)
            return true;
        else
            return false;
    }

    public static string ConvertToDateYMD(string PDate)
    {
        if (PDate == string.Empty)
            return "";
        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        ReturnMe = String.Format("{0}-{1}-{2}", MyDate.Year, MyDate.Month, MyDate.Day);
        return ReturnMe;
    }//Date Convertor
    public static string ConvertToDateYMDhms(string PDate)
    {
        //yyyy-mm-dd hh-mm-ss  for Convert(20). CONVERT(DATETIME, GetDate(), 20)
        if (PDate == string.Empty)
            return "";
        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        ReturnMe = String.Format("{0}-{1}-{2} {3}:{4}:{5}", MyDate.Year, MyDate.Month, MyDate.Day, MyDate.Hour, MyDate.Minute, MyDate.Second);
        return ReturnMe;
    }//Date Convertor
    public static Single ConvertStringToInt(string str)
    {
        string ReturnMe = string.Empty;
        int count = 0;
        foreach (char c in str.ToCharArray())
        {
            if (c == Convert.ToChar(".") && count < 1)
            {
                ReturnMe += c.ToString();
                count++;
            }
            if (char.IsNumber(c))
            {
                ReturnMe += c.ToString();
            }
        }
        if (ReturnMe == string.Empty)
        {
            ReturnMe = "0";
        }
        return Convert.ToSingle(ReturnMe);
    }
    public static bool IsDecimal(string theValue)
    {
        try
        {
            Convert.ToDouble(theValue);
            return true;
        }
        catch
        {
            return false;
        }
    } //IsDecimal
    public static bool IsInteger(string theValue)
    {
        try
        {
            Convert.ToInt32(theValue);
            return true;
        }
        catch
        {
            return false;
        }
    } //IsInteger
    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow, string constring)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, constring))
        {
            try
            {
                DA.Fill(ReturnMe);
                DataRow row = ReturnMe.NewRow();
                //row[0] = "0";
                //row[1] = "اختار";
                if (EnableAddEmptyRow)
                    ReturnMe.Rows.InsertAt(row, 0);
            }
            catch (SqlException) { }
        }

        return ReturnMe;
    }//Load Table From Database
    public static string GetNewID(string TableName, string ColumnName)
    {
        string ReturnMe = string.Empty;
        OleDbConnection Con = new OleDbConnection(ConnectionString(TheSessionsZamala.dbName));
        OleDbCommand Cmd = new OleDbCommand("", Con);
        Cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", ColumnName, TableName.ToString());
        OleDbDataReader dr;
        try
        {
            Con.Open();
            dr = Cmd.ExecuteReader();
            if (dr.HasRows)
                dr.Read();
            ReturnMe = dr.GetValue(0).ToString();
        }
        catch (OleDbException ex)
        {
            // nothing here
            string x = ex.Message;
        }
        Con.Close();
        return ReturnMe;
    }//Get Unique New ID

}