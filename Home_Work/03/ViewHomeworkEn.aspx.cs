﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewHomeworkEn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("../StLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        
    }
}