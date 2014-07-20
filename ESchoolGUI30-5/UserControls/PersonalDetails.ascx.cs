using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_PersonalDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Students st = new Students ();
        DetailsView1.DataSource = st.GetData("stu_name,Parthday,parthplace_code,dyana_code,code_alnoa,stu_qawme,mohaftha_elmelad,fatherjob,addres,sex_code");
        DetailsView1.DataBind();
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes ();
        (sender as Label).Text = cd.CityName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label2_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.NationalityName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label3_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.SexTypeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label4_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.ReligionName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label5_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.JobName(Convert.ToInt32((sender as Label).Text));
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
