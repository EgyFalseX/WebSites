using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class NewsDetailsUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //NewsClass s = new NewsClass();
            //System.Data.DataTable dt = new System.Data.DataTable(); 
            //if (Request.QueryString["ID"] != null)
            //{
            //     s.ID = Convert.ToInt32(Request.QueryString["ID"]);
            //     dt = s.GetDataByID();
            //}
            //else
            //{
            //    dt = s.GetData();
            //}
            //DataList1.DataSource = dt;
            //DataList1.DataBind();



            SliderClass s = new SliderClass();


            s.ID = Convert.ToInt32(Request.QueryString["ID"]);
            System.Data.DataTable dt = s.GetSlidersDataByID();
            string y="", text="";
            y= dt.Rows[0][2].ToString();
            if (File.Exists(y))
            {
              
                StreamReader streamReader = new StreamReader(y);
                text = streamReader.ReadToEnd();
              
            }
            //ASPxHtmlEditor1.Html = text;
           // Response.Write("alert('" + y + "')");
            Response.Write("<center><Table width='960' hight='140'><tr><td>");
            Response.Write("<img class='auto-style1' src='../images/Banar.jpg'/>");
            Response.Write("</td></tr>");
            Response.Write("<tr><td>" + text + "</td></tr></table><center>");


        }
    }
