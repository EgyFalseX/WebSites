using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsTEFollowUp
{
    public TheSessionsTEFollowUp()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDTEFollowUp"] != null)
                return HttpContext.Current.Session["UserIDTEFollowUp"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDTEFollowUp"] = value;
        }
    }
    public static string UserRealName
    {
        get
        {
            if (HttpContext.Current.Session["RealNameTEFollowUp"] != null)
                return HttpContext.Current.Session["RealNameTEFollowUp"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RealNameTEFollowUp"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminTEFollowUp"] != null)
                return (bool)HttpContext.Current.Session["IsAdminTEFollowUp"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminTEFollowUp"] = value;
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

    public static string empid
    {
        get
        {
            if (HttpContext.Current.Session["empidTEFollowUp"] != null)
                return HttpContext.Current.Session["empidTEFollowUp"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["empidTEFollowUp"] = value;
        }
    }
    public static bool read_writ
    {
        get
        {
            if (HttpContext.Current.Session["read_writTEFollowUp"] != null)
                return Convert.ToBoolean(HttpContext.Current.Session["read_writTEFollowUp"]);
            else return false;
        }
        set
        {
            HttpContext.Current.Session["read_writTEFollowUp"] = value;
        }
    }
    
}
