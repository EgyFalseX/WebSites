using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionsynmembers
{
	public sessionsynmembers()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["synmembersUserID"] != null)
                return HttpContext.Current.Session["synmembersUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["synmembersUserID"] = value;
        }
    }
    public static string SyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["synmembersbSyndicateId"] != null)
                return HttpContext.Current.Session["synmembersSyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["synmembersSyndicateId"] = value;
        }
    }
    public static string SubCommitteId
    {
        get
        {
            if (HttpContext.Current.Session["synmembersSubCommitteId"] != null)
                return HttpContext.Current.Session["synmembersSubCommitteId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["synmembersSubCommitteId"] = value;
        }
    }
    public static string DatabaseName
    {
        get
        {
            if (HttpContext.Current.Session["synmembersdataname"] != null)
                return HttpContext.Current.Session["synmembersdataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["synmembersdataname"] = value;
        }
    }
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["synmembersname"] != null)
                return HttpContext.Current.Session["synmembersname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["synmembersname"] = value;
        }
    }

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["synmembersIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["synmembersIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["synmembersIsAdmin"] = value;
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
