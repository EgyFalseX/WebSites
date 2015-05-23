using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionImageGallary
{
	public sessionImageGallary()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["ImageGallaryUserID"] != null)
                return HttpContext.Current.Session["ImageGallaryUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ImageGallaryUserID"] = value;
        }
    }
    public static string DatabaseName
    {
        get
        {
            if (HttpContext.Current.Session["ImageGallarydataname"] != null)
                return HttpContext.Current.Session["ImageGallarydataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ImageGallarydataname"] = value;
        }
    }
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["ImageGallaryname"] != null)
                return HttpContext.Current.Session["ImageGallaryname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ImageGallaryname"] = value;
        }
    }

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["ImageGallaryIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["ImageGallaryIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["ImageGallaryIsAdmin"] = value;
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
