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
public class MCRegdata
{
    // Paths
    public static string ReportURL = @"http://LOCALHOST:8081/ReportServer";
    public static string ReportPath = @"/StoreReport/";
    public static string FilesPath = "../Assets/Images/";
    public static string advetsFilesPath = "../Assets/advetsImages/";
    public MCRegdata()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static OleDbConnection Connection
    {
        get
        {
            OleDbConnection con = new OleDbConnection(ConnectionString());
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    static string ConnectionString()
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"~/App_Data/adaa.mdb");
        return constr;
    }
    public enum AppOptions
    {
        Options1
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
    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
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
        OleDbConnection Con = Connection;
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
    public static string GetOptionValue1(AppOptions AppOp)
    {
        string ReturnMe = "0";
        OleDbConnection con = Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Select opvalue From CDOptions Where opname = N'{0}'", AppOp);
            con.Open();
            ReturnMe = cmd.ExecuteScalar().ToString();
        }
        catch (SqlException)
        { }
        con.Close();
        return ReturnMe;
    }// Get Option Value From Database
    public static bool GetPagePriv(string PageName, string UserID)
    {
        bool ReturnMe = false;
        OleDbConnection con = Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"SELECT COUNT(*) AS Found FROM MenuItemName WHERE (PageName = '{0}') AND 
                EXISTS (SELECT TOP (1) MenuItemNameID FROM RoleDetial WHERE (MenuItemNameID = MenuItemName.MenuItemNameID) AND 
                (RoleID IN (SELECT RoleId FROM UserRoles WHERE (UserId = {1}))))", PageName, UserID);
            string Read = cmd.ExecuteScalar().ToString();
            if (Read != "0")
                ReturnMe = true;
        }
        catch (OleDbException ex)
        {
            string x = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }// Get Privilage For A Page

    public static string GetData(string Id)
    {
        if (Id == string.Empty)
        {
            return string.Empty;
        }
        string ReturnMe = string.Empty;
        OleDbConnection Con = Connection;
        OleDbCommand Cmd = new OleDbCommand("", Con);
        Cmd.CommandText = string.Format(@"SELECT datapath FROM alldata WHERE dataid = " + Id);
        try
        {
            Con.Open();
            object obj = Cmd.ExecuteScalar();
            if (obj != null)
                ReturnMe = obj.ToString();
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