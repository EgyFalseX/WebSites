﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for ProductsClass
/// </summary>
public class NewsClass
{
    private OleDbConnection conn;


    public NewsClass()
    {
        cmd = new OleDbCommand(new DBConnectClass("News.mdb").ToString());
        conn = DBConnectClass.conn;
        cmd.Connection = conn;
    }
    private OleDbCommand cmd;
    private OleDbDataReader reader;
    private int _ID, _ViewPage;
    private string _Caption = "", _CaptionE = "", _Contain = "", _ContainE = "", _ImageLink = "", _Msg = "", _Mode = "";


    private bool _IsActive, _IsArabic = false;
    public int pathID;
    private string pathName;
    //
    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
    public int ViewPage
    {
        get { return _ViewPage; }
        set { _ViewPage = value; }
    }
    public string Caption
    {
        get { return _Caption; }
        set { _Caption = value; }
    }

    public string CaptionE
    {
        get { return _CaptionE; /*return pubUserName; */}
        set { _CaptionE = value; /*pubUserName = value;*/ }
    }
    public string Contain
    {
        get { return _Contain; /*return pubPassword; */}
        set { _Contain = value; /*pubPassword=value;*/}
    }
    public string ContainE
    {
        get { return _ContainE; /*return pubPassword; */}
        set { _ContainE = value; /*pubPassword=value;*/}
    }
    public string ImageLink
    {
        get { return _ImageLink; /*return pubPassword; */}
        set { _ImageLink = value; /*pubPassword=value;*/}
    }


  
    public bool IsActive
    {
        get { return _IsActive; }
        set { _IsActive = value; }
    }
    public bool IsArabic
    {
        get { return _IsArabic; }
        set { _IsArabic = value; }
    }

    public string Msg
    {
        get { return _Msg; }
        set { _Msg = value; }
    }
    public string Mode
    {
        get { return _Mode; }
        set { _Mode = value; }
    }



    public DataTable GetData()
    {
       OleDbDataAdapter da = new OleDbDataAdapter("select * from NewsData", DBConnectClass.conn);
        DataTable dt=new DataTable("TableData");
        if (DBConnectClass.conn.State != ConnectionState.Open)
            DBConnectClass.OpenConn();
        da.Fill(dt);

        return dt;
    }
    public DataTable GetDataByID()
    {
        OleDbDataAdapter da = new OleDbDataAdapter("select * from NewsData where ID=@ID", DBConnectClass.conn);
        da.SelectCommand.Parameters.AddWithValue("@ID", ID);
        DataTable dt = new DataTable("RData");

            DBConnectClass.OpenConn();
        da.Fill(dt);
       
        return dt;
    }



}