using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionETSTQuery
{
	public sessionETSTQuery()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static int? UserID
    {
        get
        {
            if (HttpContext.Current.Session["ETSTQueryUserID"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["ETSTQueryUserID"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ETSTQueryUserID"] = value;
        }
    }
    public static int? LagnaId
    {
        get
        {
            if (HttpContext.Current.Session["ETSTQueryLagnaId"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["ETSTQueryLagnaId"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["ETSTQueryLagnaId"] = value;
        }
    }

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["ETSTQueryIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["ETSTQueryIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["ETSTQueryIsAdmin"] = (bool)value;
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
