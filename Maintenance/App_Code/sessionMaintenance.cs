using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TheSessions
/// </summary>
public class sessionMaintenance
{
	public sessionMaintenance()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string MaintenanceUserID
    {
        get
        {
            if (HttpContext.Current.Session["MaintenanceUserID"] != null)
                return HttpContext.Current.Session["MaintenanceUserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["MaintenanceUserID"] = value;
        }
    }
    public static string MaintenanceRealname
    {
        get
        {
            if (HttpContext.Current.Session["Maintenancerealname"] != null)
                return HttpContext.Current.Session["Maintenancerealname"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["Maintenancerealname"] = value;
        }
    }

    public static bool MaintenanceIsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["MaintenanceIsAdmin"] != null)
                return (bool)HttpContext.Current.Session["MaintenanceIsAdmin"];
            else return false;
        }
        set
        {
            HttpContext.Current.Session["MaintenanceIsAdmin"] = value;
        }
    }
    public static bool MaintenanceIsAuth
    {
        get
        {
            if (MaintenanceUserID == null)
                return false;
            else
                return true;
        }
        
    }
    public static string deptId
    {
        get
        {
            if (HttpContext.Current.Session["deptIdMaintenance"] != null)
                return HttpContext.Current.Session["deptIdMaintenance"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["deptIdMaintenance"] = value;
        }
    }
    public static string umail
    {
        get
        {
            if (HttpContext.Current.Session["umailMaintenance"] != null)
                return HttpContext.Current.Session["umailMaintenance"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["umailMaintenance"] = value;
        }
    }
}
