using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for MySchool
/// </summary>
public class MySchool
{

    public MySchool()
    {
        //
        // TODO: Add constructor logic here
        //

    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\data\" + DataBasename);

        return constr;
    }
    static string ConnectionStr1(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\data\" + DataBasename);

        return constr;
    }
    public static OleDbConnection ServicesConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"Services.mdb"));

            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }
    public static OleDbConnection StudentConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"dstudent\dataschool.mdb"));
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }
    public static OleDbConnection TheCodesConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr1(@"code\code.mdb"));
            return con1;
        }
    }
    public static OleDbConnection CodesConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr1(@"code\asase.mdb"));
            return con1;
        }

    }
    public static OleDbConnection MalafatConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"dmalafat\dmalafat.mdb"));
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }

    public static OleDbConnection SLConnection
    {
        get
        {
            OleDbConnection SLCon = new OleDbConnection(ConnectionStr(@"SL.mdb"));
            if (SLCon.State == ConnectionState.Open)
            {
                SLCon.Close();
            }
            return SLCon;
        }
    }
    public static OleDbConnection LibraryConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr1(@"library.mdb"));
            return con1;
        }

    }
    public static OleDbConnection LibraryCodeConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr1(@"libcode.mdb"));
            return con1;
        }

    }
}