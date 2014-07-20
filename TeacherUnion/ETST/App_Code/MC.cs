using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MC
/// </summary>
public class MC
{
    // Paths
    public static string constr = System.Configuration.ConfigurationManager.ConnectionStrings["ETSTConnectionString"].ConnectionString;    // No Express
    public static string ReportURL = @"http://LOCALHOST:8081/ReportServer";
    public static string ReportPath = @"/StoreReport/";
    public static string FilesPath = "../Assets/Images/";
    public MC()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public enum AppOptions
    {
        Options1
    }
    public static void InsertEmptyValue(ref SqlCommand cmd)
    {
        foreach (SqlParameter item in cmd.Parameters)
        {
            if (IsNullOrEmpty(item.Value))
            {
                if (item.SqlDbType == SqlDbType.Bit)
                    item.Value = "False";
                else
                    item.Value = DBNull.Value;
            }
        }
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

    public static string ConvertToDateYMD(string PDate)
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
    public static SqlConnection ESchoolConnection
    {
        get
        {
            
            SqlConnection con1 = new SqlConnection(constr);
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
    }// Get Message For Exceptions
    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (SqlDataAdapter DA = new SqlDataAdapter(CommandString, ESchoolConnection))
        {
            try
            {
                DA.Fill(ReturnMe);
                DataRow row = ReturnMe.NewRow();
                //row[0] = "0";
                //row[1] = "اختار";
                if (EnableAddEmptyRow)
                    ReturnMe.Rows.InsertAt(row, 0);
            }
            catch (SqlException) { }
        }

        return ReturnMe;
    }//Load Table From Database
    public static string GetNewID(string TableName, string ColumnName)
    {
        string ReturnMe = string.Empty;
        SqlConnection Con = ESchoolConnection;
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
        SqlConnection con = ESchoolConnection;
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
    }// Get Option Value From Database
    public static bool GetPagePriv(string PageName, string UserID)
    {
        bool ReturnMe = false;
        SqlConnection con = ESchoolConnection;
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
    }// Get Privilage For A Page


    public static DataTable SelectTBLMembers(object MemberId = null)
    {
        if (MemberId == null)
        {
		 return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[Bdate] ,[GenderId] ,[MaritalStatusId] ,[IdTypeId] ,[NID] ,[NIDEndDate] ,[Street]
              ,[HomeNo] ,[FlatNo] ,[Area] ,[City] ,[GovId] ,[Mobile] ,[HomeTel] ,[WorkTel] ,[EMail] ,[KidNO] ,[ContactTypeID] ,[MemberImage]
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed
          FROM [ETST].[dbo].[TBLMembers]
        ", false);
        }
        else
        {
            return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[Bdate] ,[GenderId] ,[MaritalStatusId] ,[IdTypeId] ,[NID] ,[NIDEndDate] ,[Street]
              ,[HomeNo] ,[FlatNo] ,[Area] ,[City] ,[GovId] ,[Mobile] ,[HomeTel] ,[WorkTel] ,[EMail] ,[KidNO] ,[ContactTypeID] ,[MemberImage]
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed
          FROM [ETST].[dbo].[TBLMembers]
          WHERE MemberId = 
        " + MemberId, false);
        }
        
    }
    
    public static object InsertTBLMembers(object SyndicateId, object SubCommitteId, object MemberName, object Bdate, object GenderId, object MaritalStatusId, object IdTypeId, 
        object NID, object NIDEndDate, object Street, object HomeNo, object FlatNo, object Area, object City, object GovId, object Mobile, object HomeTel, object WorkTel,
        object EMail, object KidNO, object ContactTypeID, object MemberImage, object ReceiptNo, object GehaId)
    {
        object ReturnMe = null;
        SqlConnection con = MC.ESchoolConnection;
        SqlCommand cmd = new SqlCommand("", con);

        cmd.Parameters.Add(new SqlParameter("@SyndicateId", SqlDbType.Int) { Value = SyndicateId });
        cmd.Parameters.Add(new SqlParameter("@SubCommitteId", SqlDbType.Int) { Value = SubCommitteId });
        cmd.Parameters.Add(new SqlParameter("@MemberName", SqlDbType.NVarChar) { Value = MemberName });
        cmd.Parameters.Add(new SqlParameter("@Bdate", SqlDbType.Date) { Value = Bdate });
        cmd.Parameters.Add(new SqlParameter("@GenderId", SqlDbType.TinyInt) { Value = GenderId });
        cmd.Parameters.Add(new SqlParameter("@MaritalStatusId", SqlDbType.TinyInt) { Value = MaritalStatusId });
        cmd.Parameters.Add(new SqlParameter("@IdTypeId", SqlDbType.TinyInt) { Value = IdTypeId });
        cmd.Parameters.Add(new SqlParameter("@NID", SqlDbType.NVarChar) { Value = NID });
        cmd.Parameters.Add(new SqlParameter("@NIDEndDate", SqlDbType.Date) { Value = NIDEndDate });
        cmd.Parameters.Add(new SqlParameter("@Street", SqlDbType.NVarChar) { Value = Street });
        cmd.Parameters.Add(new SqlParameter("@HomeNo", SqlDbType.NVarChar) { Value = HomeNo });
        cmd.Parameters.Add(new SqlParameter("@FlatNo", SqlDbType.NVarChar) { Value = FlatNo });
        cmd.Parameters.Add(new SqlParameter("@Area", SqlDbType.NVarChar) { Value = Area });
        cmd.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar) { Value = City });
        cmd.Parameters.Add(new SqlParameter("@GovId", SqlDbType.TinyInt) { Value = GovId });
        cmd.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.NVarChar) { Value = Mobile });
        cmd.Parameters.Add(new SqlParameter("@HomeTel", SqlDbType.NVarChar) { Value = HomeTel });
        cmd.Parameters.Add(new SqlParameter("@WorkTel", SqlDbType.NVarChar) { Value = WorkTel });
        cmd.Parameters.Add(new SqlParameter("@EMail", SqlDbType.NVarChar) { Value = EMail });
        cmd.Parameters.Add(new SqlParameter("@KidNO", SqlDbType.NVarChar) { Value = KidNO });
        cmd.Parameters.Add(new SqlParameter("@ContactTypeID", SqlDbType.TinyInt) { Value = ContactTypeID });
        cmd.Parameters.Add(new SqlParameter("@MemberImage", SqlDbType.NVarChar) { Value = MemberImage });
        cmd.Parameters.Add(new SqlParameter("@userin", SqlDbType.Int) { Value = TheSessions.UserID });
        cmd.Parameters.Add(new SqlParameter("@ReceiptNo", SqlDbType.NVarChar) { Value = ReceiptNo });
        cmd.Parameters.Add(new SqlParameter("@GehaId", SqlDbType.Int) { Value = GehaId });

        MC.InsertEmptyValue(ref cmd);

        try
        {
            con.Open();

            cmd.CommandText = "SELECT ISNULL(MAX(MemberId) + 1, 1) FROM TBLMembers";
            ReturnMe = cmd.ExecuteScalar();
            cmd.Parameters.Add(new SqlParameter("@MemberId", SqlDbType.Int) { Value = ReturnMe });

            cmd.CommandText = @"INSERT INTO TBLMembers
            (MemberId, SyndicateId, SubCommitteId, MemberName, Bdate, GenderId, MaritalStatusId, IdTypeId, NID, NIDEndDate, Street, HomeNo, FlatNo, Area, 
            City, GovId, Mobile, HomeTel, WorkTel, EMail, KidNO, ContactTypeID, MemberImage, userin, datein, ReceiptNo, GehaId, Closed)
            VALUES (@MemberId, @SyndicateId, @SubCommitteId, @MemberName, @Bdate, @GenderId, @MaritalStatusId, @IdTypeId, @NID, 
            @NIDEndDate, @Street, @HomeNo, @FlatNo, @Area, @City, @GovId, @Mobile, @HomeTel, @WorkTel, @EMail, @KidNO, @ContactTypeID, 
            @MemberImage, @userin, GETDATE(), @ReceiptNo, @GehaId, 'False')";
            
            cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }
   
    public static bool UpdateTBLMembers(object MemberId, object SyndicateId, object SubCommitteId, object MemberName, object Bdate, object GenderId, object MaritalStatusId, object IdTypeId,
        object NID, object NIDEndDate, object Street, object HomeNo, object FlatNo, object Area, object City, object GovId, object Mobile, object HomeTel, object WorkTel,
        object EMail, object KidNO, object ContactTypeID, object MemberImage, object ReceiptNo, object GehaId)
    {
        bool ReturnMe = false;
        SqlConnection con = MC.ESchoolConnection;
        SqlCommand cmd = new SqlCommand("", con);

        cmd.Parameters.Add(new SqlParameter("@MemberId", SqlDbType.Int) { Value = MemberId });

        cmd.Parameters.Add(new SqlParameter("@SyndicateId", SqlDbType.Int) { Value = SyndicateId });
        cmd.Parameters.Add(new SqlParameter("@SubCommitteId", SqlDbType.Int) { Value = SubCommitteId });
        cmd.Parameters.Add(new SqlParameter("@MemberName", SqlDbType.NVarChar) { Value = MemberName });
        cmd.Parameters.Add(new SqlParameter("@Bdate", SqlDbType.Date) { Value = Bdate });
        cmd.Parameters.Add(new SqlParameter("@GenderId", SqlDbType.TinyInt) { Value = GenderId });
        cmd.Parameters.Add(new SqlParameter("@MaritalStatusId", SqlDbType.TinyInt) { Value = MaritalStatusId });
        cmd.Parameters.Add(new SqlParameter("@IdTypeId", SqlDbType.TinyInt) { Value = IdTypeId });
        cmd.Parameters.Add(new SqlParameter("@NID", SqlDbType.NVarChar) { Value = NID });
        cmd.Parameters.Add(new SqlParameter("@NIDEndDate", SqlDbType.Date) { Value = NIDEndDate });
        cmd.Parameters.Add(new SqlParameter("@Street", SqlDbType.NVarChar) { Value = Street });
        cmd.Parameters.Add(new SqlParameter("@HomeNo", SqlDbType.NVarChar) { Value = HomeNo });
        cmd.Parameters.Add(new SqlParameter("@FlatNo", SqlDbType.NVarChar) { Value = FlatNo });
        cmd.Parameters.Add(new SqlParameter("@Area", SqlDbType.NVarChar) { Value = Area });
        cmd.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar) { Value = City });
        cmd.Parameters.Add(new SqlParameter("@GovId", SqlDbType.TinyInt) { Value = GovId });
        cmd.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.NVarChar) { Value = Mobile });
        cmd.Parameters.Add(new SqlParameter("@HomeTel", SqlDbType.NVarChar) { Value = HomeTel });
        cmd.Parameters.Add(new SqlParameter("@WorkTel", SqlDbType.NVarChar) { Value = WorkTel });
        cmd.Parameters.Add(new SqlParameter("@EMail", SqlDbType.NVarChar) { Value = EMail });
        cmd.Parameters.Add(new SqlParameter("@KidNO", SqlDbType.NVarChar) { Value = KidNO });
        cmd.Parameters.Add(new SqlParameter("@ContactTypeID", SqlDbType.TinyInt) { Value = ContactTypeID });
        cmd.Parameters.Add(new SqlParameter("@MemberImage", SqlDbType.NVarChar) { Value = MemberImage });
        cmd.Parameters.Add(new SqlParameter("@userin", SqlDbType.Int) { Value = TheSessions.UserID });
        cmd.Parameters.Add(new SqlParameter("@ReceiptNo", SqlDbType.NVarChar) { Value = ReceiptNo });
        cmd.Parameters.Add(new SqlParameter("@GehaId", SqlDbType.Int) { Value = GehaId });

        MC.InsertEmptyValue(ref cmd);

        try
        {
            cmd.CommandText = @"UPDATE TBLMembers SET
            SyndicateId = @SyndicateId, SubCommitteId = @SubCommitteId, MemberName = @MemberName, Bdate = @Bdate, GenderId = @GenderId, MaritalStatusId = @MaritalStatusId,
            IdTypeId = @IdTypeId, NID = @NID, NIDEndDate = @NIDEndDate, Street = @Street, HomeNo = @HomeNo, FlatNo = @FlatNo, Area = @Area, City = @City, GovId = @GovId, 
            Mobile = @Mobile, HomeTel = @HomeTel, WorkTel = @WorkTel, EMail = @EMail, KidNO = @KidNO, ContactTypeID = @ContactTypeID, MemberImage = @MemberImage,
            userin = @userin, datein = GETDATE(), ReceiptNo = @ReceiptNo, GehaId = @GehaId 
            WHERE MemberId = @MemberId";
            con.Open();
            cmd.ExecuteNonQuery();
            ReturnMe = true;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }

    public static bool UpdateTblMembersClosedField(object MemberId, object Closed)
    {
        bool ReturnMe = false;
        SqlConnection con = MC.ESchoolConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.Parameters.Add(new SqlParameter("@MemberId", SqlDbType.Int) { Value = MemberId });
        cmd.Parameters.Add(new SqlParameter("@Closed", SqlDbType.Bit) { Value = Closed });

        MC.InsertEmptyValue(ref cmd);
        try
        {
            cmd.CommandText = @"UPDATE TBLMembers SET Closed = @Closed WHERE MemberId = @MemberId";
            con.Open();
            cmd.ExecuteNonQuery();
            ReturnMe = true;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }

}