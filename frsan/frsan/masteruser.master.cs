﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class masteruser : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frsan/ProjectViewer.aspx");
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        TheSessionsfrsan.UserID = null;
        Response.Redirect("~/frsan/AdminLogin.aspx");
    }
}