using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class centerEditor : System.Web.UI.Page
{
    const string imageFolder = "uc/files/";

    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);

        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }

    protected void CBExporter_ButtonClick(object source, DevExpress.Web.ASPxEditors.ButtonEditClickEventArgs e)
    {
        
       
    }
   
        }
   
           