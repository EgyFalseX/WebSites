using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.OleDb;

public partial class Admin : System.Web.UI.UserControl
{
    public static string ConvertToDateDMY(string PDate)
    {
        //Format('', 'DD-MM-YYYY')
        string ReturnMe = string.Empty;
        DateTime MyDate = Convert.ToDateTime(PDate);
        if (MyDate.Day.ToString().Length == 1)
            ReturnMe += "0" + MyDate.Day;
        else
            ReturnMe += MyDate.Day;
        if (MyDate.Month.ToString().Length == 1)
            ReturnMe += "-0" + MyDate.Month;
        else
            ReturnMe += "-" + MyDate.Month;
        ReturnMe += "-" + MyDate.Year;
        return ReturnMe;
    }
    private void LoadData()
    {
        string constr = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/App_Data/NewsDB.mdb"));
        //string constr = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/fbiegypt.com/wwwroot/magazine/App_Data/NewsDB.mdb"));
        //string constr = System.Configuration.ConfigurationManager.ConnectionStrings["AccessConnectionString"].ConnectionString;
        OleDbDataAdapter da = new OleDbDataAdapter("Select NewsID, NewsTitle, NewsContain, Format(NewsStartDate, 'DD-MM-YYYY') AS NewsStartDate, Format(NewsEndDate, 'DD-MM-YYYY') AS NewsEndDate, (Select LangName From Lang Where LangID = News.LangID) AS LangName From News", constr);
        DataTable dt = new DataTable("FX2011-01");
        da.Fill(dt);
        GridViewNews.DataSource = dt;
        GridViewNews.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (TxtNewsTitle.Text.Trim().Length == 0 || TxtNewsContain.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل عنوان و تفاصيل الخبر";
            LblState.ForeColor = Color.Red;
            return;   
        }
        using (OleDbConnection con = new OleDbConnection(string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/App_Data/NewsDB.mdb"))))
        {
            OleDbCommand cmd = new OleDbCommand("", con);
            try
            {
                string NewsTitle = String.Format("'{0}'", TxtNewsTitle.Text.Trim());
                string NewsContain = String.Format("'{0}'", TxtNewsContain.Text.Trim());
                string NewsStartDate = String.Format("Format('{0}', 'DD-MM-YYYY')", ConvertToDateDMY(CNewsStartDate.SelectedDate.ToShortDateString()));
                string NewsEndDate = String.Format("Format('{0}', 'DD-MM-YYYY')", ConvertToDateDMY(CNewsEndDate.SelectedDate.ToShortDateString()));
                cmd.CommandText = String.Format(@"Insert Into News (NewsTitle, NewsContain, NewsStartDate, NewsEndDate, LangID) VALUES ({0}, {1}, {2}, {3}, {4})", NewsTitle, NewsContain, NewsStartDate, NewsEndDate, DDLLangID.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                LblState.Text = "تم الاضافه";
                LblState.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                LblState.Text = ex.Message;
                LblState.ForeColor = Color.Red;
            }
            con.Close();
            LoadData();
        }
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gr = (GridViewRow)btn.Parent.Parent;
        HiddenField hd = (HiddenField)gr.FindControl("HiddenFieldNewsID");
        using (OleDbConnection con = new OleDbConnection(string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/App_Data/NewsDB.mdb"))))
        {
            OleDbCommand cmd = new OleDbCommand("", con);
            try
            {
                cmd.CommandText = "Delete From News Where NewsID = " + hd.Value;
                con.Open();
                cmd.ExecuteNonQuery();
                LblState.Text = "تم الحذف";
                LblState.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                LblState.Text = ex.Message;
                LblState.ForeColor = Color.Red;
            }
            con.Close();
            LoadData();
        }
    }

    protected void GridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewNews.PageIndex = e.NewPageIndex;
        LoadData();
    }
}