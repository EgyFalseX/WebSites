using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sessionz
/// </summary>
public static class eventsCodes
{
    public static object UserID
    {
        get
        {
            return HttpContext.Current.Session["eventID"];
        }
        set
        {
            HttpContext.Current.Session["eventID"] = value;
        }
    }
    public static object LagnaId
    {
        get
        {
            return HttpContext.Current.Session["LagnaId"];
        }
        set
        {
            HttpContext.Current.Session["LagnaId"] = value;
        }
    }
    public static object IsAdmin
    {
        get
        {
            if (IsNullOrEmpty(HttpContext.Current.Session["ISAdmin"]))
                return false;
            else
                return (bool)HttpContext.Current.Session["ISAdmin"];
        }
        set
        {
            if (IsNullOrEmpty(value))
                HttpContext.Current.Session["ISAdmin"] = false;    
            else
                HttpContext.Current.Session["ISAdmin"] = value;
        }
    }
    public static bool IsAuthorized
    {
        get
        {
            if (IsNullOrEmpty(HttpContext.Current.Session["eventID"]))
                return false;
            else
                return true;
        }
    }
    public static bool IsNullOrEmpty(object obj)
    {
        if (obj == null)
            return true;

        if (obj.ToString() == string.Empty)
            return true;
        else
            return false;
    }
}