using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sessionz
/// </summary>
public static class Sessionz
{
    public static object UserID
    {
        get
        {
            return HttpContext.Current.Session["SyndID"];
        }
        set
        {
            HttpContext.Current.Session["SyndID"] = value;
        }
    }
    public static object IsAdmin
    {
        get
        {
            if (SqlProvider.IsNullOrEmpty(HttpContext.Current.Session["ISAdmin"]))
                return false;
            else
                return true;
        }
        set
        {
            if (SqlProvider.IsNullOrEmpty(value))
                HttpContext.Current.Session["ISAdmin"] = false;    
            else
                HttpContext.Current.Session["ISAdmin"] = value;
        }
    }
    public static bool IsAuthorized
    {
        get
        {
            if (SqlProvider.IsNullOrEmpty(HttpContext.Current.Session["SyndID"]))
                return false;
            else
                return true;
        }
    }

}