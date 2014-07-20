using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

/// <summary>
/// Summary description for MC
/// </summary>
public class MC
{
    // Paths
    public static string ReportURL = @"http://LOCALHOST:8081/ReportServer";
    public static string ReportPath = @"/StoreReport/";
    public static string FilesPath = "../Assets/Images/";
    public static string advetsFilesPath = "../Assets/advetsImages/";
    public MC()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static OleDbConnection Connection
    {
        get
        {
            OleDbConnection con = new OleDbConnection(ConnectionString());
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    static string ConnectionString()
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"~/App_Data/ETST.mdb");
        return constr;
    }
    public enum AppOptions
    {
        Options1
    }
    public static void InsertEmptyValue(ref OleDbCommand cmd)
    {
        foreach (OleDbParameter item in cmd.Parameters)
        {
            if (IsNullOrEmpty(item.Value))
            {
                if (item.OleDbType == OleDbType.Boolean)
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
    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
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
        OleDbConnection Con = Connection;
        OleDbCommand Cmd = new OleDbCommand("", Con);
        Cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", ColumnName, TableName.ToString());
        OleDbDataReader dr;
        try
        {
            Con.Open();
            dr = Cmd.ExecuteReader();
            if (dr.HasRows)
                dr.Read();
            ReturnMe = dr.GetValue(0).ToString();
        }
        catch (OleDbException ex)
        {
            // nothing here
            string x = ex.Message;
        }
        Con.Close();
        return ReturnMe;
    }//Get Unique New ID
    public static string GetOptionValue1(AppOptions AppOp)
    {
        string ReturnMe = "0";
        OleDbConnection con = Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
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
        OleDbConnection con = Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
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
        catch (OleDbException ex)
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
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed, renew, MemberSyndicateId
          FROM [TBLMembers]
        ", false);
        }
        else
        {
            return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[Bdate] ,[GenderId] ,[MaritalStatusId] ,[IdTypeId] ,[NID] ,[NIDEndDate] ,[Street]
              ,[HomeNo] ,[FlatNo] ,[Area] ,[City] ,[GovId] ,[Mobile] ,[HomeTel] ,[WorkTel] ,[EMail] ,[KidNO] ,[ContactTypeID] ,[MemberImage]
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed, renew, MemberSyndicateId
          FROM [TBLMembers]
          WHERE MemberId = 
        " + MemberId, false);
        }
        
    }
    public static DataTable SelectOldTBLMembers(object MemberId = null)
    {
        if (MemberId == null)
        {
            return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[Bdate] ,[GenderId] ,[MaritalStatusId] ,[IdTypeId] ,[NID] ,[NIDEndDate] ,[Street]
              ,[HomeNo] ,[FlatNo] ,[Area] ,[City] ,[GovId] ,[Mobile] ,[HomeTel] ,[WorkTel] ,[EMail] ,[KidNO] ,[ContactTypeID] ,[MemberImage]
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed
          FROM [OldTBLMembers]
        ", false);
        }
        else
        {
            return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[Bdate] ,[GenderId] ,[MaritalStatusId] ,[IdTypeId] ,[NID] ,[NIDEndDate] ,[Street]
              ,[HomeNo] ,[FlatNo] ,[Area] ,[City] ,[GovId] ,[Mobile] ,[HomeTel] ,[WorkTel] ,[EMail] ,[KidNO] ,[ContactTypeID] ,[MemberImage]
              ,[userin] ,[datein], ReceiptNo, GehaId, Closed
          FROM [OldTBLMembers]
          WHERE MemberId = 
        " + MemberId, false);
        }

    }
    
    public static object InsertTBLMembers(object SyndicateId, object SubCommitteId, object MemberName, object Bdate, object GenderId, object MaritalStatusId, object IdTypeId, 
        object NID, object NIDEndDate, object Street, object HomeNo, object FlatNo, object Area, object City, object GovId, object Mobile, object HomeTel, object WorkTel,
        object EMail, object KidNO, object ContactTypeID, object MemberImage, object ReceiptNo, object GehaId, object renew, object MemberSyndicateId)
    {

        object ReturnMe = MC.GetNewID("TBLMembers", "MemberId");

        dsETST ds = new dsETST();
        dsETSTTableAdapters.TBLMembersTableAdapter adp = new dsETSTTableAdapters.TBLMembersTableAdapter();
        dsETST.TBLMembersRow row = ds.TBLMembers.NewTBLMembersRow();
        
        row.MemberId = Convert.ToDecimal(ReturnMe);
        if (!IsNullOrEmpty(SyndicateId))
            row.SyndicateId = Convert.ToInt32(SyndicateId);
        if (!IsNullOrEmpty(MemberSyndicateId))
            row.MemberSyndicateId = Convert.ToInt32(MemberSyndicateId);
        if (!IsNullOrEmpty(SubCommitteId))
            row.SubCommitteId = Convert.ToInt32(SubCommitteId);
        row.MemberName = MemberName.ToString();
        if (!IsNullOrEmpty(Bdate))
            row.Bdate = Convert.ToDateTime(Bdate);
        if (!IsNullOrEmpty(GenderId))
            row.GenderId = Convert.ToByte(GenderId);
        if (!IsNullOrEmpty(MaritalStatusId))
            row.MaritalStatusId = Convert.ToByte(MaritalStatusId);
        if (!IsNullOrEmpty(IdTypeId))
            row.IdTypeId = Convert.ToByte(IdTypeId);
        if (!IsNullOrEmpty(NID))
            row.NID = NID.ToString();
        if (!IsNullOrEmpty(NIDEndDate))
            row.NIDEndDate = Convert.ToDateTime(NIDEndDate);
        if (!IsNullOrEmpty(Street))
            row.Street = Street.ToString();
        if (!IsNullOrEmpty(HomeNo))
            row.HomeNo = HomeNo.ToString();
        if (!IsNullOrEmpty(FlatNo))
            row.FlatNo = FlatNo.ToString();
        if (!IsNullOrEmpty(Area))
            row.Area = Area.ToString();
        if (!IsNullOrEmpty(City))
            row.City = City.ToString();
        if (!IsNullOrEmpty(GovId))
            row.GovId = Convert.ToByte(GovId);
        if (!IsNullOrEmpty(Mobile))
            row.Mobile = Mobile.ToString();
        if (!IsNullOrEmpty(HomeTel))
            row.HomeTel = HomeTel.ToString();
        if (!IsNullOrEmpty(WorkTel))
            row.WorkTel = WorkTel.ToString();
        if (!IsNullOrEmpty(WorkTel))
            row.WorkTel = WorkTel.ToString();
        if (!IsNullOrEmpty(KidNO))
            row.KidNO = Convert.ToInt32(KidNO);
        if (!IsNullOrEmpty(ContactTypeID))
            row.ContactTypeID = Convert.ToByte(ContactTypeID);
        if (!IsNullOrEmpty(MemberImage))
            row.MemberImage = MemberImage.ToString();
        if (!IsNullOrEmpty(ReceiptNo))
        {
            row.ReceiptNo = Convert.ToInt32(ReceiptNo);
        }
        if (!IsNullOrEmpty(renew))
            row.renew = Convert.ToBoolean(renew);
        row.userin = Convert.ToInt32(TheSessions.UserID);
        row.datein = DateTime.UtcNow.AddHours(2);
        if (!IsNullOrEmpty(GehaId))
            row.GehaId = Convert.ToByte(GehaId);
        try
        {
            ds.TBLMembers.AddTBLMembersRow(row);
            row.EndEdit();
            adp.Update(ds.TBLMembers);
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return ReturnMe;
    }
   
    public static bool UpdateTBLMembers(object MemberId, object SyndicateId, object SubCommitteId, object MemberName, object Bdate, object GenderId, object MaritalStatusId, object IdTypeId,
        object NID, object NIDEndDate, object Street, object HomeNo, object FlatNo, object Area, object City, object GovId, object Mobile, object HomeTel, object WorkTel,
        object EMail, object KidNO, object ContactTypeID, object MemberImage, object ReceiptNo, object GehaId, object renew, object MemberSyndicateId)
    {
        bool ReturnMe = false;


        dsETST ds = new dsETST();
        dsETSTTableAdapters.TBLMembersTableAdapter adp = new dsETSTTableAdapters.TBLMembersTableAdapter();
        adp.FillByMemberId(ds.TBLMembers, Convert.ToDecimal(MemberId));
        dsETST.TBLMembersRow row = ds.TBLMembers[0];

        if (!IsNullOrEmpty(SyndicateId))
            row.SyndicateId = Convert.ToInt32(SyndicateId);
        if (!IsNullOrEmpty(MemberSyndicateId))
            row.MemberSyndicateId = Convert.ToInt32(MemberSyndicateId);
        if (!IsNullOrEmpty(SubCommitteId))
            row.SubCommitteId = Convert.ToInt32(SubCommitteId);
        row.MemberName = MemberName.ToString();
        if (!IsNullOrEmpty(Bdate))
            row.Bdate = Convert.ToDateTime(Bdate);
        if (!IsNullOrEmpty(GenderId))
            row.GenderId = Convert.ToByte(GenderId);
        if (!IsNullOrEmpty(MaritalStatusId))
            row.MaritalStatusId = Convert.ToByte(MaritalStatusId);
        if (!IsNullOrEmpty(IdTypeId))
            row.IdTypeId = Convert.ToByte(IdTypeId);
        if (!IsNullOrEmpty(NID))
            row.NID = NID.ToString();
        if (!IsNullOrEmpty(NIDEndDate))
            row.NIDEndDate = Convert.ToDateTime(NIDEndDate);
        if (!IsNullOrEmpty(Street))
            row.Street = Street.ToString();
        if (!IsNullOrEmpty(HomeNo))
            row.HomeNo = HomeNo.ToString();
        if (!IsNullOrEmpty(FlatNo))
            row.FlatNo = FlatNo.ToString();
        if (!IsNullOrEmpty(Area))
            row.Area = Area.ToString();
        if (!IsNullOrEmpty(FlatNo))
            row.City = City.ToString();
        if (!IsNullOrEmpty(GovId))
            row.GovId = Convert.ToByte(GovId);
        if (!IsNullOrEmpty(Mobile))
            row.Mobile = Mobile.ToString();
        if (!IsNullOrEmpty(HomeTel))
            row.HomeTel = HomeTel.ToString();
        if (!IsNullOrEmpty(WorkTel))
            row.WorkTel = WorkTel.ToString();
        if (!IsNullOrEmpty(EMail))
            row.EMail = EMail.ToString();
        if (!IsNullOrEmpty(KidNO))
            row.KidNO = Convert.ToInt32(KidNO);
        if (!IsNullOrEmpty(ContactTypeID))
            row.ContactTypeID = Convert.ToByte(ContactTypeID);
        if (!IsNullOrEmpty(MemberImage))
            row.MemberImage = MemberImage.ToString();
        if (!IsNullOrEmpty(ReceiptNo))
            row.ReceiptNo = Convert.ToInt32(ReceiptNo);
        if (!IsNullOrEmpty(GehaId))
            row.GehaId = Convert.ToInt32(GehaId);
        if (!IsNullOrEmpty(renew))
            row.renew = Convert.ToBoolean(renew);
        try
        {
            row.EndEdit();
            adp.Update(ds.TBLMembers);
            ReturnMe = true;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return ReturnMe;
    }

    public static bool UpdateTblMembersClosedField(object MemberId, object Closed)
    {
        bool ReturnMe = false;
        OleDbConnection con = Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        cmd.Parameters.Add(new OleDbParameter("@MemberId", OleDbType.Integer) { Value = MemberId });
        cmd.Parameters.Add(new OleDbParameter("@Closed", OleDbType.Boolean) { Value = Closed });

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