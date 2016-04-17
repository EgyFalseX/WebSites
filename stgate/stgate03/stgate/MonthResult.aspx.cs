using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("StLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        switch (HttpContext.Current.Session["UserSaf"].ToString())
        {
            case "3":
            case "4":
            case "5":
                Response.Redirect("medterm13.aspx");
                break;
            case "6":
            case "7":
            case "8":
                Response.Redirect("medterm46.aspx");
                break;
            default:
                break;
        }
    }
}