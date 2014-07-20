using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ViewTitle : System.Web.UI.UserControl
{
    public static string LangID
    {
        get
        {
            if (HttpContext.Current.Session["LangID"] != null)
                return HttpContext.Current.Session["LangID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["LangID"] = value;
        }
    }
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
    private void LoadData(string LangID)
    {
        //string constr = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/fbiegypt.com/wwwroot/magazine/App_Data/NewsDB.mdb"));
        string constr = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", MapPath("~/App_Data/NewsDB.mdb"));
        DataTable dt = new DataTable("FX2011-01");
        string commandstring = string.Empty;
        if (Request.QueryString["NewID"] != null)
        {
            commandstring = @"Select NewsContain From News Where NewsID = " + Request.QueryString["NewID"].ToString();
            OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
            da.Fill(dt);
            if (dt.Rows.Count != 0)
                LblNewsContain.Text = dt.Rows[0][0].ToString();
            else
                LblNewsContain.Text = string.Empty;
            GridViewNewsTitle.DataSource = new DataTable("FX2011-01");
            GridViewNewsTitle.DataBind();
            BtnBack.Visible = true;
        }
        else
        {
            string GoURL = Request.RawUrl.Substring(0, Request.RawUrl.LastIndexOf("aspx")+4);
            commandstring = String.Format("Select '' AS RowNo, '{0}?NewID=' & NewsID AS GoURL, NewsID, NewsTitle From News Where Format(NewsStartDate, 'DD-MM-YYYY') <= Format(Date(), 'DD-MM-YYYY') AND Format(NewsEndDate, 'DD-MM-YYYY') >= Format(Date(), 'DD-MM-YYYY') AND LangID = {1}", GoURL, LangID);
            OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
            da.Fill(dt);
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                i++;
                row["RowNo"] = i + " - ";
            }
            
            GridViewNewsTitle.DataSource = dt;
            GridViewNewsTitle.DataBind();
            LblNewsContain.Text = string.Empty;
            BtnBack.Visible = false;
            //
        }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            switch (LangID)
            {
                case "1":
                    LoadData(LangID);
                    break;
                case "2":
                    LoadData(LangID);
                    break;
                case "3":
                    LoadData(LangID);
                    break;
                default:
                    LoadData("1");
                    break;
            }
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        string GoURL = Request.RawUrl.Substring(0, Request.RawUrl.LastIndexOf("aspx") + 4);
        Response.Redirect(GoURL);
    }
}