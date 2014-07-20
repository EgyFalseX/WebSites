using System;
using System.Collections.Generic;
using System.Web;


    /// <summary>
    /// Summary description for sessionMessages
    /// </summary>
    public class sessionMails
    {
        public sessionMails()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static string UserID
        {
            get
            {
                if (HttpContext.Current.Session["MessagesUserID"] != null)
                    return HttpContext.Current.Session["MessagesUserID"].ToString();
                else return null;
            }
            set
            {
                HttpContext.Current.Session["MessagesUserID"] = value;
            }
        }
        public static string MailAddress
        {
            get
            {
                if (HttpContext.Current.Session["MailAddressMessages"] != null)
                    return HttpContext.Current.Session["MailAddressMessages"].ToString();
                else return null;
            }
            set
            {
                HttpContext.Current.Session["MailAddressMessages"] = value;
            }
        }
        public static bool IsAdmin
        {
            get
            {
                if (HttpContext.Current.Session["MessagesIsAdmin"] != null)
                    return (bool)HttpContext.Current.Session["MessagesIsAdmin"];
                else return false;
            }
            set
            {
                HttpContext.Current.Session["MessagesIsAdmin"] = (bool)value;
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


