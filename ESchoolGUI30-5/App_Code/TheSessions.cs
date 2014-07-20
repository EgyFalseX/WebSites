using System;
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
    public static StudentSession ss
    {
        get
        {
            if (HttpContext.Current.Session["STSS"] != null)
                return (StudentSession)HttpContext.Current.Session["STSS"];
            else return null;
        }
        set
        {
            HttpContext.Current.Session["STSS"] = value;
        }
    }
    public static string StudentID
    {
        get { if (HttpContext.Current.Session["STID"] != null) return HttpContext.Current.Session["STID"].ToString(); else return null; }
        set {
            HttpContext.Current.Session["STID"] = value;
            if (RoleIDs != null)
            {
                RoleIDs += ",1";
            }
            else
            {
                RoleIDs = "1";
            }
        }
    }
    public static string RoleIDs
    {
        get { if (HttpContext.Current.Session["RoleIDs"] != null) return HttpContext.Current.Session["RoleIDs"].ToString(); else return null; }
        set { HttpContext.Current.Session["RoleIDs"] = value; }
    }
    public static Exception Error {get{return(Exception) HttpContext.Current.Session["err"];}
   set {HttpContext.Current.Session["err"] = value;}}
   public  class StudentSession
    {
       public string StudentID { get { return StudentID; } set { StudentID = value; } }
       public string TheClass { get { return TheClass; } set { TheClass = value; } }

    }
    public static string EmploeeID
    {
        get
        {
            if (HttpContext.Current.Session["EMPID"] != null)
                return HttpContext.Current.Session["EMPID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["EMPID"] = value;

        }
    }
}
