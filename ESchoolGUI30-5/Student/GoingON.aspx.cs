using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_GoingON : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //StudentGoingONDetailsReplies1.GoingONDetails(11);
        StudentGoingOn1.myevent += new UserControls_StudentGoingOn.dg(StudentGoingOn1_myevent);
        StudentGoingONDetailsReplies1.ev += new UserControls_StudentGoingONDetailsReplies.dg(StudentGoingONDetailsReplies1_ev);
    }

    void StudentGoingONDetailsReplies1_ev()
    {
        StudentGoingONDetailsReplies1.UpdateReply(StudentGoingOn1.SelectedIndex);
        StudentGoingOn1.FillGrid();
    }

    void StudentGoingOn1_myevent(int id)
    {
        StudentGoingONDetailsReplies1.GoingONDetails(id);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}
