using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessions
{
	public TheSessions()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string StudentID
    {
        get { if (HttpContext.Current.Session["StudentID"] != null) return HttpContext.Current.Session["StudentID"].ToString(); else return null; }
        set { HttpContext.Current.Session["StudentID"] = value; }
    }
    public static string StudentName
    {
        get { if (HttpContext.Current.Session["StudentName"] != null) return HttpContext.Current.Session["StudentName"].ToString(); else return null; }
        set { HttpContext.Current.Session["StudentName"] = value; }
    }
    public static string EmploeeID
    {
        get { if (HttpContext.Current.Session["EmploeeID"] != null) return HttpContext.Current.Session["EmploeeID"].ToString(); else return null; }
        set { HttpContext.Current.Session["EmploeeID"] = value; }
    }
    public static string EmploeeName
    {
        get { if (HttpContext.Current.Session["EmploeeName"] != null) return HttpContext.Current.Session["EmploeeName"].ToString(); else return null; }
        set { HttpContext.Current.Session["EmploeeName"] = value; }
    }
    public static bool IsAdmin
    {
        get { if (HttpContext.Current.Session["IsAdmin"] != null) return (bool)HttpContext.Current.Session["IsAdmin"]; else return false; }
        set { HttpContext.Current.Session["IsAdmin"] = value; }
    }
}