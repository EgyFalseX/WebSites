using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsAdaa
{
	public TheSessionsAdaa()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDAdaa"] != null)
                return HttpContext.Current.Session["UserIDAdaa"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDAdaa"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminAdaa"] != null)
                return (bool)HttpContext.Current.Session["IsAdminAdaa"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminAdaa"] = value;
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
            if (HttpContext.Current.Session["EditIdAdaa"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["EditIdAdaa"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EditIdAdaa"] = value;
        }
    }
}
