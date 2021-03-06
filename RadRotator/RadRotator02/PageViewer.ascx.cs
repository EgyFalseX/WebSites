﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;

public partial class PageViewer : System.Web.UI.UserControl
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("App_Data/DataDB.mdb");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadContain()
    {
        bool Path2nd = false;
        if (Request.QueryString["id"] == null)
        {
            return string.Empty;
        }
        if (Request.QueryString["Path2nd"] == null)
            Path2nd = false;
        else
            Path2nd = true;// Show 2nd Path
        string Path = string.Empty;
        string Path2 = string.Empty;
        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbDataAdapter da = new OleDbDataAdapter(String.Format("SELECT [Link] FROM RotatorData WHERE ([ID] = {0})", Request.QueryString["id"]), constr);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Path = dt.Rows[0]["Link"].ToString();
                }
                if (Path2nd)
                {
                    if (File.Exists(Path2))
                    {
                        TextReader TR = new StreamReader(Path2);
                        RetData = TR.ReadToEnd();
                        TR.Close();
                        TR.Dispose();
                    }
                }
                else
                {
                    if (Path != string.Empty)
                        Path = MapPath(Path);
                    if (File.Exists(Path))
                    {
                        TextReader TR = new StreamReader(Path);
                        RetData = TR.ReadToEnd();
                        TR.Close();
                        TR.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }
        return HttpUtility.HtmlDecode(RetData);
    }
}