using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class studentallViewer : System.Web.UI.Page
{
    private void LoadData(string ProjectId)
    {
//        DataTable dtMain = MCfrsan.LoadDataTable(string.Format(@"SELECT studentall.stid, studentall.subjectid, studentall.tsfeat, studentall.nesba, studentall.winner, studentall.autoid, tblsubject.subject, tblproject.project, '' AS Saf, '' AS stu_name
//        FROM ((studentall INNER JOIN tblsubject ON studentall.subjectid = tblsubject.subjectid) INNER JOIN tblproject ON tblsubject.projectid = tblproject.projectid) WHERE studentall.tsfeat = -1 AND tblproject.projectid = {0}", ProjectId), false);

//        DataTable dtStudentInfo = MCfrsan.LoadDataTable(@"SELECT stu_code, stu_name ,(SELECT alsofof_code FROM student_t WHERE stu_code = student.stu_code AND asase_code = (SELECT MAX(asase_code) FROM student_t)) AS alsofof_code FROM student", false, MCfrsan.ConnectionStringdataschool());

//        DataTable dtSaf = MCfrsan.LoadDataTable("Select alsofof_code, alsofof_name From alsofof", false);

//        foreach (DataRow row in dtMain.Rows)
//        {
//            //Get Student Name
//            foreach (DataRow info in dtStudentInfo.Rows)
//            {
//                if (row["stid"].ToString() == info["stu_code"].ToString())
//                {
//                    row["stu_name"] = info["stu_name"].ToString();

//                    //Get Saf
//                    foreach (DataRow Saf in dtSaf.Rows)
//                    {
//                        if (info["alsofof_code"].ToString() == Saf["alsofof_code"].ToString())
//                        {
//                            row["Saf"] = Saf["alsofof_name"].ToString();
//                            break;
//                        }
//                    }
//                    break;
//                }
//            }
//        }
//        ASPxDataViewMain.DataSource = dtMain;
//        ASPxDataViewMain.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        DataView dv = (DataView)DSData.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Count; i++)
        {
            string ImgPath = string.Format(@"data/photo/picstudent/{0}.jpg", dv[i]["stu_code"]);
            if (System.IO.File.Exists(MapPath(ImgPath)))
            {
                dv[i]["img"] = ImgPath;
            }
            else
            {
                dv[i]["img"] = @"images\st_empty.png";
            }
        }
        ASPxDataViewMain.DataSource = dv;
        ASPxDataViewMain.DataBind();
    }
    protected void DSData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        
    }

    protected void ASPxDataViewMain_PageIndexChanged(object sender, EventArgs e)
    {


    }
}