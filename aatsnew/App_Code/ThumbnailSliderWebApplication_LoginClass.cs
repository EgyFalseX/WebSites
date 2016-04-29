using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;


    public class ThumbnailSliderWebApplication_LoginClass
    {
        private OleDbConnection conn;
        public ThumbnailSliderWebApplication_LoginClass(string dbName)
        {
            cmd = new OleDbCommand(new ThumbnailSliderWebApplication_DBConnectClass(dbName).ToString());
            conn = ThumbnailSliderWebApplication_DBConnectClass.conn;
            cmd.Connection = conn;
        }
        private OleDbCommand cmd;
        private OleDbDataReader reader;
        private int _RoleID, _EmployeeID;
        private string _UserName = "", _Password = "", _Msg = "", _Mode = "";
        private int _SyndicateID;
        private int _SubCommitteID;
        public int SyndicateID
        {
            get { return _SyndicateID; }
            set { _SyndicateID = value; }
        }
        public int SubCommitteID
        {
            get { return _SubCommitteID; }
            set { _SubCommitteID = value; }
        }
        private DateTime _LastLoggedOn = DateTime.Now, _LastLoggedOff = DateTime.Now;
        private bool _IsActive, _IsArabic = false;
        public int pathID;
        private bool _IsAdmin;

        //public bool IsAdmin
        //{
        //    get { return _IsAdmin; }
        //    set { _IsAdmin = value; }
        //}
        private string pathName;
        //
        public int RoleID
        {
            get { return _RoleID; }
            set { _RoleID = value; }
        }
        public int EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
        }

        public string UserName
        {
            get { return _UserName; /*return pubUserName; */}
            set { _UserName = value; /*pubUserName = value;*/ }
        }
        public string Password
        {
            get { return _Password; /*return pubPassword; */}
            set { _Password = value; /*pubPassword=value;*/}
        }






        public DateTime LastLoggedOn
        {
            get { return _LastLoggedOn; }
            set { _LastLoggedOn = value; }
        }
        public DateTime LastLoggedOff
        {
            get { return _LastLoggedOff; }
            set { _LastLoggedOff = value; }
        }
        //public bool IsActive
        //{
        //    get { return _IsActive; }
        //    set { _IsActive = value; }
        //}
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

        public string LoginMethod()
        {

            cmd.CommandText = "select * from enasadmin where user=@UserName and pass=@Password";

            cmd.CommandType = CommandType.Text;
            if (cmd.Parameters.Count > 0)
                cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@Password", Password);


            if (conn.State == ConnectionState.Closed)
                conn.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                try
                {
                    UserName = reader["user"].ToString();
                    Password = reader["Pass"].ToString();
                    //IsActive = Convert.ToBoolean(reader["IsActive"]);

                }
                catch (Exception ex)
                {
                    if (ex.Message == "Index was outside the bounds of the array.")
                        Msg = reader[0].ToString();
                }
            }

            else
                Msg = "إسم المستخدم أو كلمة المرور غير صحيحة";

            conn.Close();
            return Msg;
        }
        public string GetPathName()
        {
            cmd.CommandText = "select PathName from ConstantPathes where PathID=@PathID ";
            cmd.CommandType = CommandType.Text;
            if (cmd.Parameters.Count > 0)
                cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@PathID", pathID);


            if (conn.State == ConnectionState.Closed)
                conn.Open();

            reader = cmd.ExecuteReader();
            if (reader.Read())
            { pathName = reader[0].ToString(); }
            return pathName;
        }
    }