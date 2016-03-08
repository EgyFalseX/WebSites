using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Collections;
using System.Data.OleDb;
using System.IO;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for DB
/// </summary>
/// 

public class DB
{
    
    public enum DBOpType
    {
        Select,
        Insert,
        Update,
        Delete,
        NewID
    }
    public enum DBTablesNames
    {
        TBLTrainee,
        CdNationality,
        Cdcountry
    }
    public static OleDbConnection ConnectionABOUT
    {
        get
        {
            OleDbConnection con = new OleDbConnection(DBConStrABOUT);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    public static OleDbConnection ConnectionAATSWEB
    {
        get
        {
            OleDbConnection con = new OleDbConnection(DBConStrAATSWEB);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    static string ConnectionStr(string DataBaseName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\App_Data\" + DataBaseName);

        return constr;
    }
    public DB()
    {
        if(!System.IO.Directory.Exists(CourseFileDir))
            System.IO.Directory.CreateDirectory(CourseFileDir);
        if(!System.IO.Directory.Exists(CourseFileDir))
            System.IO.Directory.CreateDirectory(CourseFileDir);
    }
    public static string ConvertToDateDMY(string PDate)
    {

        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        ReturnMe = String.Format("{0}/{1}/{2}", MyDate.Day, MyDate.Month, MyDate.Year);
        return ReturnMe;
    }
    public static string ConvertToDateHMS(string PDate)
    {
        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        ReturnMe = String.Format("{0}:{1}:{2}", MyDate.Hour, MyDate.Minute, MyDate.Second);
        return ReturnMe;
    }
    public static string ConvertToDateDMYHMS(string PDate)
    {

        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        ReturnMe = String.Format("{0}-{1}-{2} {3}:{4}:{5}", MyDate.Year, MyDate.Month, MyDate.Day, MyDate.Hour, MyDate.Minute, MyDate.Second);
        return ReturnMe;
    }
    public static bool IsNullOrEmpty(object obj)
    {
        if (obj == null)
            return true;

        if (obj.ToString() == string.Empty)
            return true;
        else
            return false;
    }

    #region - ABOUTDataBase - 
    public static string DBConStrABOUT = ConnectionStr("ABOUT.mdb");
    public static string ABOUTPath = "~/App_Data/ABOUT.mdb";
    public static DataTable LoadTableABOUT(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, ConnectionABOUT);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    public static string Insertcontact(string coname, string sefaid, string contypeid, string tel, string mail, string massage)
    {
        OleDbConnection con = ConnectionABOUT;
        OleDbCommand cmd = new OleDbCommand("", con);
        if (sefaid == string.Empty)
            sefaid = "NULL";
        if (contypeid == string.Empty)
            contypeid = "NULL";
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO contact (coname, sefaid, contypeid, tel, mail, massage, condate)
            VALUES ('{0}', {1}, {2}, '{3}', '{4}', '{5}', NOW())", coname, sefaid, contypeid, tel, mail, massage);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            return ex.Message;
        }
        con.Close();
        return string.Empty;
    }
    #endregion
    #region - AATSWEBDatabase - 
    public static string DBConStrAATSWEB = ConnectionStr("AATSWEB.mdb");
    public static string AATSWEBPath = "~/App_Data/AATSWEB.mdb";
    public static string tempDir = "~/temp/";
    public static string CourseFileDir = HttpContext.Current.Server.MapPath("~/CourseFiles/");
    public static string CourseFileDirV = "~/CourseFiles/";

    public static DataTable LoadTableAATSWEB(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, ConnectionAATSWEB);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    public static string GetNewID(DBTablesNames TableName)
    {
        string ColunmName = string.Empty;
        string ReturnMe = string.Empty;
        switch (TableName)
        {
            case DBTablesNames.TBLTrainee:
                ColunmName = "TraineeID";
                break;
            case DBTablesNames.CdNationality:
                ColunmName = "NationalityId";
                break;
            case DBTablesNames.Cdcountry:
                ColunmName = "countryId";
                break;
            default:
                break;
        }
        using (OleDbConnection con = ConnectionAATSWEB)
        {
            OleDbCommand cmd = new OleDbCommand("", con);
            try
            {
                con.Open();
                cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", ColunmName, TableName.ToString());
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
    public static AccessDataSource GetSqlCommandString(DBTablesNames TableName)
    {
        AccessDataSource ADS = new AccessDataSource();
        DataTable dt = new DataTable();
        ADS.DataFile = AATSWEBPath;
        switch (TableName)
        {
            case DBTablesNames.TBLTrainee:
                ADS.SelectCommand = "SELECT TraineeID, TraineeName, NameInEnglish, NationalityId, Mobile, tel, Email, City, Address, mony, accname, countryId, TimeIn FROM TBLTrainee";
                ADS.InsertCommand = @"INSERT INTO TBLTrainee (TraineeID, TraineeName, NameInEnglish, NationalityId, Mobile, tel, Email, City, Address, mony, accname, countryId, TimeIn)
                                    VALUES (@TraineeID, @TraineeName, @NameInEnglish, @NationalityId, @Mobile, @tel, @Email, @City, @Address, @mony, @accname, @countryId, NOW())";
                ADS.UpdateCommand = @"UPDATE TBLTrainee SET TraineeName = @TraineeName, NameInEnglish = @NameInEnglish, NationalityId = @NationalityId, Mobile = @Mobile, 
                                    tel = @tel, Email = @Email, City = @City, Address = @Address, mony = @mony, accname = @accname, countryId = @countryId, TimeIn = NOW()
                                    Where TraineeID = @TraineeID";
                ADS.DeleteCommand = @"DELETE FROM TBLTrainee WHERE (TraineeID = @TraineeID)";

                //string xxx = ADS.InsertParameters.Count.ToString();
                //dt = LoadTableAATSWEB(ADS.SelectCommand);
                break;
            case DBTablesNames.Cdcountry:
                ADS.SelectCommand = "Select countryId, country From Cdcountry";
                ADS.InsertCommand = "";
                ADS.UpdateCommand = "";
                ADS.DeleteCommand = "";
                break;
          
            case DBTablesNames.CdNationality:
                ADS.SelectCommand = "Select NationalityId, Nationality From CdNationality";
                ADS.InsertCommand = "";
                ADS.UpdateCommand = "";
                ADS.DeleteCommand = "";
                break;
            default:
                break;
        }
        OleDbConnection con = ConnectionAATSWEB;
        con.Open();
        dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Columns, new object[] { null, null, TableName.ToString(), null });
        foreach (DataRow row in dt.Rows)
        {
            //(int)row["DATA_TYPE"]
            int datatype = Convert.ToInt16(row["DATA_TYPE"]);
            ADS.InsertParameters.Add(row["COLUMN_NAME"].ToString(), ColumnType(datatype), "");
            ADS.UpdateParameters.Add(row["COLUMN_NAME"].ToString(), ColumnType(datatype), "");
            ADS.DeleteParameters.Add(row["COLUMN_NAME"].ToString(), ColumnType(datatype), "");
        }
        
        return ADS;
    }
    private static DbType ColumnType(int TypeCode)
    {
        switch (TypeCode)
        {
            case 202:
                return DbType.String;
            case 130:
                return DbType.String;
            case 203://Memo
                return DbType.String;
            case 17:
                return DbType.Byte;
            case 2:
                return DbType.Int32;
            case 3://Long or Auto Number
                return DbType.Int64;
            case 4:
                return DbType.Single;
            case 5:
                return DbType.Double;
            case 72://Replica
                return DbType.Int64;
            case 131:
                return DbType.Decimal;
            case 7:
                return DbType.DateTime;
            case 6:
                return DbType.Currency;
            case 11:
                return DbType.Boolean;
            case 205://OLE Object
                return DbType.Binary;
            case 204://BINARY (size)
                return DbType.Binary;
            default:
                return DbType.VarNumeric;
        }
    }
    private static SmtpClient MailConfig()
    {
        DataTable dt = LoadTableAATSWEB("Select mailserver, port, username, pass, enableSsl from mailinfo");
        SmtpClient client = new SmtpClient();
        if (dt.Rows.Count != 0)
        {
            client.Host = dt.Rows[0]["mailserver"].ToString();
            client.Port = (int)dt.Rows[0]["port"];;
            client.Credentials = new NetworkCredential(dt.Rows[0]["username"].ToString(), dt.Rows[0]["pass"].ToString());
            client.EnableSsl = (bool)dt.Rows[0]["enableSsl"];
        }
        return client;
    }
    public static string sendMail(string to, string subject, string body)
    {
        string ReturnMe = string.Empty;
        try
        {
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress(to));
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = true;

            SmtpClient client = MailConfig();
            client.Send(message);
        }
        catch (Exception ex)
        {
            ReturnMe = ex.Message;
        }
        return ReturnMe;
    }
    public static string SaveUserSkin(string SkinName)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText =  string.Format(@"Update uid Set skinname = '{0}' Where uanem = '{1}'", SkinName, TheSessions.UserID);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }
    public static DataTable SelectCourses()
    {
        return LoadTableAATSWEB(String.Format(@"Select CourseId, '../ViewCourseDetails.aspx?CourseId=' & CourseId AS CourseIdLink, CourseName, Courseremark, imageline1, 
        '{0}/' & CourseId & '-1.jpg' AS imageline1Link, StartDate, EndDate, Price, ShowOnline From TBLCourses", CourseFileDirV));
    }
    public static DataTable SelectCourses(string ShowOnline)
    {
        return LoadTableAATSWEB(String.Format(@"Select CourseId, '../ViewCourseDetails.aspx?CourseId=' & CourseId AS CourseIdLink, CourseName, Courseremark, imageline1, 
        '{0}/' & CourseId & '-1.jpg' AS imageline1Link, StartDate, EndDate, Price, ShowOnline From TBLCourses Where ShowOnline = {1}", CourseFileDirV, ShowOnline));
    }
    public static string SelectCourseDataPath(string CourseId, string CourseItem)
    {
        DataTable dt = LoadTableAATSWEB(string.Format("Select DataPath From CourseDataPath WHERE (CourseId = {0}) And (CourseItem = {1})", CourseId, CourseItem));
        if (dt.Rows.Count > 0)
            return CourseFileDir + dt.Rows[0][0].ToString();
        else
            return string.Empty;
    }
    public static string SelectCourseName(string CourseId)
    {
        DataTable dt = LoadTableAATSWEB(string.Format("Select CourseName From TBLCourses WHERE (CourseId = {0})", CourseId));
        if (dt.Rows.Count > 0)
            return dt.Rows[0][0].ToString();
        else
            return string.Empty;
    }
    public static string InsertCourse(ref string CourseId, string CourseName, string Courseremark, string StartDate, string EndDate, string Price, string ShowOnline)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
        
        DataTable dt = LoadTableAATSWEB(@"SELECT MAX(CourseId) + 1 FROM TBLCourses");
        if (dt.Rows.Count != 0)
            CourseId = dt.Rows[0][0].ToString();
        else
            CourseId = "1";

        if (StartDate != string.Empty)
            StartDate = string.Format("Format('{0}','dd/MM/yyyy')", ConvertToDateDMY(StartDate));
        else
            StartDate = "NULL";

        if (EndDate != string.Empty)
            EndDate = string.Format("Format('{0}','dd/MM/yyyy')", ConvertToDateDMY(EndDate));
        else
            EndDate = "NULL";

        if (Price == string.Empty)
            Price = "0";
        try
        {
            cmd.CommandText = string.Format(@"Insert Into TBLCourses (CourseId, CourseName, Courseremark, StartDate, EndDate, Price, ShowOnline) VALUES ({0}, '{1}', '{2}', {3}, {4}, {5}, {6})",
            CourseId, CourseName, Courseremark, StartDate, EndDate, Price, ShowOnline);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return string.Empty;
    }
    public static string UpdateCourse(string CourseId, string CourseName, string Courseremark, string StartDate, string EndDate, string Price, string ShowOnline)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
       if (StartDate != string.Empty)
           StartDate = string.Format("Format('{0}','dd/MM/yyyy')", ConvertToDateDMY(StartDate));
        else
            StartDate = "NULL";

        if (EndDate != string.Empty)
            EndDate = string.Format("Format('{0}','dd/MM/yyyy')", ConvertToDateDMY(EndDate));
        else
            EndDate = "NULL";

        if (Price == string.Empty)
            Price = "0";
        try
        {
            cmd.CommandText = string.Format(@"Update TBLCourses Set CourseName = '{0}', Courseremark = '{1}', StartDate = {2}, EndDate = {3}, Price = {4}, ShowOnline = {5} Where CourseId = {6}",
            CourseName, Courseremark, StartDate, EndDate, Price, ShowOnline, CourseId);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }
    public static string UpdateCourseDataPath(string CourseId, string CourseItem, string DataPath)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            if (LoadTableAATSWEB(string.Format(@"Select * From CourseDataPath Where CourseId = {0} And CourseItem = {1}", CourseId, CourseItem)).Rows.Count > 0)
                cmd.CommandText = string.Format(@"Update CourseDataPath Set DataPath = '{0}' Where CourseId = {1} And CourseItem = {2}", DataPath, CourseId, CourseItem);
            else
                cmd.CommandText = string.Format(@"Insert Into CourseDataPath (CourseId, CourseItem, DataPath) VALUES ({0}, {1}, '{2}')", CourseId, CourseItem, DataPath);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }
    public static string DeleteCourse(string CourseId)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Delete From TBLCourses Where CourseId = {0}", CourseId);
            cmd.ExecuteNonQuery();
            if (File.Exists(String.Format("{0}{1}-1.jpg", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-1.jpg", CourseFileDir, CourseId));

            if (File.Exists(String.Format("{0}{1}-1.cdf", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-1.cdf", CourseFileDir, CourseId));

            if (File.Exists(String.Format("{0}{1}-2.cdf", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-2.cdf", CourseFileDir, CourseId));

            if (File.Exists(String.Format("{0}{1}-3.cdf", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-3.cdf", CourseFileDir, CourseId));

            if (File.Exists(String.Format("{0}{1}-4.cdf", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-4.cdf", CourseFileDir, CourseId));

            if (File.Exists(String.Format("{0}{1}-5.cdf", CourseFileDir, CourseId)))
                File.Delete(String.Format("{0}{1}-5.cdf", CourseFileDir, CourseId));
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }
    public static string InsertTrainee(string TraineeName, string NameInEnglish, string NationalityId, string countryId, string City, string Address, string tel, string Mobile, string Email, string mony, string accname, string CourseId)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = ConnectionAATSWEB;
        OleDbCommand cmd = new OleDbCommand("", con);
        DataTable dt = LoadTableAATSWEB(@"SELECT MAX(TraineeID) + 1 FROM TBLTrainee");
        string TraineeID;
        if (dt.Rows.Count != 0)
            TraineeID = dt.Rows[0][0].ToString();
        else
            TraineeID = "1";
        if (NationalityId == string.Empty)
            NationalityId = "NULL";
        if (countryId == string.Empty)
            countryId = "NULL";
        try
        {
            cmd.CommandText = string.Format(@"Insert Into TBLTrainee (TraineeID, TraineeName, NameInEnglish, NationalityId, countryId, City, Address, tel, Mobile, Email, mony, accname, CourseId) VALUES 
            ({0}, '{1}', '{2}', {3}, {4}, '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', {12})",
            TraineeID, TraineeName, NameInEnglish, NationalityId, countryId, City, Address, tel, Mobile, Email, mony, accname, CourseId);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            ReturnMe = ex.Message;
        }
        con.Close();
        return string.Empty;
    }
    public static DataTable SearchForCertificate(string UniqueNo)
    {
        return LoadTableAATSWEB(@"Select TraineeID, CourseId, UniqueNo, trineer, Format(ReceiptDate, 'dd/MM/yyyy') AS ReceiptDate From TBLTraineeCertificatesnew Where UniqueNo = '" + UniqueNo + "'");
    }

    #endregion
}
