using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class ViewNews : System.Web.UI.Page
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("../App_Data/news.mdb");
    
    public string LoadTitle()
    {
        if (Request.QueryString["code_news"] == null)
        {
            return string.Empty;
        }

        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbDataAdapter da = new OleDbDataAdapter(String.Format("SELECT news_title FROM News WHERE (code_news = {0})", Request.QueryString["code_news"]), constr);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    RetData = dt.Rows[0]["news_title"].ToString();
                }

            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }
        return HttpUtility.HtmlDecode(RetData);
    }
     
    public string LoadContain()
    {
        if (Request.QueryString["code_news"] == null)
        {
            return string.Empty;
        }
     
        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbDataAdapter da = new OleDbDataAdapter(String.Format("SELECT news_details FROM News WHERE (code_news = {0})", Request.QueryString["code_news"]), constr);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    RetData = dt.Rows[0]["news_details"].ToString();
                }
                
            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }
        return HttpUtility.HtmlDecode(RetData);
    }
   
    public string LoadDate()
    {
        if (Request.QueryString["code_news"] == null)
        {
            return string.Empty;
        }

        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbDataAdapter da = new OleDbDataAdapter(String.Format("SELECT Timeline FROM News WHERE (code_news = {0})", Request.QueryString["code_news"]), constr);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Timeline"].ToString() != string.Empty)
                    {
                        RetData = Convert.ToDateTime(dt.Rows[0]["Timeline"]).ToShortDateString();
                    }
                }

            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }
        return HttpUtility.HtmlDecode(RetData);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

}