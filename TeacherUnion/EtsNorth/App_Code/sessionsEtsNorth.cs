using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionsEtsNorth
{
	public sessionsEtsNorth()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserID"] != null)
                return HttpContext.Current.Session["UserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserID"] = value;
        }
    }
    public static string ModereaId
    {
        get
        {
            if (HttpContext.Current.Session["ModereaId"] != null)
                return HttpContext.Current.Session["ModereaId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ModereaId"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdmin"] != null)
                return (bool)HttpContext.Current.Session["IsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdmin"] = value;
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
}
