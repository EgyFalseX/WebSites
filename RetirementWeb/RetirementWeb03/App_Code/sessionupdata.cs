using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionupdata
{
    public sessionupdata()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["updataUserID"] != null)
                return HttpContext.Current.Session["updataUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["updataUserID"] = value;
        }
    }
    public static string SyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["updataSyndicateId"] != null)
                return HttpContext.Current.Session["updataSyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["updataSyndicateId"] = value;
        }
    }
    public static string SubCommitteId
    {
        get
        {
            if (HttpContext.Current.Session["updataSubCommitteId"] != null)
                return HttpContext.Current.Session["updataSubCommitteId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["updataSubCommitteId"] = value;
        }
    }
    public static string DatabaseName
    {
        get
        {
            if (HttpContext.Current.Session["updatadataname"] != null)
                return HttpContext.Current.Session["updatadataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["updatadataname"] = value;
        }
    }
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["updataname"] != null)
                return HttpContext.Current.Session["updataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["updataname"] = value;
        }
    }

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["updataIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["updataIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["updataIsAdmin"] = value;
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
