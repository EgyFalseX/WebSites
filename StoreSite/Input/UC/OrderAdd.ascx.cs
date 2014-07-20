using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class UC_OrderAdd : System.Web.UI.UserControl
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
            loadCompanies();
            loadAnnounceWay();
            LoadCommRecive();
        }
    }
    private void loadCompanies()
    {
        SqlConnection con = Functions.MC.EStoreConnection;
        try
        {
            SqlCommand com = new SqlCommand("SELECT     HeadCompanyId as code , HeadCompanyName as Name FROM         CdHeadCompany", con);
            com.Connection.Open();
            SqlDataReader dr = com.ExecuteReader();
            Drop_company.Items.Clear();
            Drop_company.Items.Add(new ListItem("اختر الشركة", "0"));
            while (dr.Read())
            {
                Drop_company.Items.Add(new ListItem(dr["Name"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            con.Close();

        }
        catch
        {

            con.Close();
        }
    }
    private void loadAnnounceWay()
    {
        SqlConnection con = Functions.MC.EStoreConnection;
        try
        {
            SqlCommand com = new SqlCommand("SELECT CommWayId as code, CommWayName as Name FROM         CdCommWay", con);
            com.Connection.Open();
            SqlDataReader dr = com.ExecuteReader();
            Drop_AnnounceWay.Items.Clear();
            Drop_AnnounceWay.Items.Add(new ListItem("اختر طريقة البلاغ", "0"));
            while (dr.Read())
            {
                Drop_AnnounceWay.Items.Add(new ListItem(dr["Name"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            con.Close();

        }
        catch
        {

            con.Close();
        }
    }
    private void LoadCommRecive()
    {
        DDLCommRecive.DataSource = MC.LoadDataTable(@"Select EmpID, EmpName From TblEmp");
        DDLCommRecive.DataTextField = "EmpName";
        DDLCommRecive.DataValueField = "EmpID";
        DDLCommRecive.DataBind();
    }
    private void loadGov(DropDownList drop)
    {
        SqlConnection con = Functions.MC.EStoreConnection;
        try
        {
            SqlCommand com = new SqlCommand("SELECT GOVId as code , GOV as Name FROM CdGov", con);
            com.Connection.Open();
            SqlDataReader dr = com.ExecuteReader();
            drop.Items.Clear();
           drop.Items.Add(new ListItem("اختر المحافظة", "0"));
            while (dr.Read())
            {
                drop.Items.Add(new ListItem(dr["Name"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            con.Close();
        }
        catch
        {
            con.Close();
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        LblState.Text = "";
        //DateTime strartdate =Convert.ToDateTime( txt_announceDate.Text);
        //DateTime enddate = Convert.ToDateTime(txt_VisitDate.Text);
        //if (strartdate > enddate)
        //{
        //    lbl_error.Text = "يجب ان يكون تاريخ البلاغ قبل تاريخ الزيارة او نفسه";
        //    return;
        //}
        if (txt_Customer.Text == "")
        {
            lbl_error.Text = "يجب اختيار العميل اولا";
            return;
        }
        lbl_dropcom.Visible = false;
        lbl_dropway.Visible = false;
        string CommRecive;
        if (DDLCommRecive.SelectedIndex >= 1)
            CommRecive = DDLCommRecive.SelectedValue;
        else
            CommRecive = "NULL";
        if (HiddenField1.Value != "")
        {
            if (Drop_AnnounceWay.SelectedIndex != 0 && Drop_company.SelectedIndex != 0)
            {
                SqlConnection con = Functions.MC.EStoreConnection;
                try
                {
                    SqlCommand com = new SqlCommand("INSERT INTO TblCommunicationes ( HeadCompanyId, HeadcomCommId, CommWayId, CommDate, CustomerId, MaintenanceDate, CommRecive, CommDes, TimeIn, UserIn) VALUES     (" + Drop_company.SelectedItem.Value + " ," + txt_AnnounceNum.Text + "," + Drop_AnnounceWay.SelectedItem.Value + ",convert(datetime,'" + txt_announceDate.Text + "',103)," + HiddenField1.Value + ",convert(datetime,'" + txt_VisitDate.Text + "',103)," + CommRecive + ",'" + txt_Note.Text + "',getdate()," + TheSessions.UserID + ")", con);
                    com.Connection.Open();
                    com.ExecuteNonQuery();
                    com.Connection.Close();
                    LblState.Text = "تم الاضافه";

                }
                catch (Exception)
                {
                    con.Close();
                }
                HiddenField1.Value = "";
            }
            else
            {
                if (Drop_company.SelectedIndex == 0)
                    lbl_dropcom.Visible = true;
                else
                    lbl_dropcom.Visible = false;
                if (Drop_AnnounceWay.SelectedIndex == 0)
                    lbl_dropway.Visible = true;
                else
                    lbl_dropway.Visible = false;

            }
        }
        else
        {
            lbl_error.Text = "يجب اختيار اسم العميل اولا";
        }
       
    }
    protected void btnSelectAccount_Click(object sender, ImageClickEventArgs e)
    {
        txt_ClientName.Text = "";
        ajxPopupLead.Show();
        //ModalPopupExtender2.Show();
    }
    protected void txt_ClientName_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = Functions.MC.EStoreConnection;
        try
        {
            SqlCommand com = new SqlCommand("SELECT TOP (1) TblCustomes.CustomerId, TblCustomes.Customer, TblCustomes.Customer_phone, CdGov.GOV, TblCustomes.Customermobil1,  TblCustomes.Customeraddres FROM         TblCustomes INNER JOIN CdGov ON TblCustomes.GOVId = CdGov.GOVId WHERE     (TblCustomes.Customer= N'" + txt_ClientName.Text + "')", con);
            com.Connection.Open();
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                Panel_CustDetial.Visible = true;
                HiddenField1.Value = dr["CustomerId"].ToString();
                lbl_CustomerAddress.Text = dr["Customeraddres"].ToString();
                lbl_CustomerMobile1.Text = dr["Customermobil1"].ToString(); ;
                lbl_CustomerName.Text = dr["Customer"].ToString();
                lbl_CustomerPhone.Text = dr["Customer_phone"].ToString();
                lbl_CustomerGov.Text = dr["GOV"].ToString();

            }
            com.Connection.Close();
        }
        catch
        {
            con.Close();
        }
    }
    protected void btnCancelLead_Click(object sender, EventArgs e)
    {
        txt_ClientName.Text = lbl_CustomerName.Text;
        txt_Customer.Text = lbl_CustomerName.Text;
        Panel_CustDetial.Visible = false;
        txt_ClientName.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txt_Customer.Text = lbl_CustomerName.Text;
        Panel_CustDetial.Visible = false;
        txt_ClientName.Text = "";

    }
    protected void btnAddClient_Click(object sender, ImageClickEventArgs e)
    {
        loadGov(Drop_newGov);
        ModalPopupExtender.Show();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        SqlConnection con = Functions.MC.EStoreConnection;
        try
        {
            string id = MC.GetNewID("TblCustomes", "CustomerId");
            SqlCommand com = new SqlCommand("INSERT INTO TblCustomes (CustomerId, Customer, Customer_phone, GOVId, Customermobil1, Customeraddres,AccountId) VALUES     (" + id+ ",'" + txt_NewCustomer.Text + "','" + txt_newphone.Text + "','" + Drop_newGov.SelectedItem.Value + "','" + txt_newmobile1.Text + "','" + txt_newAddress.Text + "' , 0)", con);
            com.Connection.Open();
            com.ExecuteNonQuery();
            com.Connection.Close();
            HiddenField1.Value = id;
            txt_Customer.Text =  txt_NewCustomer.Text;
            txt_NewCustomer.Text = "";
            txt_newphone.Text = "";
            txt_newmobile1.Text = "";
            txt_newAddress.Text = "";
        }

        catch (Exception)
        {
            con.Close();
        }

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}