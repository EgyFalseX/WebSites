using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_StudentResponsible : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Students st = new Students();
        DetailsView1.DataSource = st.GetData("walealkmrname , saltalkarba_code , waleaalkamraddres , waleaalkamrjob,waleaalkamr_phone");
        DetailsView1.DataBind();
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.RelativeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label2_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.JobName(Convert.ToInt32((sender as Label).Text));
    }
}
