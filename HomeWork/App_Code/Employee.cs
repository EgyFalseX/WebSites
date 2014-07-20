using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Data.OleDb;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
	public Employee()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetData(string Cells)
    {

        OleDbCommand com = new OleDbCommand("select " + Cells + " from »Ì«‰« _«·„ÊŸ›Ì‰_»«·„œ—Ì… where CODE = @CODE", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@CODE", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        com.Connection.Close();
        return dt;

    }
    public DataTable GetData()
    {

        OleDbCommand com = new OleDbCommand("select * from »Ì«‰« _«·„ÊŸ›Ì‰_»«·„œ—Ì… where CODE = @CODE", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@CODE", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        com.Connection.Close();
        return dt;

    }
    public string GetGender()
    {

        OleDbCommand com = new OleDbCommand("select SEX from »Ì«‰« _«·„ÊŸ›Ì‰_»«·„œ—Ì… where CODE = @CODE", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@CODE", TheSessions.EmploeeID);
        com.Connection.Open();
        string gen = com.ExecuteScalar().ToString();
        com.Connection.Close(); return gen;

    }
    public DataTable Hierarchy()
    {
        OleDbCommand com = new OleDbCommand("select * from «· ”·”·_«·ÊŸÌ›Ï where code =@code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable TrainingProgramms()
    {
        OleDbCommand com = new OleDbCommand("select * from «·»—«„Ã_«· œ—Ì»Ì… where code =@code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable Degree()
    {
        OleDbCommand com = new OleDbCommand("select * from  ”·”·_«·œ—Ã«  where code =@code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable AnnualReports()
    {
        OleDbCommand com = new OleDbCommand("select * from «· ﬁ«—Ì—_«·”‰ÊÌ… where code =@code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code",TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable Delay()
    {
        OleDbCommand com = new OleDbCommand("select * from «· √ŒÌ—  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Holiday()
    {
        OleDbCommand com = new OleDbCommand("select * from «·«Ã«“« _«·Œ«’…  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Loans()
    {
        OleDbCommand com = new OleDbCommand("select * from «·«⁄«—« _«·œ«Œ·Ì…Ê«·Œ«—ÃÌ…  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Permissions()
    {
        OleDbCommand com = new OleDbCommand("select * from «·«” √–«‰  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Punishment()
    {
        OleDbCommand com = new OleDbCommand("select * from «·Ã“«¡« _Ê«·⁄ﬁÊ»«   where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Qualifieds()
    {
        OleDbCommand com = new OleDbCommand("select * from «·„ƒÂ·«   where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Salary()
    {
        OleDbCommand com = new OleDbCommand("select * from «·„— »« _«·‘Â—Ì…  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code",TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
    }
    public DataTable Absence()
    {
        OleDbCommand com = new OleDbCommand("select * from «·«Ã«“« _«·Œ«’…  where code =@code ", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public string GetEmpFullhName(int EID)
    {
        string Name = string.Empty;
        OleDbCommand com = new OleDbCommand("select NAME  from  »Ì«‰« _«·„ÊŸ›Ì‰_»«·„œ—Ì… where CODE  = @Code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@Code", EID);
        closconnection(com.Connection);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
             Name= com.ExecuteScalar().ToString();
             com.Connection.Close();
             return Name;
            
        }
        else
            return "";

    }
    public string GetEmpPicture(int EID)
    {
        string Name = string.Empty;
        OleDbCommand com = new OleDbCommand("select image  from  »Ì«‰« _«·„ÊŸ›Ì‰_»«·„œ—Ì… where CODE  = @Code", MySchool.MalafatConnection);
        com.Parameters.AddWithValue("@Code", EID);
        closconnection(com.Connection);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            Name = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return Name;
        }
        else
            return "";

    }
    public void insertHomeWork( HomeWorkClass PC)
    {
        OleDbCommand com = new OleDbCommand("insert into home_work" + "(SPOS,code,asase_code,alsofof_code,fasl_code,hasa_code,mawad_no,daycode,read_code,home_work,add_date)" + "VALUES ( ?, ? ,? , ? , ? ,? , ? , ? ,? , ?, ?)", MySchool.HomeWorkConnection);
        com.CommandType = CommandType.Text;
        
        com.Parameters.AddWithValue("SPOS", PC.School);
        com.Parameters.AddWithValue("code", PC.Code);
        com.Parameters.AddWithValue("asase_code", PC.Asase_code);
        com.Parameters.AddWithValue("alsofof_code", PC.Alsofof_Code);
        com.Parameters.AddWithValue("fasl_code", PC.Fasl_code);
        com.Parameters.AddWithValue("hasa_code", PC.Hasa_code);
        com.Parameters.AddWithValue("mawad_no", PC.Mawad_no);
        com.Parameters.AddWithValue("daycode", PC.Daycode);
        com.Parameters.AddWithValue("read_code", PC.Read_code);
        com.Parameters.AddWithValue("home_work", PC.Home_work);
        com.Parameters.AddWithValue("add_date", PC.Add_date);

        com.Connection.Open();
        com.ExecuteNonQuery();
        com.Connection.Close();

    }
    public void insertHomeWorkForAstudent(SHWClass SHW)
    {
        OleDbCommand com = new OleDbCommand("insert into st_wagep" + "(SPOS,asase_code,hasa_code,mawad_no,add_date,code,home_work,read_code,stu_code)" + "VALUES ( ? , ? , ? ,? , ? , ? ,? , ?, ?)", MySchool.HomeWorkConnection);
        com.CommandType = CommandType.Text;

        com.Parameters.AddWithValue("SPOS", SHW.School);
        com.Parameters.AddWithValue("asase_code", SHW.Asase_code);
        com.Parameters.AddWithValue("hasa_code", SHW.Hasa_code);
        com.Parameters.AddWithValue("mawad_no", SHW.Mawad_no);
        com.Parameters.AddWithValue("add_date", SHW.Add_date);
        com.Parameters.AddWithValue("code", SHW.Code);
        com.Parameters.AddWithValue("home_work", SHW.Home_work);
        com.Parameters.AddWithValue("read_code", SHW.Read_code);
        com.Parameters.AddWithValue("stu_code", SHW.Stu_Code);

        com.Connection.Open();
        com.ExecuteNonQuery();
        com.Connection.Close();

    }
    public void insertMotabaaForAstudent(MotabaaClass SM)
    {
        OleDbCommand com = new OleDbCommand("insert into motapa" + "(stu_code,CODE,asase_code,SPOS,add_date,title,notice,reply_code,reply)" + "VALUES ( ? , ? , ? ,? , ? , ? ,? , ?, ?)", MySchool.HomeWorkConnection);
        com.CommandType = CommandType.Text;

        com.Parameters.AddWithValue("stu_code", SM.Stu_Code);
        com.Parameters.AddWithValue("CODE", SM.Code);
        com.Parameters.AddWithValue("asase_code", SM.Asase_code);
        com.Parameters.AddWithValue("SPOS", SM.School);
        com.Parameters.AddWithValue("add_date", SM.Add_date);
        com.Parameters.AddWithValue("title", SM.Title);
        com.Parameters.AddWithValue("notice", SM.Notice);
        com.Parameters.AddWithValue("reply_code", SM.ReplyCode);
        com.Parameters.AddWithValue("reply", SM.Reply);
        

        com.Connection.Open();
        com.ExecuteNonQuery();
        com.Connection.Close();

    }
    public DataTable GetAllClassess()
    {
        OleDbCommand com = new OleDbCommand("select * from fasl ", MySchool.TheCodesConnection);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
 
    }
    public DataTable GetAllClassessForSaf(int SafID )
    {
        OleDbCommand com = new OleDbCommand("select fasl_code from gadwal_alhasas where alsofof_code=@alsofof_code", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@alsofof_code", SafID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        
        //////------------------------
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;
        //DataTable dt = new DataTable();
        //dt.Columns.Add(new DataColumn("id"));
        //dt.Columns.Add(new DataColumn("name"));
        //DataRow drw = dt.NewRow();
        //OleDbDataReader dr= com;
        //while(dr.Read())
        //{
        //    drw["id"] = dr["mawad_id"];
        //    drw["name"] = new Codes().SubjectName(Convert.ToInt32(dr["mawad_id"]));
        //}

    }
    public DropDownList GetSafForEmp(int EmpID, DropDownList dlist)
    {
       
        OleDbCommand com = new OleDbCommand("SELECT DISTINCT gadwal_alhasas.alsofof_code FROM gadwal_alhasas WHERE (((gadwal_alhasas.CODE)=@CODE))", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@CODE", EmpID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        Codes cd = new Codes();
        ListItem li;
        dlist.Items.Clear();
        dlist.Items.Add(new ListItem ("«Œ — «·’›.............","0"));
        while (DR.Read())
        {
           string s= cd.StageName(Convert.ToInt32(DR["alsofof_code"]));
           li = new ListItem(s, DR["alsofof_code"].ToString());
           dlist.Items.Add(li);
        }
        com.Connection.Close();
        return dlist;
    }
    public DropDownList GetFaslForSaf(int EmpID,int SafID, DropDownList dlist)
    {

        OleDbCommand com = new OleDbCommand("SELECT DISTINCT gadwal_alhasas.fasl_code FROM gadwal_alhasas WHERE CODE=@CODE and alsofof_code=@alsofof_code", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@CODE", EmpID);
        com.Parameters.AddWithValue("@alsofof_code", SafID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        Codes cd = new Codes();
        ListItem li;
        dlist.Items.Clear();
        dlist.Items.Add(new ListItem ("«Œ — «·›’· .......","0"));
        while (DR.Read())
        {
            string s = cd.ClassName(Convert.ToInt32(DR["fasl_code"]));
            li = new ListItem(s, DR["fasl_code"].ToString());
            dlist.Items.Add(li);
        }
        com.Connection.Close();
        return dlist;
    }
    public DropDownList GetMadahForFasl(int EmpID, int SafID,int FaslID, DropDownList dlist)
    {

        OleDbCommand com = new OleDbCommand("SELECT DISTINCT gadwal_alhasas.mawad_no FROM gadwal_alhasas WHERE CODE=@CODE and alsofof_code=@alsofof_code and fasl_code=@fasl_code", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@CODE", EmpID);
        com.Parameters.AddWithValue("@alsofof_code", SafID);
        com.Parameters.AddWithValue("@fasl_code", FaslID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        Codes cd = new Codes();
        ListItem li;
        dlist.Items.Clear();
        dlist.Items.Add(new ListItem ( "«Œ — «·„«œ….............","0"));
        while (DR.Read())
        {
            string s = cd.SubjectName(Convert.ToInt32(DR["mawad_no"]));
            li = new ListItem(s, DR["mawad_no"].ToString());
            dlist.Items.Add(li);
        }
        com.Connection.Close();
        return dlist;
    }
    public DropDownList GetHesaForMadah(int EmpID, int SafID, int FaslID, int MadaID, DropDownList dlist)
    {
        OleDbCommand com = new OleDbCommand("SELECT DISTINCT gadwal_alhasas.hasa_code FROM gadwal_alhasas WHERE CODE=@CODE and alsofof_code=@alsofof_code and fasl_code=@fasl_code and mawad_no=@mawad_no", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@CODE", EmpID);
        com.Parameters.AddWithValue("@alsofof_code", SafID);
        com.Parameters.AddWithValue("@fasl_code", FaslID);
        com.Parameters.AddWithValue("@mawad_no", MadaID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        Codes cd = new Codes();
        ListItem li;
        dlist.Items.Clear();
        dlist.Items.Add( new ListItem ("«Œ — «·Õ’….............","0"));
        while (DR.Read())
        {
            string s = cd.SessionName(Convert.ToInt32(DR["hasa_code"]));
            li = new ListItem(s, DR["hasa_code"].ToString());
            dlist.Items.Add(li);
        }
        com.Connection.Close();
        return dlist;
    }
    public DropDownList GetStudentsForFasl( int SafID, int FaslID, DropDownList dlist)
    {

        OleDbCommand com = new OleDbCommand("SELECT DISTINCT stu_code FROM student_t WHERE  alsofof_code=@alsofof_code and fasl_code=@fasl_code", MySchool.StudentConnection);
       
        com.Parameters.AddWithValue("@alsofof_code", SafID);
        com.Parameters.AddWithValue("@fasl_code", FaslID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        Codes cd = new Codes();
        ListItem li;
        dlist.Items.Clear();
        dlist.Items.Add(new ListItem("«Œ — «”„ «· ·„Ì–.........","0"));
        while (DR.Read())
        {
            string s = cd.StudentName(Convert.ToInt32(DR["stu_code"]));
            li = new ListItem(s, DR["stu_code"].ToString());
            dlist.Items.Add(li);
        }
        com.Connection.Close();
        return dlist;
    }
    public DataTable GetAllSofofForEmp()
    {
        OleDbCommand com = new OleDbCommand("select distinct alsofof_code from modaresen_almawad where CODE=?", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("CODE", 146002011);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        com.Connection.Close();
        return dt;

    }
    public DataTable GetAllSofof()
    {
        OleDbCommand com = new OleDbCommand("select * from alsofof ", MySchool.TheCodesConnection);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllHesas()
    {
        OleDbCommand com = new OleDbCommand("select * from alhasas ", MySchool.TheCodesConnection);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllMawad()
    {
        OleDbCommand com = new OleDbCommand("select * from mawad ", MySchool.TheCodesConnection);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllHomeWorks()
    {
        OleDbCommand com = new OleDbCommand("select * from home_work where code=@code", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("@code", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllHomeWorksForAstudent(int StudID)
    {
        OleDbCommand com = new OleDbCommand("select * from st_wagep where code=? and stu_code=?", MySchool.HomeWorkConnection);
        com.CommandType = CommandType.Text;
        com.Parameters.AddWithValue("code", TheSessions.EmploeeID);
        com.Parameters.AddWithValue("stu_code",StudID);

        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllHWToday(DateTime Day)
    {
        OleDbCommand com = new OleDbCommand("select * from home_work where code=? and add_date=@add_date", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("code", TheSessions.EmploeeID);
        com.Parameters.AddWithValue("@add_date", Day);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllHWTodayForAstudent(DateTime Day ,int SID)
    {
        OleDbCommand com = new OleDbCommand("select * from st_wagep where code=? and add_date=@add_date and stu_code=@stu_code", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("code", TheSessions.EmploeeID);
        com.Parameters.AddWithValue("@add_date", Day);
        com.Parameters.AddWithValue("@stu_code", SID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllstudents()
    {
        OleDbCommand com = new OleDbCommand("select stu_code,stu_name from student ", MySchool.StudentConnection);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllMotabaa()
    {
        
        OleDbCommand com = new OleDbCommand("select * from motapa where CODE= @CODE ", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("@CODE", TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllReadMotabaa()
    {
        OleDbCommand com = new OleDbCommand("select * from motapa where CODE=? and reply_code=1", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("CODE",  TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllUnReadMotabaa()
    {
        OleDbCommand com = new OleDbCommand("select * from motapa where CODE=? and reply_code=2", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("CODE",  TheSessions.EmploeeID);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    public DataTable GetAllMotabaaForAday(DateTime Day)
    {
        OleDbCommand com = new OleDbCommand("select * from motapa where CODE=? and add_date=@add_date", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("CODE",  TheSessions.EmploeeID);
        com.Parameters.AddWithValue("@add_date", Day);
        com.Connection.Open();
        OleDbDataReader DR = com.ExecuteReader();
        DataTable DT = new DataTable();
        DT.Load(DR);
        com.Connection.Close();
        return DT;

    }
    void closconnection(OleDbConnection con)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
    public DataTable EmpGadwal(int LectureNO)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("«·ÌÊ„"));
        dt.Columns.Add(new DataColumn("«·Õ’…"));
        OleDbCommand hcom = new OleDbCommand("select hasa_code,hasa_name from alhasas where hasa_code <= @noofhesas", MySchool.TheCodesConnection);
        hcom.Parameters.AddWithValue("@noofhesas", LectureNO);
        hcom.Connection.Open();
        OleDbDataReader hdr = hcom.ExecuteReader();
        while (hdr.Read())
        {
            dt.Columns.Add(new DataColumn(hdr["hasa_name"].ToString()));
        }
        hdr.Close();
        hcom.Connection.Close();
        OleDbCommand daycom = new OleDbCommand("select daycode,dayname from dayname", MySchool.TheCodesConnection);
        daycom.Connection.Open();
        OleDbDataReader dr = daycom.ExecuteReader();
        while (dr.Read())
        {
            DataRow dro = dt.NewRow();
            dro["«·ÌÊ„"] = dr["dayname"];
            dro["«·Õ’…"] = "«·’›" + "<br />"  + "«·›’·" + "<br />"  + "«·„«œ…";
            hcom.Connection.Open();
            hdr = hcom.ExecuteReader();
            Login lg = new Login();
            while (hdr.Read())
            {
                dro[hdr["hasa_name"].ToString()] = GetSubjectName(Convert.ToInt32(dr["daycode"]), Convert.ToInt32(hdr["hasa_code"]));
            }
            dt.Rows.Add(dro);
            hdr.Close();
            hcom.Connection.Close();
        }
        daycom.Connection.Close();
        hcom.Connection.Close(); return dt;
    }
    public string GetSubjectName( int Day, int Hesa)
    {
        string sub = string.Empty;
        Codes cd = new Codes();
        OleDbCommand com = new OleDbCommand(" select alsofof_code ,fasl_code, mawad_no from  gadwal_alhasas  where CODE = @CODE and daycode = @daycode and hasa_code = @hasa_code", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("@CODE", TheSessions.EmploeeID);
        com.Parameters.AddWithValue("@daycode", Day);
        com.Parameters.AddWithValue("@hasa_code", Hesa);
        com.Connection.Open();
        

            OleDbDataReader Dr =com.ExecuteReader();
            while (Dr.Read())
            {
                sub = new Codes().StageName(Convert.ToInt32(Dr["alsofof_code"]));
                sub += "<br />" + new Codes().ClassName(Convert.ToInt32(Dr["fasl_code"]));
                sub += "<br />" + new Codes().SubjectName(Convert.ToInt32(Dr["mawad_no"])); 
            }
        com.Connection.Close();
        return sub;
    }
}
