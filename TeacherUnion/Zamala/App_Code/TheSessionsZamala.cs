using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsZamala
{
	public TheSessionsZamala()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDZamala"] != null)
                return HttpContext.Current.Session["UserIDZamala"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDZamala"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminZamala"] != null)
                return (bool)HttpContext.Current.Session["IsAdminZamala"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminZamala"] = value;
        }
    }
    public static string dbName
    {
        get
        {
            if (HttpContext.Current.Session["dbNameZamala"] != null)
                return HttpContext.Current.Session["dbNameZamala"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["dbNameZamala"] = value;
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

    public static int? EditIdAdaa
    {
        get
        {
            if (HttpContext.Current.Session["EditIdZamala"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["EditIdZamala"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EditIdZamala"] = value;
        }
    }
}
