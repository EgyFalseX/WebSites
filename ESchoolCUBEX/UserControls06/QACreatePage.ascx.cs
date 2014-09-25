﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;
using System.IO;

public partial class QACreatePage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void QAMainMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        LoadPage();
    }
    public string LoadPage()
    {
        LblError.Visible = false;
        //Load data from file to RadEditor
        string Path = string.Empty;
        OleDbConnection Con = MySchool.QAConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM QAMenu Where QAID = " + QAMainMenu.SelectedValue.ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();

        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            //HtmlEditorQA.Html = string.Empty;
            return string.Empty;
        }
        Path = MapPath(Path);
        if (!File.Exists(Path))
        {
            return string.Empty;
        }
        else
        {
            TextReader TR = new StreamReader(Path);
            return TR.ReadToEnd().ToString();
        }
    }
    protected void BtnQASave_Click(object sender, EventArgs e)
    {
        if (QAMainMenu.SelectedValue.ToString() == "")
        {
            LblError.Text = "من فضلك قم بأختيار خيار من القائمه";
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        string Path = string.Empty;
        OleDbConnection Con = MySchool.QAConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM QAMenu Where QAID = " + QAMainMenu.SelectedValue.ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();

        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            //Path = MapPath("~/QAData/QAData" + QAMainMenu.SelectedValue.ToString() + ".QA");
            Path = "~/QAData/QAData" + QAMainMenu.SelectedValue.ToString() + ".QA";
        }
        try
        {
            CMD.CommandText = "Update QAMenu Set Data_Path = '" + Path + "' Where QAID = " + QAMainMenu.SelectedValue.ToString();
            Con.Open();
            CMD.ExecuteNonQuery();
            Path = MapPath(Path);
            if (File.Exists(Path))
            {
                File.Delete(Path);
            }
            File.Create(Path).Close();
            TextWriter TW = new StreamWriter(Path);
            TW.Write(Request.Form["editor1"]);
            TW.Flush();
            TW.Close();
            LblError.Text = "تم الحفــــظ";
            LblError.ForeColor = System.Drawing.Color.Green;
            LblError.Visible = true;
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message.ToString();
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        Con.Close();
    }
}