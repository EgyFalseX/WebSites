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
    public static string schoolid
    {
        get
        {
            if (HttpContext.Current.Session["schoolidTEFollowUp"] != null)
                return HttpContext.Current.Session["schoolidTEFollowUp"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["schoolidTEFollowUp"] = value;
        }
    }
    public static string schoolname
    {
        get
        {
            if (HttpContext.Current.Session["schoolnameTEFollowUp"] != null)
                return HttpContext.Current.Session["schoolnameTEFollowUp"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["schoolnameTEFollowUp"] = value;
        }
    }
    
    public static bool moder
    {
        get
        {
            if (HttpContext.Current.Session["moderTEFollowUp"] != null)
                return (bool)HttpContext.Current.Session["moderTEFollowUp"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["moderTEFollowUp"] = value;
        }
    }
    public static bool moshref
    {
        get
        {
            if (HttpContext.Current.Session["moshrefTEFollowUp"] != null)
                return (bool)HttpContext.Current.Session["moshrefTEFollowUp"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["moshrefTEFollowUp"] = value;
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
    public static bool guest
    {
        get
        {
            if (HttpContext.Current.Session["guestTEFollowUp"] != null)
                return Convert.ToBoolean(HttpContext.Current.Session["guestTEFollowUp"]);
            else return false;
        }
        set
        {
            HttpContext.Current.Session["guestTEFollowUp"] = value;
        }
    }
    
}
