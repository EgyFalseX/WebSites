using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionNewsBar
{
	public sessionNewsBar()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["NewsBarUserID"] != null)
                return HttpContext.Current.Session["NewsBarUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["NewsBarUserID"] = value;
        }
    }
  

    public static bool IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["NewsBarIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["NewsBarIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["NewsBarIsAdmin"] = (bool)value;
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
