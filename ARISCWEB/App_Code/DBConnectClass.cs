﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.OleDb;


    public class DBConnectClass
    {
        public static OleDbConnection conn;
        //public static OdbcConnection conn;
        public static int connStatus = 0;
        public DBConnectClass(string DBName)
        {
            conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\\" + DBName);
            conn.Open();
            if (conn.State == ConnectionState.Open)
            connStatus = 1;
       
        }
        
        //public static SqlConnection DBConnectClass()
        //{
        //    conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=society;Integrated Security=True");
        //    return conn;
        //}
        public static void OpenConn()
        {
            //if (conn.State == ConnectionState.Open)
                conn.Close();

                conn.Open();
        }
        public static void CloseConn()
        {
            conn.Close();
        }
       

    }

