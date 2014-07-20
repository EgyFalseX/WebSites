using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;
using System.Data;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
	public Login()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool DoLogin(string username, string password, bool IsAdmin)
    {
        OleDbCommand com = new OleDbCommand("", MySchool.SLConnection);
        bool ReturnMe = false;
        if (IsAdmin)
            com.CommandText = "select UID, UPass from LoginInfo where UName = '" + username + "' and UPass = '" + password + "'";
        else
            com.CommandText = "select UID, pass from UserInfo where UserName = '" + username + "' and Pass ='" + password + "'";

        com.Connection.Open();

        if (com.ExecuteScalar() != null)
        {
            if (IsAdmin)
            {
                TheSessions.EmploeeID = com.ExecuteScalar().ToString();
                TheSessions.EmploeeName = username;
                TheSessions.IsAdmin = true;
            }
            else
            {
                TheSessions.StudentID = com.ExecuteScalar().ToString();
                TheSessions.StudentName = username;
                TheSessions.IsAdmin = false;
            }
            ReturnMe = true;
        }
        else
            ReturnMe = false;

        com.Connection.Close();
        return ReturnMe;
    }
    public bool Autinticated { get { if (TheSessions.StudentID != null) return true; else return false; } }
}
