﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_CatInsert : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DB b = new DB();
        b.InsertCat(txt_CatName.Text);
        txt_CatName.Text = string.Empty;
    }
}