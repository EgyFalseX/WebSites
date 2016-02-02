using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionzamalaalldata
{
	public sessionzamalaalldata()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["zamalaalldataUserID"] != null)
                return HttpContext.Current.Session["zamalaalldataUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["zamalaalldataUserID"] = value;
        }
    }
    public static string Gov
    {
        get
        {
            if (HttpContext.Current.Session["zamalaalldataGov"] != null)
                return HttpContext.Current.Session["zamalaalldataGov"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["zamalaalldataGov"] = value;
        }
    }
    
    public static string DatabaseName
    {
        get
        {
            if (HttpContext.Current.Session["zamalaalldatadataname"] != null)
                return HttpContext.Current.Session["zamalaalldatadataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["zamalaalldatadataname"] = value;
        }
    }
    
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["zamalaalldataIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["zamalaalldataIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["zamalaalldataIsAdmin"] = value;
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
