using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_HomeWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StudentGeneralHomeWork1.ev += new UserControls_StudentGeneralHomeWork.del(StudentGeneralHomeWork1_ev);
        StudentGeneralHomeWork2.ev += new UserControls_StudentGeneralHomeWork.del(StudentGeneralHomeWork2_ev);
    }

    void StudentGeneralHomeWork2_ev(int id, bool SpecialHomeWork)
    {
        STudentHomeWorkDetails1.FillDetails(id, SpecialHomeWork);
        ModalPopupExtender3.Show();
        StudentGeneralHomeWork2.fillGrid();
    }

    void StudentGeneralHomeWork1_ev(int id, bool SpecialHomeWork)
    {
        STudentHomeWorkDetails1.FillDetails(id, SpecialHomeWork);
        ModalPopupExtender3.Show();
        StudentGeneralHomeWork1.fillGrid();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}
