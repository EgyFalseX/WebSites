using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class CommentEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsfrsan.IsStudentAuth)
            Response.Redirect("StudentLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    private bool SaveComment(int studentcomment, string comment, int autoid, int LikeIt)
    {
        OleDbConnection con = MCfrsan.Connection;
        OleDbCommand cmd = new OleDbCommand("INSERT INTO tblcomment (studentcomment, comment, autoid, LikeIt, datein) VALUES (?,?,?,?,Date())", con);
        OleDbParameter pramstudentcomment = new OleDbParameter("studentcomment", OleDbType.Integer);
        OleDbParameter pramcomment = new OleDbParameter("comment", OleDbType.VarWChar);
        OleDbParameter pramautoid = new OleDbParameter("autoid", OleDbType.Integer);
        OleDbParameter pramLikeIt = new OleDbParameter("LikeIt", OleDbType.SmallInt);
        cmd.Parameters.AddRange(new OleDbParameter[] { pramstudentcomment, pramcomment, pramautoid, pramLikeIt });

        pramstudentcomment.Value = studentcomment; pramcomment.Value = comment;
        pramautoid.Value = autoid; pramLikeIt.Value = LikeIt;

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (SaveComment(Convert.ToInt32(TheSessionsfrsan.UserStudentID), txt.Text, Convert.ToInt32(Request.QueryString["id"]), Convert.ToInt32(RatingControl.Value)))
        {
            lblState.Text = "تم اضافة تعليق";
            lblState.ForeColor = System.Drawing.Color.Green;
            btnSave.Visible = false;
            Response.Redirect("CommentViewer.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        else
        {
            lblState.Text = "خطاء في الحفظ";
            lblState.ForeColor = System.Drawing.Color.Red;
        }
    }
}