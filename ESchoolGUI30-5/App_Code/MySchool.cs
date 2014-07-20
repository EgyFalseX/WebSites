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

  static  string ConnectionStr1(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\data\" + DataBasename);

        return constr;
    }
    public static OleDbConnection AccountantConnection { get 
    {
        OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"daccountschool\Daccount.mdb"));
        if (con1.State == ConnectionState.Open)
        {
            con1.Close();
        }
        return con1;
    } }
    public static OleDbConnection ControlConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"dcontrol\Datacontrol.mdb"));
            
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
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
    public static OleDbConnection GadwalConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"dgadwal\dgadwal.mdb"));
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
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
    public static OleDbConnection HomeWorkConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"dmotapa\home_work.mdb"));
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
    public static OleDbConnection SchoolConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr(@"DTAKTEET\dtakteet.mdb"));
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
    public static  OleDbConnection CodesConnection { get 
    {
        OleDbConnection con1 = new OleDbConnection(ConnectionStr1(@"code\asase.mdb"));
        return con1;
    } 

    }
}
