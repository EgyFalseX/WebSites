using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;


/// <summary>
/// Summary description for ProductsClass
/// </summary>
public class ImageLibClass
{
    private OleDbConnection conn;


    public ImageLibClass()
    {
        cmd = new OleDbCommand(new DBConnectClass("ImageLib.mdb").ToString());
        cmd.Connection = DBConnectClass.conn;
    }
    private OleDbCommand cmd;

    private int _ID;
   


  
    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
  


    
    public DataTable GetData()
    {
        OleDbDataAdapter da = new OleDbDataAdapter("select * from ImagesData", DBConnectClass.conn);
        DataTable dt=new DataTable("TableData");
   DBConnectClass.OpenConn();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetDataByID()
    {
        OleDbDataAdapter da = new OleDbDataAdapter("select * from ImagesData where CategoryID=@ID", DBConnectClass.conn);
        da.SelectCommand.Parameters.AddWithValue("@ID", ID);
        DataTable dt = new DataTable("RData");
   DBConnectClass.OpenConn();
        da.Fill(dt);
        return dt;
    }


}