using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class VoteEditor : System.Web.UI.Page
{
    public bool ConvertToBool(object value)
    {
        if (value == null)
        {
            return false;
        }
        return Convert.ToBoolean(value);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsfrsan.IsStudentAuth)
            Response.Redirect("StudentLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
                return;
            else
                LoadData(Request.QueryString["id"].ToString());
        }
        
    }
    private void LoadData(string ProjectId)
    {
        DataTable dtMain = MCfrsan.LoadDataTable(string.Format(@"SELECT studentall.autoid, studentall.stid, Count(voteing.voteid) AS VoteCount, '' AS StudentName, '1.0' AS Contribution, IIf((Select Count(voteid) From voteing Where studentvote = {0}),'false','true') AS EnableVote
        FROM tblproject INNER JOIN (tblsubject INNER JOIN (studentall LEFT JOIN voteing ON studentall.autoid = voteing.autoid) ON tblsubject.subjectid = studentall.subjectid) ON tblproject.projectid = tblsubject.projectid
        WHERE (((studentall.tsfeat)=True) AND ((tblproject.projectid)={1}))
        GROUP BY studentall.autoid, studentall.stid, '', '', '';
        ", TheSessionsfrsan.UserStudentID, ProjectId), false);

        DataTable StudentInfo = MCfrsan.LoadDataTable(@"SELECT student.stu_code, student.stu_name, student_t.alsofof_code
        FROM student INNER JOIN student_t ON student.stu_code = student_t.stu_code
        WHERE student_t.asase_code = (Select Max(asase_code) From student_t)", false, MCfrsan.ConnectionStringdataschool());

        int AllVotes = Convert.ToInt32(MCfrsan.LoadDataTable(@"SELECT COUNT(voteid) FROM voteing", false).Rows[0][0]);

        for (int i = 0; i < dtMain.Rows.Count; i++)
        {
            if (AllVotes > 0)
                dtMain.Rows[i]["Contribution"] = Convert.ToInt32((Convert.ToDouble(dtMain.Rows[i]["VoteCount"]) / AllVotes) * 100);
            else
            {
                dtMain.Rows[i]["Contribution"] = 0;
            }

            foreach (DataRow Student in StudentInfo.Rows)
            {
                if (dtMain.Rows[i]["stid"].ToString() == Student["stu_code"].ToString())
                {
                    dtMain.Rows[i]["StudentName"] = Student["stu_name"].ToString();
                }
            }
        }
        
        ASPxDataViewMain.DataSource = dtMain;
        ASPxDataViewMain.DataBind();
    }
    protected void btnVote_Click(object sender, EventArgs e)
    {
        DevExpress.Web.ASPxEditors.ASPxButton btn = (DevExpress.Web.ASPxEditors.ASPxButton)sender;
        
        OleDbConnection con = MCfrsan.Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        cmd.CommandText = string.Format(@"INSERT INTO voteing (studentvote, autoid, datein) VALUES ({0}, {1}, DATE())", TheSessionsfrsan.UserStudentID, btn.CommandArgument);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("VoteEditor.aspx?id=" + Request.QueryString["id"]);
    }
}