using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Functions
{
    public class MC
    {
        //Paths
        public static string MatrialFilePath = @"~/DBFiles/"; //Matrial Files Path
        public static string TempFilePath = @"~/UploadFileTemp/"; //Temp Path for temporary files
        public static string ReportURL = @"http://LOCALHOST:8081/ReportServer";
        public static string ReportPath = @"/StoreReport/";
        public enum AppOptions
        {
            customer, supplier, inventory, purchasing, sales, UnderExchange, UnderCollection, SaleReturner, BuyReturner, CommercialCustomer
        }

        public enum ReportNames
        {
            emptyserial, barcodeserial, eznedaffa
        }
        public static string ConvertToDateDMY(string PDate)
        {
            if (PDate == string.Empty)
                return "";
            string ReturnMe = string.Empty;
            DateTime MyDate = Convert.ToDateTime(PDate);
            ReturnMe = String.Format("{0}-{1}-{2}", MyDate.Year, MyDate.Month, MyDate.Day);
            return ReturnMe;
        }//Date Convertor
        public static string ConvertToDateYMDhms(string PDate)
        {
            //yyyy-mm-dd hh-mm-ss  for Convert(20). CONVERT(DATETIME, GetDate(), 20)
            if (PDate == string.Empty)
                return "";
            string ReturnMe = string.Empty;
            DateTime MyDate = Convert.ToDateTime(PDate);
            ReturnMe = String.Format("{0}-{1}-{2} {3}:{4}:{5}", MyDate.Year, MyDate.Month, MyDate.Day, MyDate.Hour, MyDate.Minute, MyDate.Second);
            return ReturnMe;
        }//Date Convertor
        public static string ConvertTotimeHHmmss(string PDate)
        {
            if (PDate == string.Empty)
                return "";
            string ReturnMe = string.Empty;
            try
            {
                DateTime MyDate = Convert.ToDateTime(PDate);
                ReturnMe = String.Format("{0}:{1}:{2}", MyDate.Hour, MyDate.Minute, MyDate.Second);
            }
            catch (Exception)
            {
                return string.Empty;
            }
            return ReturnMe;

        }
        public static Single ConvertStringToInt(string str)
        {
            string ReturnMe = string.Empty;
            int count = 0;
            foreach (char c in str.ToCharArray())
            {
                if (c == Convert.ToChar(".") && count < 1)
                {
                    ReturnMe += c.ToString();
                    count++;
                }
                if (char.IsNumber(c))
                {
                    ReturnMe += c.ToString();
                }
            }
            if (ReturnMe == string.Empty)
            {
                ReturnMe = "0";
            }
            return Convert.ToSingle(ReturnMe);
        }
        public static bool IsDecimal(string theValue)
        {
            try
            {
                Convert.ToDouble(theValue);
                return true;
            }
            catch
            {
                return false;
            }
        } //IsDecimal
        public static bool IsInteger(string theValue)
        {
            try
            {
                Convert.ToInt32(theValue);
                return true;
            }
            catch
            {
                return false;
            }
        } //IsInteger
        public static string FixChar(string CharZ)
        {
            CharZ = CharZ.Replace("أ", "ا");
            return CharZ;
        }//Remove أ
        //Database
        public static string ConnectionStr()
        {
            string constr = "Data Source=.;Persist Security Info=True;User ID=sa;Password=123456;Initial Catalog=E_STORE";
            //string constr = "Data Source=.\\SQLEXPRESS;Persist Security Info=True;User ID=sa;Password=123456;Initial Catalog=E_STORE";
            return constr;
        }//Sql Server connection string
        public static SqlConnection EStoreConnection
        {
            get
            {
                SqlConnection con1 = new SqlConnection(ConnectionStr());
                if (con1.State == ConnectionState.Open)
                {
                    con1.Close();
                }
                return con1;
            }
        }//Sql Server connection object
        public static string CheckExp(SqlException ex)
        {
            switch (ex.Number)
            {
                case 2627:
                    return "موجود مسبقاً ...";
                case 233:
                    return "SQl Server غير متاح";
                case 2:
                    return "SQl Server غير متاح";
                case 515:
                    string ReturnMe = "يجب مليء" + Environment.NewLine;
                    int tempint = 0;
                    foreach (char Chr in ex.Message.ToCharArray())
                    {
                        //Get column name from error msg and its between ''
                        char Dot = '\'';

                        if (Chr == Dot)
                            tempint++;
                        if (tempint == 1)
                            ReturnMe += Chr;
                        else if (tempint == 2)
                            break;
                    }
                    return ReturnMe + "'";
                default:
                    return "خطاء في بيانات الادخال";
            }
        }
        public static DataTable LoadDataTable(string CommandString, string ErrorProviderStr)
        {
            ErrorProviderStr = string.Empty;
            DataTable ReturnMe = new DataTable("FX2010-11");
            using (SqlDataAdapter DA = new SqlDataAdapter(CommandString, EStoreConnection))
            {
                try { DA.Fill(ReturnMe); }
                catch (SqlException ex)
                { ErrorProviderStr = ex.Message; }
            }

            return ReturnMe;
        }//Load Table From Database
        public static DataTable LoadDataTable(string CommandString)
        {
            DataTable ReturnMe = new DataTable("FX2010-11");
            using (SqlDataAdapter DA = new SqlDataAdapter(CommandString, EStoreConnection))
            {
                try 
                {
                    DA.Fill(ReturnMe);
                    DataRow row = ReturnMe.NewRow();
                    //row[0] = "0";
                    //row[1] = "اختار";
                    ReturnMe.Rows.InsertAt(row, 0);
                }
                catch (SqlException) {  }
            }

            return ReturnMe;
        }//Load Table From Database
        public static string GetNewID(string TableName, string ColumnName)
        {
            string ReturnMe = string.Empty;
            SqlConnection Con = EStoreConnection;
            SqlCommand Cmd = new SqlCommand("SELECT ISNULL(MAX(" + ColumnName + ") + 1, 1) AS NewID FROM " + TableName + " AS NewID", Con);
            SqlDataReader dr;
            try
            {
                Con.Open();
                dr = Cmd.ExecuteReader();
                if (dr.HasRows)
                    dr.Read();
                ReturnMe = dr.GetValue(0).ToString();
            }
            catch (SqlException ex)
            {
                // nothing here
                string x = ex.Message;
            }
            Con.Close();
            return ReturnMe;
        }//Get Unique New ID
        public static string GetOptionValue(AppOptions AppOp)
        {
            string ReturnMe = "0";
            SqlConnection con = EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                cmd.CommandText = string.Format("Select opvalue From CDOptions Where opname = N'{0}'", AppOp);
                con.Open();
                ReturnMe = cmd.ExecuteScalar().ToString();
            }
            catch (SqlException)
            { }
            con.Close();
            return ReturnMe;
        }
        public static bool GetPagePriv(string PageName, string UserID)
        {
            bool ReturnMe = false;
            SqlConnection con = EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                con.Open();
                cmd.CommandText = string.Format(@"SELECT COUNT(*) AS Found FROM MenuItemName WHERE (PageName = '{0}') AND 
                EXISTS (SELECT TOP (1) MenuItemNameID FROM RoleDetial WHERE (MenuItemNameID = MenuItemName.MenuItemNameID) AND 
                (RoleID IN (SELECT RoleId FROM UserRoles WHERE (UserId = {1}))))", PageName, UserID);
                string Read = cmd.ExecuteScalar().ToString();
                if (Read != "0")
                    ReturnMe = true;
            }
            catch (SqlException ex)
            {
                string x = ex.Message;
            }
            con.Close();
            return ReturnMe;
        }
        public static void GetReadyPageToUse(string PageName, string PageText)
        {
            SqlConnection con = EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                con.Open();
                cmd.CommandText = string.Format(@"If not Exists(Select MenuItemNameID From MenuItemName Where PageName = '{0}')
                begin
                Insert Into MenuItemName (PageName, PageText) VALUES (N'{0}', N'{1}')
                Insert Into RoleDetial (RoleID, MenuItemNameID, Selecting, Inserting, Updateing, Deleting) VALUES (1, (Select MenuItemNameID From MenuItemName Where PageName = '{0}'), 'True', 'True', 'True', 'True')
                end", PageName, PageText);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                string x = ex.Message;
            }
            con.Close();
        }
    }
}
