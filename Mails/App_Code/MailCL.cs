using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;


    /// <summary>
    /// Summary description for sessionMessages
    /// </summary>
    public class MailCL
    {
        public MailCL()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static string ConnectionStr
        {
            get
            {
                string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
                HttpServerUtility sv = HttpContext.Current.Server;

                constr += sv.MapPath(@"~/App_Data\contact.mdb");

                return constr;
            }
            
        }

        public static string GetNewID(string tableName, string colunmName)
        {
            string ReturnMe = string.Empty;
           
            using (OleDbConnection con = new OleDbConnection(MailCL.ConnectionStr))
            {
                OleDbCommand cmd = new OleDbCommand("", con);
                try
                {
                    con.Open();
                    cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", colunmName, tableName);
                    ReturnMe = cmd.ExecuteScalar().ToString();
                }
                catch (OleDbException ex)
                {
                    throw ex;
                }
                con.Close();
            }
            return ReturnMe;
        }

        public static DataTable LoadTable(string commandstring)
        {
            DataTable dt = new DataTable();
            OleDbDataAdapter da = new OleDbDataAdapter(commandstring, ConnectionStr);
            try
            { da.Fill(dt); }
            catch (OleDbException ex)
            {
                throw ex;
            }
            return dt;
        }
    }


