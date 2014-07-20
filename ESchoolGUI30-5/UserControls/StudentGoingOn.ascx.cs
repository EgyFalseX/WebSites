using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_StudentGoingOn : System.Web.UI.UserControl
{
    public delegate void dg(int id);
    public event dg myevent;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            RadioButtonList1.SelectedIndex = 0;
            TextBox2.Text = DateTime.Now.ToShortDateString();
            TextBox3.Text = DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0)).ToShortDateString();
            FillDrop();
        }
        FillGrid();
    }
   public void FillDrop()
    {
        DropDownList1.DataSource = new Codes().ReplyTypes();
        DropDownList1.DataTextField = "reply_name";
        DropDownList1.DataValueField = "reply_code";
        DropDownList1.DataBind();
    }
   public void FillGrid()
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            GridView1.DataSource = new Students().GetMyGoingON(null);
        }
        else if (RadioButtonList1.SelectedIndex == 1)
        {
            GridView1.DataSource = new Students().GetMyGoingON("reply_code = " + DropDownList1.SelectedValue);
        }
        else if (RadioButtonList1.SelectedIndex == 2)
        {
            string s = "DateValue(add_date) = DateValue('"+ DateTime.Now.ToShortDateString() + "')";
            GridView1.DataSource = new Students().GetMyGoingON(s);
           
        }
        else if (RadioButtonList1.SelectedIndex == 3)
        {
            string s = "DateValue(add_date) = DateValue('" + DateTime.Now.Subtract(new TimeSpan(1,0,0,0)).ToShortDateString() + "')";
            GridView1.DataSource = new Students().GetMyGoingON(s);
        }
        else if (RadioButtonList1.SelectedIndex == 4)
        {
            string s = "DatePart('yyyy',add_date) = DatePart('yyyy','" + DateTime.Now.ToShortDateString() + "') and DatePart('m',add_date) = DatePart('m','"+ DateTime.Now.ToShortDateString() + "')" ;
            GridView1.DataSource = new Students().GetMyGoingON(s);
        }
        else if (RadioButtonList1.SelectedIndex == 5)
        {
            string mind;
            string maxd;
            if (Convert.ToDateTime(TextBox2.Text) > Convert.ToDateTime(TextBox3.Text))
            {
                maxd = TextBox2.Text;
                mind = TextBox3.Text;
            }
            else
            {
                maxd = TextBox3.Text;
                mind = TextBox3.Text;
            }
            string s = "DateValue(add_date) >= DateValue('" + mind + "')" + " and DateValue(add_date) <= DateValue('" + maxd + "')" ;
            GridView1.DataSource = new Students().GetMyGoingON(s);
        }
        GridView1.DataBind();
       
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().ReplyTypeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 1)
        {
            DropDownList1.Visible = true;
            Panel1.Visible = false;
        }
        else if (RadioButtonList1.SelectedIndex == 5)
        {
            Panel1.Visible = true;
            DropDownList1.Visible = false;
        }
        else
        {
            DropDownList1.Visible = false;
            Panel1.Visible = false;
        }
        FillGrid();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillGrid();
    }
    public int SelectedIndex { get { if (GridView1.SelectedIndex != -1) { return Convert.ToInt32(GridView1.SelectedDataKey.Value); } else return -1; } }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        myevent(Convert.ToInt32((sender as LinkButton).CommandArgument));
        General.SearchPoPUp(Page.Master, "ModalPopupExtender3").Show();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
}
