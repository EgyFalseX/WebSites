﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            Response.Redirect("TblformlessonEditor.aspx");
        
        HttpContext.Current.Session["XRep01lessonid"] = Convert.ToInt32(Request.QueryString["id"]);
    }
}