using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class MInformationl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee EMP = new Employee();
      
        
        DetailsView1.DataSource = EMP.GetData();
        //DetailsView1.DataSource = EMP.GetData("NOEDARET,NOSCHOOL,NAME,STAT,TAT,SEX,ADDRESS,BIRTHD,—ﬁ„_«· ·Ì›Ê‰,«·Ã‰”Ì…,«·„Õ„Ê·,«·»—Ìœ_«·«·ﬂ —Ê‰Ï,«·œÌ«‰…,ﬂÊœ«·„«œ…ﬂÊœ«·„—Õ·…, Œ’’_«·„ƒÂ·");
        DetailsView1.DataBind();
    }

    protected void Edarah_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.EdarahName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Elmarhla_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.MarhlaName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_School_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.SchoolName(Convert.ToInt64((sender as Label).Text));
    }
    protected void lbl_Nationality_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.NationalityName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Religion_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.ReligionName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_MStatus_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.MaritalStatus(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Almadah_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.ElmadahName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Gender_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.SexTypeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Edara_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.EdarahName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Qualifieds_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().QualifiedeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        DetailsView1.PageIndex = e.NewPageIndex;
        DetailsView1.DataBind();
    }
}
