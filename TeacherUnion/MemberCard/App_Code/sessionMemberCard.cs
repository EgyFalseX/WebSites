using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionMemberCard
{
	public sessionMemberCard()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["MemberCardUserID"] != null)
                return HttpContext.Current.Session["MemberCardUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["MemberCardUserID"] = value;
        }
    }
    public static string SyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["MemberCardSyndicateId"] != null)
                return HttpContext.Current.Session["MemberCardSyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["MemberCardSyndicateId"] = value;
        }
    }
    public static string SubCommitteId
    {
        get
        {
            if (HttpContext.Current.Session["MemberCardSubCommitteId"] != null)
                return HttpContext.Current.Session["MemberCardSubCommitteId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["MemberCardSubCommitteId"] = value;
        }
    }

    public static UserSubType usersub
    {
        get
        {
            if (HttpContext.Current.Session["MemberCardusersub"] != null)
                return (UserSubType)HttpContext.Current.Session["MemberCardusersub"];
            else 
                return UserSubType.Nothing;
        }
        set
        {
            HttpContext.Current.Session["MemberCardusersub"] = value;
        }
    }
    public enum UserSubType
    {
        Nothing = 0,
        SubType = 1,
        SubSyn = 2
    }


    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["MemberCardIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["MemberCardIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["MemberCardIsAdmin"] = (bool)value;
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
