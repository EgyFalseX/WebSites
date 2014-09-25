﻿using System;
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
    public static string SyndicateId
    {
        get
        {
            if (HttpContext.Current.Session["SyndicateId"] != null)
                return HttpContext.Current.Session["SyndicateId"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["SyndicateId"] = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["IsAdmin"] != null)
                return (bool)HttpContext.Current.Session["IsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdmin"] = value;
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

    public static string UserIDadvets
    {
        get
        {
            if (HttpContext.Current.Session["UserIDadvets"] != null)
                return HttpContext.Current.Session["UserIDadvets"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserIDadvets"] = value;
        }
    }
    public static string SyndicateIdadvets
    {
        get
        {
            if (HttpContext.Current.Session["SyndicateIdadvets"] != null)
                return HttpContext.Current.Session["SyndicateIdadvets"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["SyndicateIdadvets"] = value;
        }
    }
    public static bool IsAdminadvets
    {
        get
        {
            if (HttpContext.Current.Session["IsAdminadvets"] != null)
                return (bool)HttpContext.Current.Session["IsAdminadvets"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["IsAdminadvets"] = value;
        }
    }
    public static bool IsAuthadvets
    {
        get
        {
            if (UserIDadvets == null)
                return false;
            else
                return true;
        }

    }
    
    public static int? tbladvEditId
    {
        get
        {
            if (HttpContext.Current.Session["tbladvEditId"] != null)
                return Convert.ToInt32(HttpContext.Current.Session["tbladvEditId"]);
            else return null;
        }
        set
        {
            HttpContext.Current.Session["tbladvEditId"] = value;
        }
    }
}