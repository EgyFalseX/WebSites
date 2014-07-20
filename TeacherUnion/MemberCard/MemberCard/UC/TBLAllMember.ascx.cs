using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class TBLAllMember : System.Web.UI.UserControl
{

    private void CLearForm()
    {
        if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType)
        {
            cbSyndicateId.Value = sessionMemberCard.SyndicateId;
            cbSubCommitteId.Value = sessionMemberCard.SubCommitteId;
        }
        else
        {
            cbSyndicateId.Value = null;
            cbSubCommitteId.Value = null;
        }
       
        cbmembertypeid.Value = null;
        tbMemberName.Value = null;
        deBirthDate.Value = null;
        cbQualtypeId.Value = null;
        cbJobtitleID.Value = null;
        deWorkeDate.Value = null;
        dekasmDate.Value = null;
        HFImg.Value = string.Empty;
        myImg.ImageUrl = string.Empty;
    }
    private void LoadInfo(object MemberId)
    {
        DataTable dt = SelectTBLMembers(MemberId);
        if (dt.Rows.Count == 0)
            Response.Redirect(Request.Url.ToString());

        DataRow row = dt.Rows[0];

        if ((bool)row["closed"] == true && !sessionMemberCard.IsAdmin)
            Response.Redirect("~/MemberCard/");

        cbSyndicateId.Value = row["SyndicateId"].ToString();
        cbSubCommitteId.Value = row["SubCommitteId"].ToString();
        cbmembertypeid.Value = row["membertypeid"].ToString();
        tbMemberName.Value = row["MemberName"];
        tbmnid.Value = row["mnid"];
        deBirthDate.Value = row["BirthDate"];
        cbQualtypeId.Value = row["QualtypeId"].ToString();
        cbJobtitleID.Value = row["JobtitleID"].ToString();
        deWorkeDate.Value = row["WorkeDate"];
        dekasmDate.Value = row["kasmDate"];
        HFImg.Value = row["imagepath"].ToString();
        myImg.ImageUrl = mcMemberCard.FilesPath + row["imagepath"];
 
    }

    static string ConnectionStr(string DataBaseName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"~/App_Data/" + DataBaseName);
        return constr;
    }
    public static OleDbConnection DBConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr("MemberCard.mdb"));
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }//oledb connection object

    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, DBConnection))
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
            catch (OleDbException) { }
        }

        return ReturnMe;
    }//Load Table From Database

    public static string GetNewID(string TableName, string ColumnName)
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = DBConnection;
        OleDbCommand cmd = new OleDbCommand("", con);

        cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", ColumnName, TableName.ToString());
        OleDbDataReader dr;
        try
        {
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
                dr.Read();
            ReturnMe = dr.GetValue(0).ToString();
        }
        catch (OleDbException ex)
        {
            // nothing here
            string x = ex.Message;
        }
        con.Close();
        return ReturnMe;
    }//Get Unique New ID

    public static DataTable SelectTBLMembers(object MemberId = null)
    {
        if (MemberId == null)
        {
            return LoadDataTable(@"SELECT [MemberId]
            ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[BirthDate] ,[JobtitleID] ,[WorkeDate] ,[QualtypeId] ,[kasmDate] ,[imagepath], closed, [membertypeid], mnid
            FROM [TBLAllMember]
        ", false);
        }
        else
        {
            return LoadDataTable(@"SELECT [MemberId]
              ,[SyndicateId] ,[SubCommitteId] ,[MemberName] ,[BirthDate] ,[JobtitleID] ,[WorkeDate] ,[QualtypeId] ,[kasmDate] ,[imagepath], closed, [membertypeid], mnid
              FROM [TBLAllMember]
              WHERE MemberId = 
        " + MemberId, false);
        }

    }

    public static object InsertTBLMembers(object SyndicateId, object SubCommitteId, object membertypeid, object MemberName, object BirthDate, object JobtitleID,
        object WorkeDate, object QualtypeId, object kasmDate, object imagepath, object mnid)
    {
        object ReturnMe = null;
        OleDbConnection con = DBConnection;
        OleDbCommand cmd = new OleDbCommand("", con);

        cmd.Parameters.Add(new OleDbParameter("@SyndicateId", OleDbType.Integer) { Value = SyndicateId });
        cmd.Parameters.Add(new OleDbParameter("@SubCommitteId", OleDbType.Integer) { Value = SubCommitteId });
        cmd.Parameters.Add(new OleDbParameter("@membertypeid", OleDbType.Integer) { Value = membertypeid });
        cmd.Parameters.Add(new OleDbParameter("@MemberName", OleDbType.WChar) { Value = MemberName });
        cmd.Parameters.Add(new OleDbParameter("@BirthDate", OleDbType.Date) { Value = BirthDate });
        cmd.Parameters.Add(new OleDbParameter("@JobtitleID", OleDbType.Integer) { Value = JobtitleID });
        cmd.Parameters.Add(new OleDbParameter("@WorkeDate", OleDbType.Date) { Value = WorkeDate });
        cmd.Parameters.Add(new OleDbParameter("@QualtypeId", OleDbType.Integer) { Value = QualtypeId });
        cmd.Parameters.Add(new OleDbParameter("@kasmDate", OleDbType.Date) { Value = kasmDate });
        cmd.Parameters.Add(new OleDbParameter("@imagepath", OleDbType.WChar) { Value = imagepath });
        cmd.Parameters.Add(new OleDbParameter("@userin", OleDbType.Integer) { Value = sessionMemberCard.UserID });
        cmd.Parameters.Add(new OleDbParameter("@mnid", OleDbType.WChar) { Value = mnid });

        //mcMemberCard.InsertEmptyValue(ref cmd);
        ReturnMe = GetNewID("TBLAllMember", "MemberId");
        try
        {
            con.Open();

            //cmd.Parameters.Add(new OleDbParameter("@MemberId", OleDbType.Integer) { Value = ReturnMe });

            cmd.CommandText = @"INSERT INTO TBLAllMember
            (SyndicateId, SubCommitteId, membertypeid, MemberName, BirthDate, JobtitleID, WorkeDate, QualtypeId, kasmDate, imagepath, userin, datein, mnid)
            VALUES 
            (@SyndicateId, @SubCommitteId, @membertypeid, @MemberName, @BirthDate, @JobtitleID, @WorkeDate, @QualtypeId, @kasmDate, @imagepath, @userin, DATE(), @mnid)";
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }

    public static bool UpdateTBLMembers(object MemberId, object SyndicateId, object SubCommitteId, object membertypeid, object MemberName, object BirthDate, object JobtitleID,
        object WorkeDate, object QualtypeId, object kasmDate, object imagepath, object mnid)
    {
        bool ReturnMe = false;
        OleDbConnection con = DBConnection;
        OleDbCommand cmd = new OleDbCommand("", con);

        cmd.Parameters.Add(new OleDbParameter("@SyndicateId", OleDbType.Integer) { Value = SyndicateId });
        cmd.Parameters.Add(new OleDbParameter("@SubCommitteId", OleDbType.Integer) { Value = SubCommitteId });
        cmd.Parameters.Add(new OleDbParameter("@membertypeid", OleDbType.Integer) { Value = membertypeid });
        cmd.Parameters.Add(new OleDbParameter("@MemberName", OleDbType.WChar) { Value = MemberName });
        cmd.Parameters.Add(new OleDbParameter("@BirthDate", OleDbType.Date) { Value = BirthDate });
        cmd.Parameters.Add(new OleDbParameter("@JobtitleID", OleDbType.Integer) { Value = JobtitleID });
        cmd.Parameters.Add(new OleDbParameter("@QualtypeId", OleDbType.Integer) { Value = QualtypeId });
        cmd.Parameters.Add(new OleDbParameter("@WorkeDate", OleDbType.Date) { Value = WorkeDate });
        cmd.Parameters.Add(new OleDbParameter("@kasmDate", OleDbType.Date) { Value = kasmDate });
        cmd.Parameters.Add(new OleDbParameter("@imagepath", OleDbType.WChar) { Value = imagepath });
        cmd.Parameters.Add(new OleDbParameter("@userin", OleDbType.Integer) { Value = sessionMemberCard.UserID });
        cmd.Parameters.Add(new OleDbParameter("@mnid", OleDbType.WChar) { Value = mnid });
        cmd.Parameters.Add(new OleDbParameter("@MemberId", OleDbType.Integer) { Value = MemberId });

        //mcMemberCard.InsertEmptyValue(ref cmd);

        try
        {
            cmd.CommandText = @"UPDATE TBLAllMember SET 
            SyndicateId = @SyndicateId, SubCommitteId = @SubCommitteId, membertypeid = @membertypeid, 
            MemberName = @MemberName, BirthDate = @BirthDate, 
            JobtitleID = @JobtitleID,  QualtypeId = @QualtypeId, 
            WorkeDate = @WorkeDate, kasmDate = @kasmDate, 
            imagepath = @imagepath, userin = @userin, datein = DATE(), mnid = @mnid
            WHERE MemberId = @MemberId";
            con.Open();
            cmd.ExecuteNonQuery();
            ReturnMe = true;
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["mm"] != null)
        {
            if (!IsPostBack)
            {
                LoadInfo(Request.QueryString["mm"]);
            }
            ASPxPageControl1.TabPages[1].Visible = true;
            ASPxPageControl1.TabPages[1].Enabled = true;
        }
        else
        {
            ASPxPageControl1.TabPages[1].Visible = false;
            ASPxPageControl1.TabPages[1].Enabled = false;
        }
        if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType)
        {
            cbSyndicateId.Enabled = false;
            cbSubCommitteId.Enabled = false;
            cbSyndicateId.Value = sessionMemberCard.SyndicateId;
            cbSubCommitteId.Value = sessionMemberCard.SubCommitteId;
        }
        else
        {
            cbSyndicateId.Enabled = true;
            cbSubCommitteId.Enabled = true;
        }
    }
    protected void DSSyndicateId_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (sessionMemberCard.IsAdmin)
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        }
        else
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + sessionMemberCard.SyndicateId;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        List<object> ID = IDExtraction(tbmnid.Value.ToString());
        //if (CalcAge(Convert.ToDateTime(ID[1])) >= 45 && cbNewMember.Checked)
        //{
        //    ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "يجب ادخال العمر اصغر من 45 سنة";
        //    return;
        //}

        if (!FU.HasFile && mcMemberCard.IsNullOrEmpty(Request.QueryString["mm"]))
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "يجب ادخال الصورة";
            return;
        }
        else
        {
            if (FU.FileBytes.Length > 51200)
            {
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "الصورة اكبر من 50 كيلوبايت";
                return;
            }
        }
        if (tbmnid.Value.ToString().Length != 14)
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "يجب ادخال 14 رقم في الرقم القومي";
            return;
        }
        string FName = string.Empty;
        try
        {
            
            if (FU.HasFile)
            {
                FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);
                FU.SaveAs(MapPath(mcMemberCard.FilesPath) + FName);
            }
            if (mcMemberCard.IsNullOrEmpty(Request.QueryString["mm"]))
            {
                object mm = InsertTBLMembers(cbSyndicateId.Value, cbSubCommitteId.Value, cbmembertypeid.Value, tbMemberName.Value, deBirthDate.Value,
                    cbJobtitleID.Value, deWorkeDate.Value, cbQualtypeId.Value, dekasmDate.Value, FName, tbmnid.Value);
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الاضافه";
                Response.Redirect(String.Format("{0}?mm={1}", Request.Url, mm));
            }
            else
            {
                if (!FU.HasFile)
                    FName = HFImg.Value;
                UpdateTBLMembers(Request.QueryString["mm"], cbSyndicateId.Value, cbSubCommitteId.Value, cbmembertypeid.Value, tbMemberName.Value, 
                    deBirthDate.Value, cbJobtitleID.Value, deWorkeDate.Value, cbQualtypeId.Value, dekasmDate.Value, FName, tbmnid.Value);

                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم التعديل";
            }
        }
        catch (SqlException ex)
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = ex.Message;
        }
        
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        CLearForm();
    }
    protected void GVEditor_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الاضـــافه ...";

    }
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم التعــــديل ...";

    }
    protected void GVEditor_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الحـــذف ...";
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("TBLAllMember.aspx");
    }

    public static int CalcAge(DateTime birthdate)
    {
        DateTime today = DateTime.Today;
        int age = today.Year - birthdate.Year;
        if (birthdate > today.AddYears(-age)) age--;
        return age;
    }
    public static List<object> IDExtraction(string ID)
    {
        List<object> outPut = new List<object>();

        float Type = Convert.ToInt32(ID.ToString().Substring(12, 1));
        if ((Type % 2) == 0)
            outPut.Add(2);//female
        else
            outPut.Add(1);//male

        //get birth day
        int day = Convert.ToInt32(ID.ToString().Substring(5, 2));
        int month = Convert.ToInt32(ID.ToString().Substring(3, 2));
        int year = 0;
        if (ID.ToString().Substring(0, 1) == "2")
            year += Convert.ToInt32("19" + ID.ToString().Substring(1, 2));
        else
            year += Convert.ToInt32("20" + ID.ToString().Substring(1, 2));
        outPut.Add(new DateTime(year, month, day));

        //get the birth state
        outPut.Add(Convert.ToInt32(ID.ToString().Substring(7, 2)));

        return outPut;
    }

}