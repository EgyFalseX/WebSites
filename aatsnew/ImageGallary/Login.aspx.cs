﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionImageGallary.UserID == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        
        dsImageGallary ds = new dsImageGallary();
        dsImageGallaryTableAdapters.UserInfoTableAdapter adpUser = new dsImageGallaryTableAdapters.UserInfoTableAdapter();
        if (adpUser.FillByUserPass(ds.UserInfo, TxtUserName.Text, TxtPassword.Text) <= 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        dsImageGallary.UserInfoRow user = ds.UserInfo[0];
        sessionImageGallary.UserID = user.id.ToString();
        sessionImageGallary.IsAdmin = user.isadmin;
        
        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/ImageGallary/");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }
}