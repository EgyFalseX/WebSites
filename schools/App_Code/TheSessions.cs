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
    public static string schoolsUserID
    {
        get
        {
            if (HttpContext.Current.Session["schoolsUserID"] != null)
                return HttpContext.Current.Session["schoolsUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["schoolsUserID"] = value;
        }
    }
    public static string schoolsSyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["schoolsSyndicateId"] != null)
                return HttpContext.Current.Session["schoolsSyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["schoolsSyndicateId"] = value;
        }
    }
    public static bool schoolsIsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["schoolsIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["schoolsIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["schoolsIsAdmin"] = value;
        }
    }
    public static bool schoolsIsAuth
    {
        get
        {
            if (schoolsUserID == null)
                return false;
            else
                return true;
        }
        
    }
    public static string schoolsschoolId
    {
        get
        {
            if (HttpContext.Current.Session["schoolsschoolId"] != null)
                return HttpContext.Current.Session["schoolsschoolId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["schoolsschoolId"] = value;
        }
    }

}
