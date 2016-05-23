using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class NewsDetails1UserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            NewsWebApplication_NewsClass s = new NewsWebApplication_NewsClass();
            System.Data.DataTable dt = new System.Data.DataTable();
            int y=0;
            if (Request.QueryString["ID"] != null)
            {
                try
                {  y = Convert.ToInt32(Request.QueryString["ID"].Substring(0, Request.QueryString["ID"].IndexOf("?"))); }
                catch { y = Convert.ToInt32(Request.QueryString["ID"]); goto c; }

            c:    s.ID = y;
                    dt = s.GetDataByID();

            }
            else
            {
                dt = s.GetData();
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        


        }
    }
