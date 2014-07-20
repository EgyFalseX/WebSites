using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Functions;
using System.Data.SqlClient;

public partial class UC_CommunicationGrid : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(System.Web.HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadGrid();
        }
    }
    private void LoadGrid()
    {
       
        string sqlcom = "SELECT TblCommunicationes.CommId, TblCommunicationes.HeadcomCommId, TblCommunicationes.CommDate, TblCommunicationes.MaintenanceDate,  TblCommunicationes.CommRecive, TblCommunicationes.CommDes, CdHeadCompany.HeadCompanyName, CdCommWay.CommWayName,  CdCommWay.CommWayId , TblCustomes.Customer, TblCustomes.Customermobil1, CdGov.GOVId, CdGov.GOV FROM         TblCommunicationes INNER JOIN CdHeadCompany ON TblCommunicationes.HeadCompanyId = CdHeadCompany.HeadCompanyId INNER JOIN TblCustomes ON TblCommunicationes.CustomerId = TblCustomes.CustomerId INNER JOIN CdCommWay ON TblCommunicationes.CommWayId = CdCommWay.CommWayId INNER JOIN CdGov ON TblCustomes.GOVId = CdGov.GOVId WHERE     (TblCommunicationes.CommId NOT IN (SELECT     CommId FROM         TblTaskOrder))";
        SqlCommand com = new SqlCommand(sqlcom,MC.EStoreConnection);
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        catch(Exception ex)
        {

        }
    }

    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}
