using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;
using System.Data;
/// <summary>
/// Summary description for Students
/// </summary>
public class Students
{
	public Students()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetData(string Cells)
    {

            OleDbCommand com = new OleDbCommand("select " + Cells + " from student where stu_code = @stu_codes", MySchool.StudentConnection);
            com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
            com.Connection.Open();
            OleDbDataReader dr = com.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            
           com.Connection.Close();return dt;

    }
    public string GetGender()
    {

        OleDbCommand com = new OleDbCommand("select code_alnoa from student where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        string gen = com.ExecuteScalar().ToString();
        com.Connection.Close(); return gen;

    }
    public DataTable StudentList()
    {

        OleDbCommand com = new OleDbCommand("select  stu_nezamaldrasa.asase_code,nezamaldrasa_code,code_lan_school,alsofof_code,fasl_code from (stu_nezamaldrasa inner join student_t on student_t.stu_code =  stu_nezamaldrasa.stu_code and student_t.asase_code = stu_nezamaldrasa.asase_code) inner join stu_noa_eldrasa on stu_noa_eldrasa.stu_code = stu_nezamaldrasa.stu_code  and stu_noa_eldrasa.asase_code = stu_nezamaldrasa.asase_code  where stu_nezamaldrasa.stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable StudentAttitudes()
    {

        OleDbCommand com = new OleDbCommand("select  colekeyat_code,asase_code from stu_colekeyat   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable StudentSubSubjectGroubs()
    {

        OleDbCommand com = new OleDbCommand("select mawad_no, asase_code,date_from,date_to from stu_mogmoat   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable Studentpunishments()
    {

        OleDbCommand com = new OleDbCommand("select code_alokobat, asase_code,date,why from stu_alokobat   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable MedicalHistory()
    {

        OleDbCommand com = new OleDbCommand("select * from stu_elalag_eltpe   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable Payments()
    {

        OleDbCommand com = new OleDbCommand("select no_kasema,code_type_althcel,date_althcel,mab_althcel,mab_alksam,sbab_alksam from motahaclat   where stu_code = @stu_codes", MySchool.AccountantConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        com.Connection.Close(); return dt;

    }
    public DataTable Talents()
    {

        OleDbCommand com = new OleDbCommand("select * from stu_almawaheb   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable Activities()
    {

        OleDbCommand com = new OleDbCommand("select * from stu_gamaat_alnashat   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable SportActivities()
    {

        OleDbCommand com = new OleDbCommand("select * from stu_nashat   where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable AbcenceYears()
    {

        OleDbCommand com = new OleDbCommand("select distinct asase_code from stu_eyab where stu_code = @stu_codes", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    public DataTable StudentAbcence(int theYear)
    {

        OleDbCommand com = new OleDbCommand("select  eyab_date_from,eyab_code,eyab_date_to from stu_eyab where stu_code = @stu_codes and asase_code= @asase_code", MySchool.StudentConnection);
        com.Parameters.AddWithValue("@stu_codes", TheSessions.StudentID);
        com.Parameters.AddWithValue("@asase_code", theYear);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
       com.Connection.Close();return dt;

    }
    enum Courses
    {

    }
    public DataTable mySubjects(int LectureNO)
    {
        DataTable dt = new DataTable();
       dt.Columns.Add(new DataColumn ("اليوم"));
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
            dro["اليوم"] = dr["dayname"];
            hcom.Connection.Open();
            hdr = hcom.ExecuteReader();
            Login lg = new Login ();
            while (hdr.Read())
            {
                dro[hdr["hasa_name"].ToString()] = GetSubjectName(lg.StudentClass, lg.StudentStage, Convert.ToInt32(dr["daycode"]), Convert.ToInt32(hdr["hasa_code"]));
            }
            dt.Rows.Add(dro);
            hdr.Close();
            hcom.Connection.Close();
        }
        daycom.Connection.Close();
       hcom.Connection.Close();return dt;
    }
  public DataTable mySubjects(int LectureNO,int Day)
  {
      DataTable dt = new DataTable();
      dt.Columns.Add(new DataColumn("اليوم"));
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
      OleDbCommand daycom = new OleDbCommand("select daycode,dayname from dayname where daycode = @daycode", MySchool.TheCodesConnection);
      daycom.Parameters.AddWithValue("@daycode", Day);
      daycom.Connection.Open();
      OleDbDataReader dr = daycom.ExecuteReader();
      while (dr.Read())
      {
          DataRow dro = dt.NewRow();
          dro["اليوم"] = dr["dayname"];
          hcom.Connection.Open();
          hdr = hcom.ExecuteReader();
          Login lg = new Login();
          while (hdr.Read())
          {
              dro[hdr["hasa_name"].ToString()] = GetSubjectName(lg.StudentClass, lg.StudentStage, Convert.ToInt32(dr["daycode"]), Convert.ToInt32(hdr["hasa_code"]));
          }
          dt.Rows.Add(dro);
          hdr.Close();
          hcom.Connection.Close();
      }
      daycom.Connection.Close();
     hcom.Connection.Close();return dt;
  }
 public string GetSubjectName(int ClassNo,int StageNo,int Day,int Lecture)
  {
      string sub = string.Empty;
      Codes cd = new Codes();
      OleDbCommand com = new OleDbCommand(" select mawad_no from  gadwal_alhasas  where alsofof_code = @alsofof_code and fasl_code = @fasl_code and daycode = @daycode and hasa_code = @hasa_code", MySchool.GadwalConnection);
      
      com.Parameters.AddWithValue("@alsofof_code", StageNo);
      com.Parameters.AddWithValue("@fasl_code", ClassNo);
     com.Parameters.AddWithValue("@daycode", Day);
      com.Parameters.AddWithValue("@hasa_code", Lecture);
      com.Connection.Open();
      int subno = -1;
      if (com.ExecuteScalar() != null)
      {
          subno =Convert.ToInt32(com.ExecuteScalar());
      }
      com.Connection.Close();
      sub = cd.SubjectName(subno);
      return sub;
  }
 public DataTable GetMyGoingON(string whereClause)
 {
     DataTable dt = new DataTable();
     string sl = "select id,CODE,add_date,title,notice,reply_code,reply from motapa where stu_code = @stu_code and asase_code = @asase_code";
      
     if (whereClause != null)
     {
         sl += " and " + whereClause;
     }
     OleDbCommand com = new OleDbCommand(sl, MySchool.HomeWorkConnection);
     com.Parameters.AddWithValue("@stu_code", TheSessions.StudentID);
     com.Parameters.AddWithValue("@asase_code", Login.CurrentYear);
     com.Connection.Open();
     OleDbDataReader dr = com.ExecuteReader();
     dt.Load(dr);

    // HttpContext.Current.Response.Write(sl);
     com.Connection.Close();
     return dt;
 }
 public DataTable HomeWork(string whereClause)
 {
     Login lg = new Login();
     DataTable dt = new DataTable();
     string sl = "select id,hasa_code,mawad_no,add_date,daycode,code,read_code from home_work where alsofof_code = ? and fasl_code = ? and asase_code = ?  ";
     if (whereClause != null)
     {
         sl += " and " + whereClause;
     }
     OleDbCommand com = new OleDbCommand(sl, MySchool.HomeWorkConnection);
     com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
     com.Parameters.AddWithValue("fasl_code", lg.StudentClass);
     com.Parameters.AddWithValue("asase_code", Login.CurrentYear);
     
     com.Connection.Open();
     OleDbDataReader dr = com.ExecuteReader();
     dt.Load(dr);
     // HttpContext.Current.Response.Write(sl);
     com.Connection.Close();
     return dt;
 }
 public DataTable MyHomeWork(string whereClause)
 {
     Login lg = new Login();
     DataTable dt = new DataTable();
     string sl = "select id,hasa_code,mawad_no,add_date,code,read_code from st_wagep where stu_code = ? and asase_code = ?  ";
     if (whereClause != null)
     {
         sl += " and " + whereClause;
     }
     OleDbCommand com = new OleDbCommand(sl, MySchool.HomeWorkConnection);
     com.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
     com.Parameters.AddWithValue("asase_code", Login.CurrentYear);

     com.Connection.Open();
     OleDbDataReader dr = com.ExecuteReader();
     dt.Load(dr);
     // HttpContext.Current.Response.Write(sl);
     com.Connection.Close();
     return dt;
 }
 public DataTable HomeWorkDetails(int HomeWorkID,bool SpecialHomeWork)
 {
     Login lg = new Login();
     DataTable dt = new DataTable();
     string sl = string.Empty;
     string up = string.Empty;
     if (SpecialHomeWork)
     {
         sl = "select hasa_code,mawad_no,add_date,code,home_work from st_wagep where id = ?";
          up = "update st_wagep set read_code = 1 where id = ?";
     }
     else
     {
         sl = "select hasa_code,mawad_no,add_date,code,home_work from home_work where id = ?";
         up = "update home_work set read_code = 1 where id = ?";
     }
     OleDbCommand com = new OleDbCommand(sl, MySchool.HomeWorkConnection);
     com.Parameters.AddWithValue("id", HomeWorkID);

     com.Connection.Open();
     OleDbDataReader dr = com.ExecuteReader();
     dt.Load(dr);
     // HttpContext.Current.Response.Write(sl);
     com.Connection.Close();
     
     
     OleDbCommand thecom = new OleDbCommand(up, MySchool.HomeWorkConnection);
     thecom.Parameters.AddWithValue("id", HomeWorkID);
     thecom.Connection.Open();
     thecom.ExecuteNonQuery();
     thecom.Connection.Close();
     return dt;
 }
 public DataTable StudentAcountant()
 {
     DataTable dt = new DataTable();
     OleDbCommand com = new OleDbCommand("select amsafofat from almasrofat where asase_code = ? and alsofof_code = ?", MySchool.AccountantConnection);
     Login lg = new Login();
     com.Parameters.AddWithValue("asase_code", Login.CurrentYear);
     com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
    
     com.Connection.Open();
     OleDbDataReader dr = com.ExecuteReader();
     dt.Load(dr);
     com.Connection.Close();
     return dt;
 }
 public class Resultrs
 {
     public DataTable FirstTerm()
     {
         Login lg = new Login();
         DataTable res = new DataTable();
         if (lg.StudentStage == 3 || lg.StudentStage == 4 || lg.StudentStage == 5)
         {
        
         res.Columns.Add(new DataColumn("المادة"));
         res.Columns.Add(new DataColumn("عربي وخط"));
         res.Columns.Add(new DataColumn("رياضيات"));
         res.Columns.Add(new DataColumn("إنجليزي"));
         res.Columns.Add(new DataColumn("المجموع"));
         res.Columns.Add(new DataColumn("تربية دينية"));
         res.Columns.Add(new DataColumn("حاسب"));
         res.Columns.Add(new DataColumn("قرآن"));
         DataRow drow = res.NewRow();
         drow["المادة"] = "الدرجة الكبرى";

//         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
         com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
         com.Parameters.AddWithValue("code_type_aldaragat", 1);
         com.Parameters.AddWithValue("code_aldragat", 2);

         com.Connection.Open();
         OleDbDataReader dr = com.ExecuteReader();
         int sum = 0;
         while (dr.Read())
         {

             if (Convert.ToInt32(dr["mawad_no"]) == 260)
             {
                 drow["عربي وخط"] = dr["aldragat"];
                 sum += Convert.ToInt32(dr["aldragat"]);
             }
             else if (Convert.ToInt32(dr["mawad_no"]) == 7)
             {
                 drow["رياضيات"] = dr["aldragat"];
                 sum += Convert.ToInt32(dr["aldragat"]);
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 2)
             {
                 drow["إنجليزي"] = dr["aldragat"];
                 sum += Convert.ToInt32(dr["aldragat"]);
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 124)
             {
                 drow["تربية دينية"] = dr["aldragat"];

             }
             if (Convert.ToInt32(dr["mawad_no"]) == 31)
             {
                 drow["حاسب"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 70)
             {
                 drow["قرآن"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 250)
             {
                 drow["المجموع"] = dr["aldragat"];

             }
         }
         res.Rows.Add(drow);
         dr.Close();

         com.Connection.Close();
         drow = res.NewRow();
         drow["المادة"] = "الدرجة الصغرى";
         com.Parameters.Clear();
         com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
         com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
         com.Parameters.AddWithValue("code_type_aldaragat", 2);
         com.Parameters.AddWithValue("code_aldragat", 2);
         com.Connection.Open();
         dr = com.ExecuteReader();
         while (dr.Read())
         {

             if (Convert.ToInt32(dr["mawad_no"]) == 260)
             {
                 drow["عربي وخط"] = dr["aldragat"];
             }
             else if (Convert.ToInt32(dr["mawad_no"]) == 7)
             {
                 drow["رياضيات"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 2)
             {
                 drow["إنجليزي"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 124)
             {
                 drow["تربية دينية"] = dr["aldragat"];

             }
             if (Convert.ToInt32(dr["mawad_no"]) == 31)
             {
                 drow["حاسب"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 700)
             {
                 drow["قرآن"] = dr["aldragat"];
             }
             if (Convert.ToInt32(dr["mawad_no"]) == 250)
             {
                 drow["المجموع"] = dr["aldragat"];

             }

         }
         res.Rows.Add(drow);
         dr.Close();

         com.Connection.Close();
         drow = res.NewRow();
         drow["المادة"] = "الدرجات";
         OleDbCommand myres = new OleDbCommand("select عربى_نصف,رياضيات_نصف,انجليزى_نصف,[المجموع _نصف],دين_نصف,حاسب_نصف,قران_نصف from mid_last where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
         myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow["عربي وخط"] = dres["عربى_نصف"];
                 drow["رياضيات"] = dres["رياضيات_نصف"];
                 drow["إنجليزي"] = dres["انجليزى_نصف"];
                 drow["المجموع"] = dres["المجموع _نصف"];
                 drow["تربية دينية"] = dres["دين_نصف"];
                 drow["حاسب"] = dres["حاسب_نصف"];
                 drow["قرآن"] = dres["قران_نصف"];
             }
             res.Rows.Add(drow);
             myres.Connection.Close();
     }
         else if (lg.StudentStage == 6 || lg.StudentStage == 7 || lg.StudentStage == 8)
         {
             res.Columns.Add(new DataColumn("المادة"));
             res.Columns.Add(new DataColumn("اللغة العربية والخط"));
             res.Columns.Add(new DataColumn("الرياضيات"));
             res.Columns.Add(new DataColumn("اللغة الانجليزية"));
             res.Columns.Add(new DataColumn("العلوم"));
             res.Columns.Add(new DataColumn("الدراسات"));
             res.Columns.Add(new DataColumn("التربية الدينية"));
             res.Columns.Add(new DataColumn("القرآن"));
             res.Columns.Add(new DataColumn("المجموع الكلي"));
             DataRow drow = res.NewRow();
             drow["المادة"] = "الدرجة الكبرى";

             //         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

             OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 1);
             com.Parameters.AddWithValue("code_aldragat", 2);

             com.Connection.Open();
             OleDbDataReader dr = com.ExecuteReader();
             int sum = 0;
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["اللغة العربية والخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["الرياضيات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["التربية الدينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["القرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجة الصغرى";
             com.Parameters.Clear();
             com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 2);
             com.Parameters.AddWithValue("code_aldragat", 2);
             com.Connection.Open();
             dr = com.ExecuteReader();

             while (dr.Read())
             {
                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["اللغة العربية والخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["الرياضيات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["التربية الدينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["القرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجات";
             OleDbCommand myres = new OleDbCommand("select عربى_نصف,رياضيات_نصف,انجليزى_نصف,[المجموع _نصف],دين_نصف,دراسات_نصف,علوم_نصف,قران_نصف from mid_last where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
             myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow["اللغة العربية والخط"] = dres["عربى_نصف"];
                 drow["الرياضيات"] = dres["رياضيات_نصف"];
                 drow["اللغة الانجليزية"] = dres["انجليزى_نصف"];
                 drow["العلوم"] = dres["علوم_نصف"];
                 drow["الدراسات"] = dres["دراسات_نصف"];
                 drow["التربية الدينية"] = dres["دين_نصف"];
                 drow["القرآن"] = dres["قران_نصف"];
                 drow["المجموع الكلي"] = dres["المجموع _نصف"];
             }
             res.Rows.Add(drow);
             myres.Connection.Close();  
         }

         return res;
     }
     public DataTable SecondTerm()
     {
         Login lg = new Login();
         DataTable res = new DataTable();
         if (lg.StudentStage == 3 || lg.StudentStage == 4 || lg.StudentStage == 5)
         {

             res.Columns.Add(new DataColumn("المادة"));
             res.Columns.Add(new DataColumn("عربي وخط"));
             res.Columns.Add(new DataColumn("رياضيات"));
             res.Columns.Add(new DataColumn("إنجليزي"));
             res.Columns.Add(new DataColumn("المجموع"));
             res.Columns.Add(new DataColumn("تربية دينية"));
             res.Columns.Add(new DataColumn("حاسب"));
             res.Columns.Add(new DataColumn("قرآن"));
             DataRow drow = res.NewRow();
             drow["المادة"] = "الدرجة الكبرى";

             //         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

             OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 1);
             com.Parameters.AddWithValue("code_aldragat", 3);

             com.Connection.Open();
             OleDbDataReader dr = com.ExecuteReader();
             int sum = 0;
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                     sum += Convert.ToInt32(dr["aldragat"]);
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                     sum += Convert.ToInt32(dr["aldragat"]);
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["إنجليزي"] = dr["aldragat"];
                     sum += Convert.ToInt32(dr["aldragat"]);
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["حاسب"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 70)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجة الصغرى";
             com.Parameters.Clear();
             com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 2);
             com.Parameters.AddWithValue("code_aldragat", 3);
             com.Connection.Open();
             dr = com.ExecuteReader();
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["إنجليزي"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["حاسب"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 700)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }

             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجات";
             OleDbCommand myres = new OleDbCommand("select عربى_اخر,رياضيات_اخر,انجليزى_اخر,[المجموع _الكلى],دين_اخر,حاسب_اخر,قران_اخر from mid_last where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
             myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow["عربي وخط"] = dres["عربى_اخر"];
                 drow["رياضيات"] = dres["رياضيات_اخر"];
                 drow["إنجليزي"] = dres["انجليزى_اخر"];
                 drow["المجموع"] = dres["المجموع _الكلى"];
                 drow["تربية دينية"] = dres["دين_اخر"];
                 drow["حاسب"] = dres["حاسب_اخر"];
                 drow["قرآن"] = dres["قران_اخر"];
             }
             res.Rows.Add(drow);
             myres.Connection.Close();
         }
         else if (lg.StudentStage == 6 || lg.StudentStage == 7 || lg.StudentStage == 8)
         {
             res.Columns.Add(new DataColumn("المادة"));
             res.Columns.Add(new DataColumn("اللغة العربية والخط"));
             res.Columns.Add(new DataColumn("الرياضيات"));
             res.Columns.Add(new DataColumn("اللغة الانجليزية"));
             res.Columns.Add(new DataColumn("العلوم"));
             res.Columns.Add(new DataColumn("الدراسات"));
             res.Columns.Add(new DataColumn("التربية الدينية"));
             res.Columns.Add(new DataColumn("القرآن"));
             res.Columns.Add(new DataColumn("المجموع الكلي"));
             DataRow drow = res.NewRow();
             drow["المادة"] = "الدرجة الكبرى";

             //         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

             OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 1);
             com.Parameters.AddWithValue("code_aldragat", 3);

             com.Connection.Open();
             OleDbDataReader dr = com.ExecuteReader();
             int sum = 0;
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["اللغة العربية والخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["الرياضيات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["التربية الدينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["القرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجة الصغرى";
             com.Parameters.Clear();
             com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 2);
             com.Parameters.AddWithValue("code_aldragat", 3);
             com.Connection.Open();
             dr = com.ExecuteReader();

             while (dr.Read())
             {
                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["اللغة العربية والخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["الرياضيات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["التربية الدينية"] = dr["aldragat"];

                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["القرآن"] = dr["aldragat"];
                 }
                 if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["المادة"] = "الدرجات";
             OleDbCommand myres = new OleDbCommand("select عربى_اخر,رياضيات_اخر,انجليزى_اخر,[المجموع _الكلى],دين_اخر,دراسات_اخر,علوم_اخر,قران_اخر from mid_last where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
             myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow["اللغة العربية والخط"] = dres["عربى_اخر"];
                 drow["الرياضيات"] = dres["رياضيات_اخر"];
                 drow["اللغة الانجليزية"] = dres["انجليزى_اخر"];
                 drow["العلوم"] = dres["علوم_اخر"];
                 drow["الدراسات"] = dres["دراسات_اخر"];
                 drow["التربية الدينية"] = dres["دين_اخر"];
                 drow["القرآن"] = dres["قران_اخر"];
                 drow["المجموع الكلي"] = dres["المجموع _الكلى"];
             }
             res.Rows.Add(drow);
             myres.Connection.Close();
         }

         return res;
     }
     public DataTable MonthsResult()
     {
         Login lg = new Login();
         DataTable res = new DataTable();
         if (lg.StudentStage == 3 || lg.StudentStage == 4 || lg.StudentStage == 5)
         {

             res.Columns.Add(new DataColumn("الشهر"));
             res.Columns.Add(new DataColumn("عربي وخط"));
             res.Columns.Add(new DataColumn("رياضيات"));
             res.Columns.Add(new DataColumn("إنجليزي"));
             res.Columns.Add(new DataColumn("المجموع"));
             res.Columns.Add(new DataColumn("تربية دينية"));
             res.Columns.Add(new DataColumn("قرآن"));
             res.Columns.Add(new DataColumn("الأنشطة"));
             res.Columns.Add(new DataColumn("المجموع الكلي"));
             res.Columns.Add(new DataColumn("حاسب"));
             
             DataRow drow = res.NewRow();
             drow["الشهر"] = "الدرجة الكبرى";

             //         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

             OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 1);
             com.Parameters.AddWithValue("code_aldragat", 24);

             com.Connection.Open();
             OleDbDataReader dr = com.ExecuteReader();
             int sum = 0;
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                 }
                else if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["إنجليزي"] = dr["aldragat"];
                 }
                else if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
               else  if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["حاسب"] = dr["aldragat"];
                 }
               else  if (Convert.ToInt32(dr["mawad_no"]) == 70)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }
               else  if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 300)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 126)
                 {
                     drow["الأنشطة"] = dr["aldragat"];

                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["الشهر"] = "الدرجة الصغرى";
             com.Parameters.Clear();
             com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 2);
             com.Parameters.AddWithValue("code_aldragat", 24);
             com.Connection.Open();
             dr = com.ExecuteReader();
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["إنجليزي"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 31)
                 {
                     drow["حاسب"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 70)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 300)
                 {
                     drow["المجموع الكلي"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 126)
                 {
                     drow["الأنشطة"] = dr["aldragat"];

                 }

             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             

             OleDbCommand myres = new OleDbCommand("select manth_code,[الحاسب آلي],[اللغه العربية],[اللغه الانجليزية],الرياضيات,[مجموع المواد المضافة],[التربية الدينية],قرآن,[معلومات عامة وأنشطة بيئية] from month_net where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
             myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow = res.NewRow();
                 drow["الشهر"] = new Codes().MonthName(Convert.ToInt32(dres["manth_code"]));
                 drow["عربي وخط"] = dres["اللغه العربية"];
                 drow["رياضيات"] = dres["الرياضيات"];
                 drow["إنجليزي"] = dres["اللغه الانجليزية"];
                 drow["المجموع"] = dres["مجموع المواد المضافة"];
                 drow["تربية دينية"] = dres["التربية الدينية"];
                 drow["قرآن"] = dres["قرآن"];
                 drow["الأنشطة"] = dres["معلومات عامة وأنشطة بيئية"];
                 drow["المجموع الكلي"] = dres["قرآن"];
                 drow["حاسب"] = dres["الحاسب آلي"];
                 res.Rows.Add(drow);
             }
            
             myres.Connection.Close();
         }
         else if (lg.StudentStage == 6 || lg.StudentStage == 7 || lg.StudentStage == 8)
         {
             res.Columns.Add(new DataColumn("الشهر"));
             res.Columns.Add(new DataColumn("عربي وخط"));
             res.Columns.Add(new DataColumn("رياضيات"));
             res.Columns.Add(new DataColumn("العلوم"));
             res.Columns.Add(new DataColumn("الدراسات"));
             res.Columns.Add(new DataColumn("اللغة الانجليزية"));
             res.Columns.Add(new DataColumn("المجموع"));
             res.Columns.Add(new DataColumn("تربية دينية"));
             res.Columns.Add(new DataColumn("قرآن"));

             DataRow drow = res.NewRow();
             drow["الشهر"] = "الدرجة الكبرى";

             //         OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where asase_code = ? and alsofof_code = ? and  code_al_fasl = ? and code_type_aldaraga = ? and code_aldragat = ?", MySchool.TheCodesConnection);

             OleDbCommand com = new OleDbCommand("select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?", MySchool.TheCodesConnection);
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 1);
             com.Parameters.AddWithValue("code_aldragat", 24);

             com.Connection.Open();
             OleDbDataReader dr = com.ExecuteReader();
             int sum = 0;
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 } 
                 else if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 70)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }
             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();
             drow = res.NewRow();
             drow["الشهر"] = "الدرجة الصغرى";
             com.Parameters.Clear();
             com.CommandText = "select aldragat,mawad_no from mawad_aldragat  where   alsofof_code = ? and  code_type_aldaragat = ? and code_aldragat = ?";
             com.Parameters.AddWithValue("alsofof_code", lg.StudentStage);
             com.Parameters.AddWithValue("code_type_aldaragat", 2);
             com.Parameters.AddWithValue("code_aldragat", 24);
             com.Connection.Open();
             dr = com.ExecuteReader();
             while (dr.Read())
             {

                 if (Convert.ToInt32(dr["mawad_no"]) == 260)
                 {
                     drow["عربي وخط"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 7)
                 {
                     drow["رياضيات"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 8)
                 {
                     drow["العلوم"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 9)
                 {
                     drow["الدراسات"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 2)
                 {
                     drow["اللغة الانجليزية"] = dr["aldragat"];
                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 250)
                 {
                     drow["المجموع"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 124)
                 {
                     drow["تربية دينية"] = dr["aldragat"];

                 }
                 else if (Convert.ToInt32(dr["mawad_no"]) == 70)
                 {
                     drow["قرآن"] = dr["aldragat"];
                 }

             }
             res.Rows.Add(drow);
             dr.Close();

             com.Connection.Close();


             OleDbCommand myres = new OleDbCommand("select manth_code,[العلوم],[اللغه العربية],[اللغه الانجليزية],الرياضيات,[مجموع المواد المضافة],[التربية الدينية],قرآن,[الدراسات الاجتماعية] from month_net where asase_code = ? and  stu_code = ?", MySchool.ControlConnection);
             myres.Parameters.AddWithValue("asase_code", Login.CurrentYear);
             myres.Parameters.AddWithValue("stu_code", TheSessions.StudentID);
             myres.Connection.Open();
             OleDbDataReader dres = myres.ExecuteReader();
             while (dres.Read())
             {
                 drow = res.NewRow();
                 drow["الشهر"] = new Codes().MonthName(Convert.ToInt32(dres["manth_code"]));
                 drow["عربي وخط"] = dres["اللغه العربية"];
                 drow["رياضيات"] = dres["الرياضيات"];
                 drow["العلوم"] = dres["العلوم"];
                 drow["الدراسات"] = dres["الدراسات الاجتماعية"];
                 drow["اللغة الانجليزية"] = dres["اللغه الانجليزية"];
                 drow["المجموع"] = dres["مجموع المواد المضافة"];
                 drow["تربية دينية"] = dres["التربية الدينية"];
                 drow["قرآن"] = dres["قرآن"];
                 res.Rows.Add(drow);
             }

             myres.Connection.Close();
         }

         return res;
     }
 }
}
