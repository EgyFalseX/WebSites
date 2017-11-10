using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsfrsan
{
    public TheSessionsfrsan()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDfrsan"] != null)
                return HttpContext.Current.Session["UserIDfrsan"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDfrsan"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminfrsan"] != null)
                return (bool)HttpContext.Current.Session["IsAdminfrsan"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminfrsan"] = value;
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
    public static string alsofof_code
    {
        get
        {
            if (HttpContext.Current.Session["alsofof_codefrsan"] != null)
                return HttpContext.Current.Session["alsofof_codefrsan"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["alsofof_codefrsan"] = value;
        }
    }

    public static int? EditIdAdaa
    {
        get
        {
            if (HttpContext.Current.Session["EditIdfrsan"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["EditIdfrsan"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EditIdfrsan"] = value;
        }
    }
}
