using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_register : System.Web.UI.UserControl
{
    DB db = new DB();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected DateTime getDate()
    {
        DateTime date = new DateTime();
        date = Convert.ToDateTime(DropDownday.SelectedValue +"/"+DropDownMonthe +"/"+year);
        return date;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (db.validUser(username.Text))
        {
            db.register(name.Text, tel.Text, mobile.Text, e_mail.Text, RadioGender.SelectedValue, getDate(), countery.Text, city.Text, job.Text, address.Text, DropDownKind.SelectedValue, username.Text, password.Text);
            clearTxtBox();
        }
    }

    private void clearTxtBox()
    {
        name.Text = string.Empty;
        tel.Text = string.Empty;
        mobile.Text = string.Empty;
        e_mail.Text = string.Empty;
        city.Text = string.Empty;
        job.Text = string.Empty;
        address.Text = string.Empty;
        username.Text = string.Empty;
        password.Text = string.Empty;
        passwordconverm.Text = string.Empty;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
}
