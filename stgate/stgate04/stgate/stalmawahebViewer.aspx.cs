﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class stalmawahebViewer : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("StLogin.aspx");
    }

    
}