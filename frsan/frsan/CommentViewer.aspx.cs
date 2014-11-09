using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class CommentViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }
    private void LoadData()
    {
        DataTable dtMain = MCfrsan.LoadDataTable(@"SELECT        tblcomment.studentcomment, tblcomment.comment, tblcomment.autoid, tblcomment.LikeIt, tblcomment.datein, studentall.stid, '' AS SarsName, '' AS Saf, '' AS StudentName, tblsubject.subject
        FROM            ((studentall INNER JOIN
                                 tblcomment ON studentall.autoid = tblcomment.autoid) INNER JOIN
                                 tblsubject ON studentall.subjectid = tblsubject.subjectid)
        ORDER BY tblcomment.commentid DESC", false);

        DataTable StudentInfo = MCfrsan.LoadDataTable(@"SELECT student.stu_code, student.stu_name, student_t.alsofof_code
        FROM student INNER JOIN student_t ON student.stu_code = student_t.stu_code
        WHERE student_t.asase_code = (Select Max(asase_code) From student_t)", false, MCfrsan.ConnectionStringdataschool());

        DataTable SafTbl = MCfrsan.LoadDataTable(@"Select alsofof_code, alsofof_name From alsofof", false);

        foreach (DataRow main in dtMain.Rows)
        {
            //main["LikeIt"] = Convert.ToInt32(main["LikeIt"]) * 1.0;
            foreach (DataRow student in StudentInfo.Rows)
            {
                if (main["stid"].ToString() == student["stu_code"].ToString())
                {
                    main["SarsName"] = student["stu_name"].ToString();
                }

                if (main["studentcomment"].ToString() == student["stu_code"].ToString())
                {
                    main["StudentName"] = student["stu_name"].ToString();
                    foreach (DataRow Saf in SafTbl.Rows)
                    {
                        if (student["alsofof_code"].ToString() == Saf["alsofof_code"].ToString())
                        {
                            main["Saf"] = Saf["alsofof_name"].ToString();
                        }
                    }
                }

            }
        }
        ASPxDataViewMain.DataSource = dtMain;
        ASPxDataViewMain.DataBind();
    }
  
    protected void ASPxFormLayout1_E1_DataBinding1(object sender, EventArgs e)
    {
        DevExpress.Web.ASPxRatingControl.ASPxRatingControl obj = (DevExpress.Web.ASPxRatingControl.ASPxRatingControl)sender;
        
        obj.Value =  Convert.ToDecimal(obj.Titles);
    }
}