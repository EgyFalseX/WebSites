﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Login : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsDownloadCenter.UserID == null)
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
        DataTable userData = MCDownloadCenter.LoadDataTable(string.Format(@"SELECT id, user, [pass]
        FROM admin WHERE (user = '{0}') AND ([pass] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCDownloadCenter.Connection.ConnectionString);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsDownloadCenter.UserID = userData.Rows[0]["id"].ToString();
        TheSessionsDownloadCenter.IsAdmin = true;
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/DownloadCenter/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}