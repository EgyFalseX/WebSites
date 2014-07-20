using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class TestTable : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //HiddenField1.Value = Login.CurrentYear;
            filldrops();
        }

    }
    DB db = new DB();
    public void filldrops()
    {
        db.filltermDrop(dropTerm);
        db.fillSofofDrop(dropClass);
    }
    protected void btntestTable_Click(object sender, EventArgs e)
    {
        if (dropTerm.SelectedItem.Value.Trim() == "0")
        {
            Response.Write("<script>alert('برجاء اختيار الترم')</script>");
        }
        else
        {
            loadrepeater();
        }
    }
    protected void dropTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        db.filltaqoumDrop(dropteqym, Convert.ToInt32(dropTerm.SelectedItem.Value));
    }
    public void loadrepeater()
    {
        GridView1.DataSource= db.gettermTestTable(dropTerm.SelectedItem.Value, dropteqym.SelectedItem.Value, Login.CurrentYear ,dropClass.SelectedItem.Value);
        GridView1.DataBind();
    }
    public string getday(string id)
    {
        switch (id)
        {
            case "1":
                return "السبت";
                break;
            case "2":
                return "الاحد";
                break;
            case "3":
                return "الاثنين";
                break;
            case "4":
                return "الثلاثاء";
                break;
            case "5":
                return "الاربعاء";
                break;
            case "6":
                return "الخميس";
                break;
            default:
                return "";
                break;
        }
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            HiddenField hd = (HiddenField)gr.FindControl("HiddenField1");
            Label lb = (Label)gr.FindControl("Label1");
            lb.Text = getday(hd.Value);
        }
    }
}
