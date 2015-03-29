using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class TheSessionscontact
{
	public TheSessionscontact()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserIDcontact"] != null)
                return HttpContext.Current.Session["UserIDcontact"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDcontact"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdmincontact"] != null)
                return (bool)HttpContext.Current.Session["IsAdmincontact"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdmincontact"] = value;
        }
    }
    public static string SynsyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["syndicateIdcontact"] != null)
                return HttpContext.Current.Session["syndicateIdcontact"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["syndicateIdcontact"] = value;
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
