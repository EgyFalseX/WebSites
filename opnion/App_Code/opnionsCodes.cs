using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sessionz
/// </summary>
public static class opnionsCodes
{
    public static object UserID
    {
        get
        {
            return HttpContext.Current.Session["opnionID"];
        }
        set
        {
            HttpContext.Current.Session["opnionID"] = value;
        }
    }
    public static bool IsAuthorized
    {
        get
        {
            if (IsNullOrEmpty(HttpContext.Current.Session["opnionID"]))
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