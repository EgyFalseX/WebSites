﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class EditcoursenotimeDetails : System.Web.UI.UserControl
{
    #region -    Functions    -

    public string LoadPage()
    {
        if (Request.QueryString["CourseId"] == null || Request.QueryString["Courseitem"] == null)
            return string.Empty;
        string Path = DB.SelectCourseNoTimeDataPath(Request.QueryString["CourseId"], Request.QueryString["Courseitem"]);

        if (Path == string.Empty)
            return string.Empty;
       
        //Path = MapPath(Path);
        if (!File.Exists(Path))
            return string.Empty;
        else
        {
            TextReader TR = new StreamReader(Path);
            string tt = TR.ReadToEnd().ToString();
            TR.Close();
            TR.Dispose();
            return tt;
        }
    }
    public string GetSelectedCourseID()
    {
        string ReturnMe = string.Empty;
        if (Request.QueryString["CourseId"] != null)
            ReturnMe = "CourseId=" + Request.QueryString["CourseId"];
        else
            Response.Redirect("../Editcoursenotime.aspx");
        return ReturnMe;
    }
    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Courseitem"] != null)
        {
            RadPanelBarCourseItem.Items[Convert.ToInt16((Request.QueryString["Courseitem"]))].Selected = true;//make clicked item is selected
            BtnSave.Visible = true;//Show Save Button
        }
        else
            BtnSave.Visible = false;//Hide Save Button which no item selected from RadPanelBarCourseItem

        if (!IsPostBack)
        {
            for (int i = 1; i < RadPanelBarCourseItem.Items.Count; i++)
            {
                RadPanelBarCourseItem.Items[i].NavigateUrl += GetSelectedCourseID();
            }
            txt1.Html = LoadPage();
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CourseId"] == null || Request.QueryString["Courseitem"] == null)
            return;

        string CourseId = Request.QueryString["CourseId"];
        string Courseitem = Request.QueryString["Courseitem"];

        string Path = DB.SelectCourseNoTimeDataPath(CourseId, Courseitem);

        if (Path == string.Empty)
            Path = String.Format("{0}{1}-{2}.cdf", DB.CourseNoTimeFileDir, CourseId, Courseitem);

        string ResultMSG = DB.UpdateCourseNoTimeDataPath(CourseId, Courseitem, String.Format("{0}-{1}.cdf", CourseId, Courseitem));
        if (ResultMSG != string.Empty)
        {
            LblError.Text = ResultMSG;
            LblError.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (File.Exists(Path))
            File.Delete(Path);
        File.Create(Path).Close();
        using (TextWriter TW = new StreamWriter(Path, false))
        {
            TW.Write(txt1.Html);
            TW.Flush();
            TW.Close();
        }
        LblError.Text = "تم الحفــــظ";
        LblError.ForeColor = System.Drawing.Color.Green;
        LblError.Visible = true;

    }
    protected void MainMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        txt1.Html = LoadPage();
        LblError.Text = "";
    }
    #endregion
    
}