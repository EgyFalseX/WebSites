using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_stPayments : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GridView1.DataSource = new Students().Payments();
        //GridView1.DataBind();
        //DataTable dt= new Students().shouldPayed();
        //lblmasrofat.Text = dt.Rows[0][0].ToString();
        //lblrest.Text = Convert.ToDecimal(Convert.ToDecimal(lblmasrofat.Text) -  Convert.ToDecimal(ViewState["payed"].ToString()) - Convert.ToDecimal(ViewState["discount"].ToString())).ToString();
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        //(sender as Label).Text = new Codes().PaymentType(Convert.ToInt32((sender as Label).Text));
    }

    public string getpayed()
    {
        decimal total = 0;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            Label lb1 = (Label)gr.FindControl("Label1");
            if (lb1.Text == "")
                total += Convert.ToDecimal("0");
            else
                total += Convert.ToDecimal(lb1.Text);
        }
        ViewState["payed"] = total;
        return total.ToString();
    }
    public string getdiscount()
    {
        decimal total = 0;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            Label lb2 = (Label)gr.FindControl("Label2");
            if (lb2.Text == "")
                total += Convert.ToDecimal("0");
            else
                total += Convert.ToDecimal(lb2.Text);
        }
        ViewState["discount"] = total;
        return total.ToString();
    }
}
