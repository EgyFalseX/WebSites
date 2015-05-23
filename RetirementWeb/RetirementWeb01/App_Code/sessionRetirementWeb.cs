using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionRetirementWeb
{
	public sessionRetirementWeb()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebUserID"] != null)
                return HttpContext.Current.Session["RetirementWebUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebUserID"] = value;
        }
    }
    public static string SyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebSyndicateId"] != null)
                return HttpContext.Current.Session["RetirementWebSyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebSyndicateId"] = value;
        }
    }
    public static string SubCommitteId
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebSubCommitteId"] != null)
                return HttpContext.Current.Session["RetirementWebSubCommitteId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebSubCommitteId"] = value;
        }
    }
    public static string DatabaseName
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebdataname"] != null)
                return HttpContext.Current.Session["RetirementWebdataname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebdataname"] = value;
        }
    }
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebname"] != null)
                return HttpContext.Current.Session["RetirementWebname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebname"] = value;
        }
    }

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["RetirementWebIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["RetirementWebIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["RetirementWebIsAdmin"] = value;
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
