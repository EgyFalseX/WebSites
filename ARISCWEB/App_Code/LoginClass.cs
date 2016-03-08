using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for ProductsClass
/// </summary>
public class LoginClass
{
    private OleDbConnection conn;
    public LoginClass(string dbName)
    {

        cmd = new OleDbCommand(new DBConnectClass(dbName).ToString());
        conn = DBConnectClass.conn;
        cmd.Connection = conn;
    }
    private OleDbCommand cmd;
    private OleDbDataReader reader;
    private int _RoleID, _EmployeeID;
    private string _UserName = "", _Password = "",  _Msg="", _Mode = "";

    private DateTime _LastLoggedOn = DateTime.Now, _LastLoggedOff = DateTime.Now;
    private bool _IsActive, _IsArabic = false;
    public int pathID;
    private string pathName;
    private bool _IsAdmin;
    //

    public bool IsAdmin
    {
        get { return _IsAdmin; }
        set { _IsAdmin = value; }
    }
    public int RoleID
    {
        get { return _RoleID; }
        set { _RoleID = value; }
    }
    public int EmployeeID
    {
        get { return _EmployeeID; }
        set { _EmployeeID = value; }
    }

    public string UserName
    {
        get { return _UserName; /*return pubUserName; */}
        set { _UserName = value; /*pubUserName = value;*/ }
    }
    public string Password
    {
        get { return _Password; /*return pubPassword; */}
        set { _Password = value; /*pubPassword=value;*/}
    }

    
    



    public DateTime LastLoggedOn
    {
        get { return _LastLoggedOn; }
        set { _LastLoggedOn = value; }
    }
    public DateTime LastLoggedOff
    {
        get { return _LastLoggedOff; }
        set { _LastLoggedOff = value; }
    }
    public bool IsActive
    {
        get { return _IsActive; }
        set { _IsActive = value; }
    }
    public bool IsArabic
    {
        get { return _IsArabic; }
        set { _IsArabic = value; }
    }

    public string Msg
    {
        get { return _Msg; }
        set { _Msg = value; }
    }
    public string Mode
    {
        get { return _Mode; }
        set { _Mode = value; }
    }

    public string LoginMethod(string tableName, string userField, string passField, string isAdmin)
    {
        if (IsAdmin == true)
            cmd.CommandText = "select * from " + tableName + " where " + userField + "=@UserName and " + passField + "=@Password and " + isAdmin +"=true";
        else
            cmd.CommandText = "select * from " + tableName + " where " + userField + "=@UserName and " + passField + "=@Password"; cmd.CommandType = CommandType.Text;
        if (cmd.Parameters.Count > 0)
            cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@UserName", UserName);
        cmd.Parameters.AddWithValue("@Password", Password);


        if (conn.State == ConnectionState.Closed)
            conn.Open();
        reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                try
                {
                    UserName = reader[0].ToString();
                   
                }
                catch(Exception ex)
                {
                    if(ex.Message=="Index was outside the bounds of the array.")
                        Msg = reader[0].ToString();
                }
            }
       
        else
            Msg ="إسم المستخدم أو كلمة المرور غير صحيحة";

        conn.Close();
        return Msg;
    }
    public string LoginMethod(string tableName, string userField, string passField)
    {
        cmd.CommandText = "select * from " + tableName + " where " + userField + "=@UserName and " + passField + "=@Password";
        cmd.CommandType = CommandType.Text;
        if (cmd.Parameters.Count > 0)
            cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@UserName", UserName);
        cmd.Parameters.AddWithValue("@Password", Password);


        if (conn.State == ConnectionState.Closed)
            conn.Open();
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            try
            {
                UserName = reader[0].ToString();

            }
            catch (Exception ex)
            {
                if (ex.Message == "Index was outside the bounds of the array.")
                    Msg = reader[0].ToString();
            }
        }

        else
            Msg = "إسم المستخدم أو كلمة المرور غير صحيحة";

        conn.Close();
        return Msg;
    }
    public string GetPathName()
    {
        cmd.CommandText = "select PathName from ConstantPathes where PathID=@PathID ";
        cmd.CommandType = CommandType.Text;
        if (cmd.Parameters.Count > 0)
            cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@PathID", pathID);


        if (conn.State == ConnectionState.Closed)
            conn.Open();

        reader = cmd.ExecuteReader();
        if (reader.Read())
        { pathName = reader[0].ToString(); }
        return pathName;
    }
}