using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionsDownloadCenter
{
	public TheSessionsDownloadCenter()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDDownloadCenter"] != null)
                return HttpContext.Current.Session["UserIDDownloadCenter"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDDownloadCenter"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminDownloadCenter"] != null)
                return (bool)HttpContext.Current.Session["IsAdminDownloadCenter"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminDownloadCenter"] = value;
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
            if (HttpContext.Current.Session["alsofof_codeDownloadCenter"] != null)
                return HttpContext.Current.Session["alsofof_codeDownloadCenter"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["alsofof_codeDownloadCenter"] = value;
        }
    }

    public static int? EditIdAdaa
    {
        get
        {
            if (HttpContext.Current.Session["EditIdDownloadCenter"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["EditIdDownloadCenter"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EditIdDownloadCenter"] = value;
        }
    }
}
