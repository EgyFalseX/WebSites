using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;
using System.Data;
/// <summary>
/// Summary description for Codes
/// </summary>
public class Codes
{
    
	public Codes()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string CityName(int CityID)
    {
        string ctn = "";
        OleDbCommand com = new OleDbCommand("select GOV  from  gov where GOV_CD  = @cityid", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@cityid", CityID);
        
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             ctn = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return ctn;
         }
         else
         {
             
             com.Connection.Close(); return ""; 
         }
    }
    public string NationalityName(int NationalityID)
    {
        string nat;
        OleDbCommand com = new OleDbCommand("select sex_name  from  sex where sex_code  = @sex_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@sex_code", NationalityID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             nat = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return nat;
         }
         else
         {
com.Connection.Close(); return ""; 
         }
    }
    public string ReligionName(int ReligionID)
    {
        string rel = string.Empty;
        OleDbCommand com = new OleDbCommand("select dyana_name  from  dyana where dyana_code  = @dyana_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@dyana_name", ReligionID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             rel = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return rel;
         }
         else
         {
com.Connection.Close(); return ""; 
         }
    }
    public string SexTypeName(int SexType)
    {
        string sex;
        OleDbCommand com = new OleDbCommand("select name_alnoa  from  alnoa where code_alnoa  = @code_alnoa", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_alnoa", SexType);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            sex = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return sex;
        }
        else
        {
            com.Connection.Close(); return "";
        }
    }
    public string JobName(int JobID)
    {
        string job = "";
        OleDbCommand com = new OleDbCommand("select اسم_الوظيفية  from  اسماء_الوظائف where كود_الوظيفة  = @JobCode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@JobCode", JobID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             job = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return job;
         }
         else
         {
            com.Connection.Close(); return ""; 
         }
    }
    public string PaymentType(int PaymentID)
    {
        string job = "";
        OleDbCommand com = new OleDbCommand("select name_type_althcel  from  type_althcel where code_type_althcel  = @code_type_althcel", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_type_althcel", PaymentID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            job = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return job;
        }
        else
        {
            com.Connection.Close(); return ""; 
        }
    }
    public string RelativeName(int RelativeID)
    {
        string rel;
        OleDbCommand com = new OleDbCommand("select saltalkaraba_name  from  saltalkaraba where saltalkarba_code  = @saltalkarba_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@saltalkarba_code", RelativeID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             rel = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return rel;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string StudyTypeName(int StudyuTypeID)
    {
        string stud;
        OleDbCommand com = new OleDbCommand("select name_type_school  from  lan_school where code_lan_school  = @code_lan_school", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_lan_school", StudyuTypeID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {

             stud = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return stud;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string StudWayName(int StudyWayID)
    {
        string st;
        OleDbCommand com = new OleDbCommand("select nezamaldrasa_name  from  nezamaldrasa where nezamaldrasa_code  = @nezamaldrasa_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@nezamaldrasa_code", StudyWayID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             st = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return st;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string ClassName(int ClassID)
    {
        string cs;
        OleDbCommand com = new OleDbCommand("select fasl_name  from  fasl where fasl_code  = @fasl_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@fasl_code", ClassID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             cs = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return cs;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string TermName(int TermID)
    {
        string tm;
        OleDbCommand com = new OleDbCommand("select name_al_fasl  from  code_fasl where code_al_fasl  = @code_al_fasl", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_al_fasl", TermID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             tm = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return tm;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string StageName(int StageID)
    {
        string sg;
        OleDbCommand com = new OleDbCommand("select alsofof_name  from  alsofof where alsofof_code  = @alsofof_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@alsofof_code", StageID);

        closconnection(com.Connection);  com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            sg = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return sg;
        }
        else
        {
            com.Connection.Close();
            return "";
        }
    }
    public string YearName(int YearID)
    {
        string yr;
        OleDbCommand com = new OleDbCommand("select asase_year  from  asase where asase_code  = @asase_code", MySchool.CodesConnection);
        com.Parameters.AddWithValue("@asase_code", YearID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             yr = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return yr;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string AttitudeName(int AtittudeID)
    {
        string att;
        OleDbCommand com = new OleDbCommand("select colekeyat_name  from  colekeyat where colekeyat_code  = @colekeyat_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@colekeyat_code", AtittudeID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             att = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return att;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string AttitudeType(int AtittudeID)
    {
        string att;
        OleDbCommand com = new OleDbCommand("select colekeyat_type  from  colekeyat where colekeyat_code  = @colekeyat_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@colekeyat_code", AtittudeID);
         closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            att = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return att;
        }
        else
        {
            com.Connection.Close();
            return "";
        }
    }
    public string SubjectName(int SubjectID)
    {
        string att;
        OleDbCommand com = new OleDbCommand("select mowad_name  from  mowad where mawad_no  = @mawad_no", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@mawad_no", SubjectID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             att = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return att;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string PunishmentName(int PunishmentID)
    {
        string pn;
        OleDbCommand com = new OleDbCommand("select name_alokobat  from  alokobat where code_alokobat  = @code_alokobat", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_alokobat", PunishmentID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            pn = com.ExecuteScalar().ToString(); com.Connection.Close();
            com.Connection.Close();
            return pn;
        }
        else
        {
            com.Connection.Close();
            return "";
        }
    }
    public string ActivityName(int ActivivtyID)
    {
        string act;
        OleDbCommand com = new OleDbCommand("select name_gamaat_alnashat  from  gamaat_alnashat where code_gamaat_alnashat  = @code_gamaat_alnashat", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_gamaat_alnashat", ActivivtyID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             act = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return act;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string SportActivityName(int SportActivityID)
    {
        string sprt;
        OleDbCommand com = new OleDbCommand("select nashat_name  from  nashatrwade where nashat_code  = @nashat_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@nashat_code", SportActivityID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             sprt = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return sprt;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public string ReplyTypeName(int ReplyTypeID)
    {
        string sprt;
        OleDbCommand com = new OleDbCommand("select reply_name  from  reply where reply_code  = @reply_code", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("@reply_code", ReplyTypeID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            sprt = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return sprt;
        }
        else
        {
            com.Connection.Close();
            return "";
        }
    }
    public DataTable ReplyTypes()
    {
        DataTable dt = new DataTable();
        OleDbCommand com = new OleDbCommand("select reply_name,reply_code  from  reply", MySchool.HomeWorkConnection);
        closconnection(com.Connection); com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        
        dt.Load(dr);
        com.Connection.Close();
        return dt;
    }
    public string AbcenceName(int AbcenceID)
    {
        string abc;
        OleDbCommand com = new OleDbCommand("select eyab_Name from  eyab_code where eyab_code  = @eyab_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@eyab_code", AbcenceID);
         closconnection(com.Connection); com.Connection.Open();
         if (com.ExecuteScalar() != null)
         {
             abc = com.ExecuteScalar().ToString();
             com.Connection.Close();
             return abc;
         }
         else
         {
             com.Connection.Close();
             return "";
         }
    }
    public DataTable GetDays()
    {
        OleDbCommand daycom = new OleDbCommand("select daycode,dayname from dayname", MySchool.TheCodesConnection);
        closconnection(daycom.Connection); daycom.Connection.Open();
        OleDbDataReader dr = daycom.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        daycom.Connection.Close();
        return dt;
    }
    public string DayName(int DayID)
    {
        string day = string.Empty;
        OleDbCommand daycom = new OleDbCommand("select dayname from dayname where daycode = ?", MySchool.TheCodesConnection);
        daycom.Parameters.AddWithValue("daycode", DayID);
        closconnection(daycom.Connection); daycom.Connection.Open();
        if (daycom.ExecuteScalar() != null)
        {
            day = daycom.ExecuteScalar().ToString();
        }
        daycom.Connection.Close();
        return day;
    }
    public string SessionName(int SessionID)
    {
        string SESSION = string.Empty;
        OleDbCommand com = new OleDbCommand("select hasa_name from alhasas where hasa_code = ?", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("hasa_code", SessionID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            SESSION = com.ExecuteScalar().ToString();
        }
        com.Connection.Close();
        return SESSION;
    }
    public string MonthName(int MonthID)
    {
        string month = string.Empty;
        OleDbCommand com = new OleDbCommand("select manth_name from manth where manth_code = ?", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("manth_code", MonthID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            month = com.ExecuteScalar().ToString();
        }
        com.Connection.Close();
        return month;
    }
    public string ReadStatus(int ReadId)
    {
        string Read = string.Empty;
        OleDbCommand com = new OleDbCommand("select read_name from reade where read_code = ?", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("read_code", ReadId);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            Read = com.ExecuteScalar().ToString();
        }
        com.Connection.Close();
        return Read;
    }
    void closconnection(OleDbConnection con)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
    #region Employee codes


    public string StudentName(long StudID)
    {
        string SName = string.Empty;
        OleDbCommand com = new OleDbCommand("select stu_name from student where stu_code = @StudID", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@StudID", StudID);
        closconnection(com.Connection);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            SName = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return SName;

        }
          
        else
           { com.Connection.Close(); return ""; }

    }

    public string EdarahName(int EID)
    {
        string EName = string.Empty;
        OleDbCommand com = new OleDbCommand("select EDARET  from  EDARET where EPOS  = @Eid", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Eid", EID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            EName = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return EName;
                
            
        }
        else
           { com.Connection.Close(); return ""; }

    }

    public string MarhlaName(int MID)
    {
        string MName = string.Empty;
        OleDbCommand Com = new OleDbCommand("select marhala_name from marahel where marhala_code =@marhala_code", MySchool.TheCodesConnection);
        Com.Parameters.AddWithValue("@marhala_code", MID);
        Com.Connection.Open();
        if (Com.ExecuteScalar() != null)
        {
            MName = Com.ExecuteScalar().ToString();
            Com.Connection.Close();
            return MName;
               
        }
        else
           { Com.Connection.Close(); return ""; }
    }

    public string MaritalStatus(int MSID)
    {
        string S = string.Empty;
        OleDbCommand com = new OleDbCommand("select statname  from  الحالة_الاجتماعية where STAT  = @MSID", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@MSID", MSID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            S=com.ExecuteScalar().ToString();
            com.Connection.Close();
            return S;
                
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string ElmadahName(int MadahID)
    {
        string S = string.Empty;
        OleDbCommand com = new OleDbCommand("select mowad_name  from  mawad where mawad_no  = @MadahID", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@MadahID", MadahID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            S = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return S;
           
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string SchoolName(long SchoolID)
    {
        string S = string.Empty;
        OleDbCommand com = new OleDbCommand("select SCHOOL  from  SCHOOL where SPOS  = @SchoolID", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@SchoolID", SchoolID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            S=com.ExecuteScalar().ToString();
           
            com.Connection.Close();
            return S; 
        }
        else
        {com.Connection.Close();  return "";}
    }

    public string WazefaName(int WID)
    {
        string S = string.Empty;
        OleDbCommand com = new OleDbCommand("select alwazefa from alwazefa  where code_alwazefa=@code_alwazefa", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@code_alwazefa", WID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            S = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return S; 
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string TakderName(int DID)
    {
        string s = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_التقدير  from  أسم_التقدير where كود_التقدير  = @takder_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@takder_code", DID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            s=com.ExecuteScalar().ToString();
            com.Connection.Close();
            return s;
            
        }
            
        else
           { com.Connection.Close(); return ""; }
    }

    public string ProgramName(int PID)
    {
        string s = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_البرنامج  from  أسم_الدورات_التدريبية where كود_البرنامج  = @Program_code", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Program_code", PID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            s = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return s;
               
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string PlaceName(int PlaceID)
    {
        string p = string.Empty;
        OleDbCommand com = new OleDbCommand("select [place name]   from  [place-l] where [place code]  = @placecode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@placecode", PlaceID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            p = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return p;
                
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string DegreeName(int DegreeID)
    {
        string D = string.Empty;
        OleDbCommand com = new OleDbCommand("select اسم_الدرجة   from  أسماء_الدرجات where كود_الدرجة  = @Degreeecode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Degreeecode", DegreeID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            D = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return D;
                
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string PunishName(int PunishID)
    {
        string p = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_الجزاء   from  أسم_الجزاءات where كود_أسم_الجزاء  = @Punishcode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Punishcode", PunishID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            p=com.ExecuteScalar().ToString();
            com.Connection.Close();
            return p;
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string QualifiedeName(int QualifyID)
    {
        string q = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_المؤهل   from  أسم_المؤهلات where كودالمؤهل  = @Qualifycode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Qualifycode", QualifyID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            q=com.ExecuteScalar().ToString();
            com.Connection.Close();
            return q;
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string HolidayName(int HolID)
    {
        string h = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_نوع_الاجازة   from  أسم_نوع_الاجازة where كود_نوع_الاجازة  = @Holidaycode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@Holidaycode", HolID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            h = com.ExecuteScalar().ToString(); 
            com.Connection.Close();
            return h; 
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string GehatAgazaName(int GAID)
    {
        string g = string.Empty;
        OleDbCommand com = new OleDbCommand("select جهة_الاجازة   from  أسم_جهة_الاجازة where كود_جهة_الاجازة  = @GAcode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@GAcode", GAID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            g = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return g; 
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string LoansTypeName(int LTID)
    {
        string l = string.Empty;
        OleDbCommand com = new OleDbCommand("select نوع_الاعارة   from  أسم_نوع_الاعارات where كود_نوع_الاعارة  = @LTcode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@LTcode", LTID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            l = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return l; 
            
        }
        else
           { com.Connection.Close(); return ""; }
    }

    public string GehatEaraName(int GLID)
    {
        string ge = string.Empty;
        OleDbCommand com = new OleDbCommand("select أسم_جهة_الاعارة   from  أسم_جهة_الاعارة where كود_جهة_الأعارة  = @GLcode", MySchool.TheCodesConnection);
        com.Parameters.AddWithValue("@GLcode", GLID);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            ge = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return ge;
            
        }
        else
           { com.Connection.Close(); return ""; }
    }
    public string permissionKind(string PK)
    {
        switch (PK)
        {
            case "1":

                PK = "خاص";
                break;

            case "2":
                PK = "مصلحي";
                break;

        }
        return PK;
    }

    public string YearID(string YearName)
    {
        string yr;
        OleDbCommand com = new OleDbCommand("select asase_code   from  asase where  asase_year  = @asase_year", MySchool.CodesConnection);
        com.Parameters.AddWithValue("@asase_year", YearName);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            yr = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return yr;
        }
        else
        {
            
           { com.Connection.Close(); return ""; }
        }
    }

    public string ReplyStatus(int ReplyId)
    {
        string Read = string.Empty;
        OleDbCommand com = new OleDbCommand("select reply_name from reply where reply_code = ?", MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("reply_code", ReplyId);
        closconnection(com.Connection);
        com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            Read = com.ExecuteScalar().ToString();
            com.Connection.Close();
            return Read;
        }
        
        else
        {
            com.Connection.Close();
            return "";

        }
    }

    public string DayID(long EmpID, int hasaID, int SafId, int ClassID, int MadaID)
    {
        string DID = string.Empty;
        OleDbCommand com = new OleDbCommand("select daycode from gadwal_alhasas where CODE = ? and hasa_code=? and alsofof_code=? and fasl_code=? and mawad_no=?", MySchool.GadwalConnection);
        com.Parameters.AddWithValue("CODE", EmpID);
        com.Parameters.AddWithValue("hasa_code", hasaID);
        com.Parameters.AddWithValue("alsofof_code", SafId);
        com.Parameters.AddWithValue("fasl_code", ClassID);
        com.Parameters.AddWithValue("mawad_no", MadaID);
        closconnection(com.Connection); com.Connection.Open();
        if (com.ExecuteScalar() != null)
        {
            DID = com.ExecuteScalar().ToString();

            com.Connection.Close();
            return DID;
        }
        else
        {
            com.Connection.Close();
            return "";

        }
    }

    #endregion
}
