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
    public static string TelerikSkin
    {
        get
        {
            if (HttpContext.Current.Session["TelerikSkin"] != null)
                return HttpContext.Current.Session["TelerikSkin"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["TelerikSkin"] = value;

        }
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
    public static string ReportName
    {
        get
        {
            if (HttpContext.Current.Session["ReportName"] != null)
                return HttpContext.Current.Session["ReportName"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ReportName"] = value;

        }
    }

}
