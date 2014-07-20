using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ViewAllMessagesUser : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ASPxDataViewViewer.Visible = true;
            switch (Request.QueryString["id"])
            {
                case null:
                    ASPxDataViewViewer.DataSourceID = "";
                    ASPxDataViewViewer.DataBind();
                    break;
                case "1":
                    ASPxDataViewViewer.DataSourceID = "DSData1";
                    ASPxDataViewViewer.DataBind();
                    break;
                case "2":
                    ASPxDataViewViewer.DataSourceID = "DSData2";
                    ASPxDataViewViewer.DataBind();
                    break;
                case "3":
                    ASPxDataViewViewer.DataSourceID = "DSData3";
                    ASPxDataViewViewer.DataBind();
                    break;
                case "4":
                    ASPxDataViewViewer.DataSourceID = "DSData4";
                    ASPxDataViewViewer.DataBind();
                    break;
                default:
                    break;
            }
        }
    }
  
}