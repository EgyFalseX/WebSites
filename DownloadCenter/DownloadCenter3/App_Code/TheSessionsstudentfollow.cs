using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsstudentfollow
{
    public TheSessionsstudentfollow()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDstudentfollow"] != null)
                return HttpContext.Current.Session["UserIDstudentfollow"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDstudentfollow"] = value;
        }
    }
    public static string UserRealName
    {
        get
        {
            if (HttpContext.Current.Session["RealNamestudentfollow"] != null)
                return HttpContext.Current.Session["RealNamestudentfollow"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RealNamestudentfollow"] = value;
        }
    }
    public static string Userjob
    {
        get
        {
            if (HttpContext.Current.Session["jobstudentfollow"] != null)
                return HttpContext.Current.Session["jobstudentfollow"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["jobstudentfollow"] = value;
        }
    }
    public static string UserStudentID
    {
        get
        {
            if (HttpContext.Current.Session["UserStudentIDstudentfollow"] != null)
                return HttpContext.Current.Session["UserStudentIDstudentfollow"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserStudentIDstudentfollow"] = value;
        }
    }
    public static string asase_code
    {
        get
        {
            if (HttpContext.Current.Session["asase_code"] != null)
                return HttpContext.Current.Session["asase_code"].ToString();
            else
            {
                OleDbConnection con = new OleDbConnection(MCstudentfollow.ConnectionStringasase());
                OleDbCommand cmd = new OleDbCommand(@"SELECT [asase_code] FROM [asase] WHERE [asase_code]  = (SELECT MAX([asase_code]) FROM [asase])", con);
                con.Open();
                string asase_code = cmd.ExecuteScalar().ToString();
                con.Close();
                return asase_code;
            };
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminstudentfollow"] != null)
                return (bool)HttpContext.Current.Session["IsAdminstudentfollow"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminstudentfollow"] = value;
        }
    }
    public static bool IsAuth
    {
        get
        {
            if (UserID == null)
                return false;
            else
                return true;
        }
        
    }
    public static bool IsStudentAuth
    {
        get
        {
            if (UserStudentID == null)
                return false;
            else
                return true;
        }

    }
    public static string alsofof_code
    {
        get
        {
            if (HttpContext.Current.Session["alsofof_codestudentfollow"] != null)
                return HttpContext.Current.Session["alsofof_codestudentfollow"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["alsofof_codestudentfollow"] = value;
        }
    }

    public static int? EditIdAdaa
    {
        get
        {
            if (HttpContext.Current.Session["EditIdstudentfollow"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["EditIdstudentfollow"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EditIdstudentfollow"] = value;
        }
    }
}
