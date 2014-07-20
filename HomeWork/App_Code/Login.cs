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
    public bool DoLogin(string username, string password)
    {
        OleDbCommand com = new OleDbCommand("select pass from student where user_name = @stid", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stid", username);
        com.Connection.Open();
        string w = null;
        if (com.ExecuteScalar() != null)
        {
            w = com.ExecuteScalar().ToString();
        }
        com.Connection.Close();
        if (w != null)
        {
            if (password == w)
                return true;
            else return false;
        }
        else
        {
            return false;
        }
    }
    private string username;
    public static string CurrentYear
    {
        get
        {
            OleDbCommand com = new OleDbCommand("select max(asase_code)   from asase where SPOS = @SPOS", MySchool.CodesConnection);
            com.Parameters.AddWithValue("@SPOS", CurrentSchool);
            com.Connection.Open();
            if (com.ExecuteScalar() != null)
            {
                string w  = com.ExecuteScalar().ToString();
                com.Connection.Close();
                return w;
            }
            else
            {
                com.Connection.Close();
                return null;
            }
        }
    }
    public static string CurrentSchool { get { return "15101129783"; } }

    public string UserName
    {
        get
        {
            OleDbCommand com = new OleDbCommand("select stu_name from student where stu_code = @stid", MySchool.StudentConnection);
            if (TheSessions.StudentID != null)
            {
                com.Parameters.AddWithValue("@stid", TheSessions.StudentID);
                com.Connection.Open();
                if (com.ExecuteScalar() != null)
                {
                    username = com.ExecuteScalar().ToString();
                    com.Connection.Close();
                    return username;
                }
                else
                { com.Connection.Close(); return null; }
            }
            else
                return null;
        }
    }
    public int StudentClass { get {
        OleDbCommand com = new OleDbCommand("select fasl_code  from student_t where stu_code = @stu_code and asase_code = @asase_code", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_code", TheSessions.StudentID);
        com.Parameters.AddWithValue("@asase_code", CurrentYear);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            int x = Convert.ToInt32(com.ExecuteScalar());
            com.Connection.Close();
            return x;
        }
        else
        {
            return -1;
        }
    } }
    public int StudentStage
    {
        get
        {
            OleDbCommand com = new OleDbCommand("select alsofof_code  from student_t where stu_code = @stu_code and asase_code = @asase_code", MySchool.StudentConnection);
            com.Parameters.AddWithValue("@stu_code", TheSessions.StudentID);
            com.Parameters.AddWithValue("@asase_code", CurrentYear);
            com.Connection.Open();

            if (com.ExecuteScalar() != null)
            {
                int x = Convert.ToInt32(com.ExecuteScalar());
                com.Connection.Close();
                return x;
            }
            else
            {
                return -1;
            }
        }
    }

    public bool EmpLogin(string username, string password)
    {
        using (OleDbCommand com = new OleDbCommand("select password from بيانات_الموظفين_بالمدرية where user_name = @Empcode", MySchool.MalafatConnection))
        {
            com.Parameters.AddWithValue("@Empcode", username);
            com.Connection.Open();
            string w = null;
            if (com.ExecuteScalar() != null)
            {
                w = com.ExecuteScalar().ToString();
            }
            com.Connection.Close();
            if (w != null)
            {
                if (password == w)
                    return true;
                else return false;
            }
            else
            {
                return false;
            }
        }
    }

    public bool Autinticated { get { if (TheSessions.StudentID != null) return true; else return false; } }
}
