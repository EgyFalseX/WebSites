using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Collections;

/// <summary>
/// Summary description for Class1
/// </summary>
/// 
public enum SessionNames { Empid, RoleID, OrderId};

public class DB
{
    SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["west_crmConnectionString"].ConnectionString);
    SqlCommand sqlcom = new SqlCommand();
    string sqlcomStr = string.Empty;
    public DB()
    {

    }
    #region newclient //by hsalah
    public void FillCounrtAr(DropDownList drop)
    {
        sqlcomStr = "SELECT     CountryID, CountryNameAr FROM         Counrty";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["CountryNameAr"].ToString(), dr["CountryID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }
    public string GetClientIdenty(string ClientNameAr)
    {
        sqlcomStr = "SELECT clientId  FROM Clients    WHERE ClientNameAr = '" + ClientNameAr + "'";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        string id = sqlcom.ExecuteScalar().ToString();

        sqlcon.Close();
        return id;


    }
    public string insertNewClient(string ClientNameAr, string CLientNikNameAr, string CLientEmail, string ClientAddress, string ClientCountry)
    {
        sqlcomStr = "INSERT INTO Clients(ClientNameAr, CLientNikNameAr, CLientEmail, ClientAddress, ClientCountry) VALUES     (@ClientNameAr,@CLientNikNameAr,@CLientEmail,@ClientAddress,@ClientCountry)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@ClientNameAr", ClientNameAr);
        sqlcom.Parameters.AddWithValue("@CLientNikNameAr", CLientNikNameAr);
        sqlcom.Parameters.AddWithValue("@CLientEmail", CLientEmail);
        sqlcom.Parameters.AddWithValue("@ClientAddress", ClientAddress);
        sqlcom.Parameters.AddWithValue("@ClientCountry", ClientCountry);


        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        string row = GetClientIdenty(ClientNameAr);
        return row;
    }
    #endregion
    #region clientphone //hsalah
    public void addclientPhone(string ClientID, string phonenum, string phonetype)
    {
        sqlcomStr = "INSERT INTO ClientPhone (phoneNumber, ClientID, phoneType) VALUES     (@phoneNumber,@ClientID,@phoneType)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@phoneNumber", phonenum);
        sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        sqlcom.Parameters.AddWithValue("@phoneType", phonetype);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();


    }

    public DataSet getclientPhone(string ClientID)
    {
        sqlcomStr = "select phoneNumber, ClientID, phoneType from ClientPhone where ClientID=" + ClientID + "";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);

        return ds;


    }
    #endregion
    #region clientcall //by hsalah
    public void FillBrandAr(DropDownList drop)
    {
        sqlcomStr = "SELECT     BrandId, BrandNameAr FROM         Brand";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["BrandNameAr"].ToString(), dr["BrandId"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }

    public void FillDeviceAr(DropDownList drop)
    {
        sqlcomStr = "SELECT     DeviceID, DeviceNameAr FROM         Devices ";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["DeviceNameAr"].ToString(), dr["DeviceID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }

    public void FillDamageAr(DropDownList drop, string DeviceID)
    {
        sqlcomStr = "SELECT     DamageID, DamageNameAr FROM         DevicesDamages where DeviceID=" + DeviceID + "";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["DamageNameAr"].ToString(), dr["DamageID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }

    public void FillCallTypeAr(DropDownList drop)
    {
        sqlcomStr = "SELECT     CallTypeID, CallTypeNameAr FROM         CallType";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["CallTypeNameAr"].ToString(), dr["CallTypeID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }

    public void FillCallTypeAr(RadioButtonList ral)
    {
        sqlcomStr = "SELECT     CallTypeID, CallTypeNameAr FROM         CallType";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            ral.Items.Add(new ListItem(dr["CallTypeNameAr"].ToString(), dr["CallTypeID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }
    public int insertClienCall(string ClientID, string DeviceDamageID, string agentid, string CallTypeID, string DeviceID, string note)
    {
        sqlcomStr = "INSERT INTO ClientCall(ClientID, DeviceDamageID, agentid, CallTypeID, DeviceID,note) VALUES     (@ClientID,@DeviceDamageID,@agentid,@CallTypeID,@DeviceID,@note)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        sqlcom.Parameters.AddWithValue("@DeviceDamageID", DeviceDamageID);
        sqlcom.Parameters.AddWithValue("@agentid", agentid);
        sqlcom.Parameters.AddWithValue("@CallTypeID", CallTypeID);
        sqlcom.Parameters.AddWithValue("@DeviceID", DeviceID);
        sqlcom.Parameters.AddWithValue("@note", note);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }

    public void AddRelatedOrder(string OrderID, string RelatedOrderID)
    {
        sqlcomStr = "INSERT INTO OrderRelated (OrderID, RelatedOrderID) VALUES     (@OrderID,@RelatedOrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);

        sqlcom.Parameters.AddWithValue("@RelatedOrderID", RelatedOrderID);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();


    }
    public string GetOrderid(string clientId)
    {

        sqlcomStr = "SELECT MAX(Orders.OrderID) AS OrderID FROM Orders INNER JOIN ClientCall ON Orders.CallID = ClientCall.CallID WHERE     (ClientCall.ClientID  =" + clientId + ")";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        string order = sqlcom.ExecuteScalar().ToString();
        sqlcon.Close();
        return order;


    }
    #endregion
    #region clientSearch //by hsalah
    public ArrayList GetClientByPhone(string phonenum)
    {
        ArrayList al = new ArrayList();
        sqlcomStr = "SELECT     ClientPhone.phoneNumber, Clients.clientId, Clients.ClientNameAr, Clients.CLientNikNameAr, Clients.CLientEmail, Clients.ClientAddress,  Clients.ClientCountry, Counrty.CountryNameAr FROM         ClientPhone left outer JOIN Clients ON ClientPhone.ClientID = Clients.clientId left outer JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID WHERE     (ClientPhone.phoneNumber = '" + phonenum + "')";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            al.Add(dr["clientId"].ToString());
            al.Add(dr["ClientNameAr"].ToString());
            al.Add(dr["CLientNikNameAr"].ToString());
            al.Add(dr["ClientAddress"].ToString());
            al.Add(dr["CountryNameAr"].ToString());
            al.Add(dr["CLientEmail"].ToString());
            al.Add(getclientPhone(al[0].ToString()));
        }
        dr.Close();
        sqlcon.Close();
        return al;


    }
    public ArrayList GetClientByClientNameAr(string ClientNameAr)
    {
        ArrayList al = new ArrayList();
        sqlcomStr = "SELECT     ClientPhone.phoneNumber, Clients.clientId, Clients.ClientNameAr, Clients.CLientNikNameAr, Clients.CLientEmail, Clients.ClientAddress,  Clients.ClientCountry, Counrty.CountryNameAr FROM      Clients    left outer JOIN ClientPhone  ON ClientPhone.ClientID = Clients.clientId left outer JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID WHERE     (Clients.ClientNameAr = '" + ClientNameAr + "')";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            al.Add(dr["clientId"].ToString());
            al.Add(dr["ClientNameAr"].ToString());
            al.Add(dr["CLientNikNameAr"].ToString());
            al.Add(dr["ClientAddress"].ToString());
            al.Add(dr["CountryNameAr"].ToString());
            al.Add(dr["CLientEmail"].ToString());
            al.Add(getclientPhone(al[0].ToString()));
        }
        dr.Close();
        sqlcon.Close();
        return al;


    }
    public string GetClientByid(string clientId)
    {

        sqlcomStr = "SELECT    CLientNikNameAr   + '/' + ClientNameAr AS name FROM         Clients WHERE     (clientId = " + clientId + ")";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        string name = sqlcom.ExecuteScalar().ToString();
        sqlcon.Close();
        return name;


    }
    public DataSet GetClientCallHistory(string ClientID)
    {

        //sqlcomStr = "SELECT     ClientCall.ClientID, ClientCall.callreason, Devices.DeviceNameAr, Brand.BrandNameAr, Employe.EmpNameAr, WorkPlace.PlaceNameAr,  ClientCall.date, ClientCall.note, DevicesDamages.DamageNameAr, ClientCall.CallID FROM Devices INNER JOIN Brand ON Devices.BrandId = Brand.BrandId INNER JOIN ClientCall ON Devices.DeviceID = ClientCall.DeviceID INNER JOIN Agents ON ClientCall.agentid = Agents.UserID INNER JOIN Employe ON Agents.empID = Employe.Empid INNER JOIN WorkPlace ON Employe.PlaceID = WorkPlace.PlaceID left OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID WHERE     (ClientCall.ClientID = " + ClientID + ") ORDER BY ClientCall.CallID DESC";


        sqlcomStr = "SELECT     ClientCall.ClientID, Devices.DeviceNameAr, Brand.BrandNameAr, Employe.EmpNameAr, WorkPlace.PlaceNameAr,  ClientCall.date, ClientCall.note, DevicesDamages.DamageNameAr, ClientCall.CallID FROM Devices INNER JOIN Brand ON Devices.BrandId = Brand.BrandId INNER JOIN ClientCall ON Devices.DeviceID = ClientCall.DeviceID INNER JOIN Employe ON ClientCall.agentid = Employe.Empid  INNER JOIN WorkPlace ON Employe.PlaceID = WorkPlace.PlaceID left OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID WHERE     (ClientCall.ClientID = " + ClientID + ") ORDER BY ClientCall.CallID DESC";

        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);


        return ds;


    }

    public ArrayList GetcallData(string callid)
    {
        ArrayList al = new ArrayList();
        sqlcomStr = "SELECT     ClientCall.ClientID, Devices.DeviceNameAr, Brand.BrandNameAr, Employe.EmpNameAr, WorkPlace.PlaceNameAr, ClientCall.date, ClientCall.note,                       DevicesDamages.DamageNameAr, ClientCall.CallID, ClientCall.CallTypeID  FROM         Devices INNER JOIN                      Brand ON Devices.BrandId = Brand.BrandId INNER JOIN                      ClientCall ON Devices.DeviceID = ClientCall.DeviceID INNER JOIN                      Employe ON ClientCall.agentid = Employe.Empid INNER JOIN                      WorkPlace ON Employe.PlaceID = WorkPlace.PlaceID LEFT OUTER JOIN                      DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID where (ClientCall.CallID=" + callid + ")";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            al.Add(dr["CallTypeID"].ToString());
            al.Add(dr["DeviceNameAr"].ToString());
            al.Add(dr["BrandNameAr"].ToString());
            al.Add(dr["DamageNameAr"].ToString());
            al.Add(dr["note"].ToString());

        }
        dr.Close();
        sqlcon.Close();
        return al;


    }

    public DataSet GetClientOrderByDeviceID(string ClientID, string DeviceID)
    {

        sqlcomStr = "SELECT     ClientCall.CallTypeID, ClientCall.DeviceID, ClientCall.DeviceDamageID, ClientCall.ClientID, Orders.OrderStatus, Orders.OrderDate, Employe.EmpNameAr, Orders.Price, Orders.Note, DevicesDamages.DamageNameAr, OrderStatus.OrderStatusNameAr, OrderRelated.RelatedOrderID, Orders.OrderID FROM         Orders INNER JOIN ClientCall ON Orders.CallID = ClientCall.CallID INNER JOIN Employe ON Orders.empID = Employe.Empid INNER JOIN OrderStatus ON Orders.OrderStatus = OrderStatus.OrderStatusID LEFT OUTER JOIN OrderRelated ON Orders.OrderID = OrderRelated.OrderID LEFT OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID where ClientCall.DeviceID = " + DeviceID + " and ClientCall.ClientID = " + ClientID + "";

        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        //sqlcom.Parameters.AddWithValue("@DeviceID", DeviceID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);


        return ds;


    }

    #endregion
    #region orders //by hsalah
    public DataSet GetDefectOrders()
    {
        sqlcomStr = "SELECT     Orders.OrderID, Orders.CallID, Orders.OrderDate, Orders.Done, Counrty.CountryNameAr, Clients.ClientNameAr, CallType.CallTypeID,  Devices.DeviceNameAr, Brand.BrandNameAr, DevicesDamages.DamageNameAr, Clients.ClientAddress, ClientCall.date, Orders.empID,  Employe.EmpNameAr, OrderStatus.OrderStatusNameAr, OrderStatus.OrderStatusID FROM         Orders INNER JOIN ClientCall ON Orders.CallID = ClientCall.CallID INNER JOIN Clients ON ClientCall.ClientID = Clients.clientId INNER JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID INNER JOIN Devices ON ClientCall.DeviceID = Devices.DeviceID INNER JOIN CallType ON ClientCall.CallTypeID = CallType.CallTypeID INNER JOIN Brand ON Devices.BrandId = Brand.BrandId INNER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID LEFT OUTER JOIN OrderStatus ON Orders.OrderStatus = OrderStatus.OrderStatusID LEFT OUTER JOIN Employe ON Orders.empID = Employe.Empid WHERE     (Orders.Done = 0) AND (CallType.CallTypeID = 1)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);

        return ds;


    }
    public int AddEmpToOrder(string OrderID, string empID, string orderstatus)
    {
        sqlcomStr = "UPDATE    Orders SET              empID = @empID, OrderStatus = @OrderStatus WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@empID", empID);
        sqlcom.Parameters.AddWithValue("@OrderStatus", orderstatus);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public int AddEmpToOrder(string OrderID, string empID)
    {
        sqlcomStr = "UPDATE    Orders SET              empID = @empID , OrderDate=@OrderDate WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@empID", empID);
        sqlcom.Parameters.AddWithValue("@OrderDate", DateTime.Now);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public DataSet GetComplainOrders()
    {
        sqlcomStr = "SELECT     Orders.OrderID, Orders.CallID, Orders.OrderDate, Orders.Done, Counrty.CountryNameAr, Clients.ClientNameAr, CallType.CallTypeID,  Devices.DeviceNameAr, Brand.BrandNameAr, DevicesDamages.DamageNameAr, Clients.ClientAddress, ClientCall.date, Orders.empID,  Employe.EmpNameAr, OrderStatus.OrderStatusNameAr, OrderStatus.OrderStatusID FROM         Orders INNER JOIN ClientCall ON Orders.CallID = ClientCall.CallID INNER JOIN Clients ON ClientCall.ClientID = Clients.clientId INNER JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID INNER JOIN Devices ON ClientCall.DeviceID = Devices.DeviceID INNER JOIN CallType ON ClientCall.CallTypeID = CallType.CallTypeID INNER JOIN Brand ON Devices.BrandId = Brand.BrandId LEFT OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID LEFT OUTER JOIN OrderStatus ON Orders.OrderStatus = OrderStatus.OrderStatusID LEFT OUTER JOIN Employe ON Orders.empID = Employe.Empid WHERE     (Orders.Done = 0) AND (CallType.CallTypeID = 2)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public int AddNoteToOrder(string OrderID, string Note, bool Done)
    {
        sqlcomStr = "UPDATE    Orders SET  Note=@Note , Done=@Done WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@Note", Note);
        sqlcom.Parameters.AddWithValue("@Done", Done);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public DataSet GetSalesOrders()
    {
        sqlcomStr = "SELECT     Orders.OrderID, Orders.CallID, Orders.OrderDate, Orders.Done, Counrty.CountryNameAr, Clients.ClientNameAr, CallType.CallTypeID,  Devices.DeviceNameAr, Brand.BrandNameAr, DevicesDamages.DamageNameAr, Clients.ClientAddress, ClientCall.date, Orders.empID,  Employe.EmpNameAr, OrderStatus.OrderStatusNameAr, OrderStatus.OrderStatusID FROM         Orders INNER JOIN ClientCall ON Orders.CallID = ClientCall.CallID INNER JOIN Clients ON ClientCall.ClientID = Clients.clientId INNER JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID INNER JOIN Devices ON ClientCall.DeviceID = Devices.DeviceID INNER JOIN CallType ON ClientCall.CallTypeID = CallType.CallTypeID INNER JOIN Brand ON Devices.BrandId = Brand.BrandId LEFT OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID LEFT OUTER JOIN OrderStatus ON Orders.OrderStatus = OrderStatus.OrderStatusID LEFT OUTER JOIN Employe ON Orders.empID = Employe.Empid WHERE     (Orders.Done = 0) AND (CallType.CallTypeID = 3)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public int AddSaleNoteToOrder(string OrderID, string Note, bool Done, string Price)
    {
        sqlcomStr = "UPDATE    Orders SET  Note=@Note , Done=@Done , Price=@Price WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@Note", Note);
        sqlcom.Parameters.AddWithValue("@Done", Done);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);
        sqlcom.Parameters.AddWithValue("@Price", Price);
        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public int AddDelverSaleOrder(string OrderID, string Note, bool Done, string Price, string OrderStatus)
    {
        sqlcomStr = "UPDATE    Orders SET  Note=@Note , Done=@Done , Price=@Price ,OrderStatus=@OrderStatus WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@Note", Note);
        sqlcom.Parameters.AddWithValue("@Done", Done);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);
        sqlcom.Parameters.AddWithValue("@Price", Price);
        sqlcom.Parameters.AddWithValue("@OrderStatus", OrderStatus);
        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public ArrayList GetOrderData(string OrderId)
    {
        ArrayList al = new ArrayList();
        sqlcomStr = "SELECT     Orders.OrderID, Clients.ClientNameAr, Clients.ClientAddress, CallType.CallTypeNameAr, ClientCall.date, OrderStatus.OrderStatusNameAr,  Devices.DeviceNameAr, Brand.BrandNameAr FROM         ClientCall INNER JOIN Orders ON ClientCall.CallID = Orders.CallID INNER JOIN Devices ON ClientCall.DeviceID = Devices.DeviceID INNER JOIN Brand ON Devices.BrandId = Brand.BrandId INNER JOIN CallType ON ClientCall.CallTypeID = CallType.CallTypeID INNER JOIN Clients ON ClientCall.ClientID = Clients.clientId INNER JOIN Counrty ON Clients.ClientCountry = Counrty.CountryID LEFT OUTER JOIN OrderStatus ON Orders.OrderStatus = OrderStatus.OrderStatusID WHERE     (Orders.OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.Add("@OrderID", OrderId);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            al.Add(dr["OrderID"].ToString());
            al.Add(dr["ClientNameAr"].ToString());
            al.Add(dr["ClientAddress"].ToString());
            al.Add(dr["CallTypeNameAr"].ToString());
            al.Add(dr["date"].ToString());
            al.Add(dr["OrderStatusNameAr"].ToString());
            al.Add(dr["DeviceNameAr"].ToString());
            al.Add(dr["BrandNameAr"].ToString());


        }
        dr.Close();
        sqlcon.Close();
        return al;


    }

    public int CompleteOrder(string OrderID, string Note, bool Done, string Price, string OrderStatus)
    {
        sqlcomStr = "UPDATE    Orders SET  Note=@Note , Done=@Done , Price=@Price ,OrderStatus=@OrderStatus WHERE     (OrderID = @OrderID)";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcom.Parameters.AddWithValue("@Note", Note);
        sqlcom.Parameters.AddWithValue("@Done", Done);
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);
        sqlcom.Parameters.AddWithValue("@Price", Price);
        sqlcom.Parameters.AddWithValue("@OrderStatus", OrderStatus);
        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    public void FillOrderStatus(DropDownList drop)
    {
        drop.Items.Clear();
        sqlcomStr = "SELECT     OrderStatusID, OrderStatusNameAr FROM         OrderStatus";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            drop.Items.Add(new ListItem(dr["OrderStatusNameAr"].ToString(), dr["OrderStatusID"].ToString()));
        }
        dr.Close();
        sqlcon.Close();


    }
    #endregion
    #region EMpSearch //by hsalah


    public ArrayList GetEMPByEmpNameAr(string EmpNameAr)
    {
        ArrayList al = new ArrayList();
        sqlcomStr = "SELECT      Empid, EmpNameAr FROM         Employe  WHERE     (EmpNameAr = '" + EmpNameAr + "')";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            al.Add(dr["Empid"].ToString());
            al.Add(dr["EmpNameAr"].ToString());

        }
        dr.Close();
        sqlcon.Close();
        return al;


    }

    #endregion
    #region khaledWork

    #region //Emp stock



    /// <summary>
    /// Emp stock 
    /// this code to assign order to Empolyee
    /// created by khaled 
    /// date : 28/8/2010
    /// </summary>
    /// <returns></returns>
    /// 

    public void DMLOrderToEmp(int id, int Empid, int PieceId, int PieceNumber, DateTime date, int OrderId, string statment)
    {

        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = statment;
        sqlcom.Parameters.AddWithValue("@id", id);
        sqlcom.Parameters.AddWithValue("@Empid", Empid);
        sqlcom.Parameters.AddWithValue("@PieceId", PieceId);
        sqlcom.Parameters.AddWithValue("@PieceNumber", PieceNumber);
        sqlcom.Parameters.AddWithValue("@date", date);

        sqlcom.Parameters.AddWithValue("@OrderId", OrderId);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    /// <summary>
    /// assign update order with new emp 
    /// created by khaled 
    /// date : 28/8/2010
    /// </summary>
    /// <returns></returns>
    /// 

    public void UpdateOrderWithEmp(int OrderID, int? empID, int isdone)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandType = CommandType.Text;
        if (empID == null)
            sqlcom.CommandText = "update   Orders  set    empID =NULL ,  Done=@isdone where OrderID =@OrderIDd ";
        else
        {
            sqlcom.CommandText = "update   Orders  set    empID =@empIDd ,  Done=@isdone where OrderID =@OrderIDd ";
            sqlcom.Parameters.AddWithValue("@empIDd", empID);
        }
        sqlcom.Parameters.AddWithValue("@OrderIDd", OrderID);
        sqlcom.Parameters.AddWithValue("@isdone", isdone);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();

    }

    #endregion



    #region //Activation

    public int selectActNumber()
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "SELECT     ActivationNumber FROM     Activation where Act='agent'";


        sqlcon.Open();
        object pageid = sqlcom.ExecuteScalar();
        sqlcon.Close();
        int id = Convert.ToInt32(pageid);
        return id;

    }

    public int SelectCurrentUsers()
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "SELECT     COUNT(RoleID) AS RpleNumber FROM  UserInRole";


        sqlcon.Open();
        object pageid = sqlcom.ExecuteScalar();
        sqlcon.Close();
        int id = Convert.ToInt32(pageid);

        return id;

    }

    #endregion

    #region  check for access

    public bool CheckUser(int Empid, int ObjId)
    {

        sqlcom.Connection = sqlcon;
        sqlcom.Parameters.AddWithValue("@Empid", Empid);
        sqlcom.Parameters.AddWithValue("@ObjId", ObjId);
        sqlcom.CommandText = "SELECT     UserInRole.RoleID FROM     Employe LEFT OUTER JOIN  UserInRole ON Employe.Empid = UserInRole.UserID WHERE     (Employe.Empid =@Empid )";
        sqlcon.Open();
        SqlDataReader readerOfuser = sqlcom.ExecuteReader();
        ArrayList RolesOfuser = new ArrayList();
        int i = 0;
        while (readerOfuser.Read())
        {
            RolesOfuser.Add(readerOfuser["RoleID"].ToString());
            i++;
        }
        readerOfuser.Close();
        sqlcon.Close();
        sqlcom.CommandText = "SELECT     MenuParent.UserRoleID FROM         MenuParent INNER JOIN                    Objects ON MenuParent.MenuParentID = Objects.PairntID WHERE     (Objects.Objid = @Objid)";
        sqlcon.Open();
        SqlDataReader readerofpage = sqlcom.ExecuteReader();
        ArrayList RoleOfPage = new ArrayList();
        int j = 0;
        while (readerofpage.Read())
        {
            RoleOfPage.Add(readerofpage["UserRoleID"].ToString());
            j++;
        }
        readerofpage.Close();
        sqlcon.Close();

        for (int f = 0; f < i; f++)
        {

            for (int k = 0; k < j; k++)
            {
                if (RolesOfuser[f].ToString() == RoleOfPage[k].ToString())
                    return true;

            }
        }

        return false;

    }

    public int GetPageIDbyName(string ObjName, string ObjType)
    {

        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "SELECT    Objid FROM  ObjectType  left outer join  Objects on ObjectType.ObjTypeId = Objects.ObjType where  ObjName = @ObjName and ObjectType.ObjTypeName=@ObjType";

        sqlcom.Parameters.AddWithValue("@ObjName", ObjName);
        sqlcom.Parameters.AddWithValue("@ObjType", ObjType);
        sqlcon.Open();
        object pageid = sqlcom.ExecuteScalar();
        sqlcon.Close();
        int id = Convert.ToInt32(pageid);
        return id;

    }

    #endregion


    #region Select

    public void FillGrid(GridView gv, string selectstament)
    {

        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = selectstament;
        SqlDataAdapter da = new SqlDataAdapter(sqlcom);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv.DataSource = ds;
        gv.DataBind();
        //sqlcon.Open();
        //SqlDataReader reader = sqlcom.ExecuteReader();
        //gv.DataSource = reader;
        //gv.DataBind();
        //reader.Close();
        //sqlcon.Close();
    }


    public void FillDropDownList(DropDownList ddl, string selectstatment, string text, string value)
    {

        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = selectstatment;
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        while (reader.Read())
        {
            ListItem li = new ListItem(reader[text].ToString(), reader[value].ToString());
            ddl.Items.Add(li);
        }
        reader.Close();
        sqlcon.Close();

    }


    #endregion


    #region DMlStore

    public void DmlStore(int StoreId, string StoreName, string StoreAddress, string statment)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = statment;
        sqlcom.Parameters.AddWithValue("@StoreId", StoreId);
        sqlcom.Parameters.AddWithValue("@StoreName", StoreName);
        sqlcom.Parameters.AddWithValue("@StoreAddress", StoreAddress);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    #endregion

    #region DMlBrand

    public void DmlBrand(int BrandId, string BrandNameAr, string BrandNameEn, string statment)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = statment;
        sqlcom.Parameters.AddWithValue("@BrandId", BrandId);
        sqlcom.Parameters.AddWithValue("@BrandNameAr", BrandNameAr);
        sqlcom.Parameters.AddWithValue("@BrandNameEn", BrandNameEn);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    #endregion

    #region DMlDevice

    public void DmlDevice(int DeviceID, string DeviceNameAr, string DeviceNameEn, int BrandId, string statment)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = statment;
        sqlcom.Parameters.AddWithValue("@DeviceID", DeviceID);
        sqlcom.Parameters.AddWithValue("@DeviceNameAr", DeviceNameAr);
        sqlcom.Parameters.AddWithValue("@DeviceNameEn", DeviceNameEn);
        sqlcom.Parameters.AddWithValue("@BrandId", BrandId);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    #endregion

    #region DMlStock

    public void DMlStock(int PieceId, string PieceNameAr, string PieceNameEn, string PieceType, string PieceMadePlace, DateTime buyDate, string DealerName, string BuyPrice, string Serial, int model, string other, string photoPath, int StoreID, int Piececount, string statment)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = statment;
        sqlcom.Parameters.AddWithValue("@PieceId", PieceId);
        sqlcom.Parameters.AddWithValue("@PieceNameAr", PieceNameAr);
        sqlcom.Parameters.AddWithValue("@PieceNameEn", PieceNameEn);
        sqlcom.Parameters.AddWithValue("@PieceType", PieceType);
        sqlcom.Parameters.AddWithValue("@PieceMadePlace", PieceMadePlace);
        sqlcom.Parameters.AddWithValue("@buyDate", buyDate);
        sqlcom.Parameters.AddWithValue("@DealerName", DealerName);
        sqlcom.Parameters.AddWithValue("@BuyPrice", BuyPrice);
        sqlcom.Parameters.AddWithValue("@Serial", Serial);
        sqlcom.Parameters.AddWithValue("@model", model);
        sqlcom.Parameters.AddWithValue("@other", other);
        sqlcom.Parameters.AddWithValue("@photoPath", photoPath);
        sqlcom.Parameters.AddWithValue("@StoreID", StoreID);
        sqlcom.Parameters.AddWithValue("@Piececount", Piececount);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    #endregion




    #region Employee

    public void FillGridEmpandRolles(GridView GV)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "SELECT     Employe.*, Counrty.*, WorkPlace.*, UserInRole.*, Job.*, Roles.* FROM      Employe  left outer JOIN WorkPlace   ON WorkPlace.PlaceID = Employe.PlaceID left outer join Job  ON Employe.JobID = Job.JobID left outer join  Counrty  ON Employe.EmpCountry = Counrty.CountryID LEFT OUTER JOIN UserInRole    ON Employe.Empid = UserInRole.UserID  left outer join  Roles  ON Roles.RoleID = UserInRole.RoleID";
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        GV.DataSource = reader;
        GV.DataBind();
        sqlcon.Close();
    }

    public object SelectEmpIdbyName(string tablename, string userName)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select Empid from Employe where " + tablename + " = '" + userName + "'";
        sqlcon.Open();
        object userid = sqlcom.ExecuteScalar();
        sqlcon.Close();
        return userid;

    }


    public void InsertEmployee(string EmpNameAr, string EmpAddress, int EmpCountry, DateTime EmpBirthDay, string EmpQualification, string EmpMobile, string EmpPhone, int PlaceID, int JobID, string UserName, string PassWord, string Email)
    {
        sqlcomStr = " insert into  Employe (  EmpNameAr,EmpAddress, EmpCountry, EmpBirthDay, EmpQualification, EmpMobile, EmpPhone, PlaceID, JobID, UserName,PassWord, Email) VALUES   (  @EmpNameAr, @EmpAddress, @EmpCountry, @EmpBirthDay, @EmpQualification, @EmpMobile, @EmpPhone, @PlaceID, @JobID, @UserName,@PassWord, @Email)";
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = sqlcomStr;
        sqlcom.Parameters.AddWithValue("@EmpNameAr", EmpNameAr);
        sqlcom.Parameters.AddWithValue("@EmpAddress", EmpAddress);
        sqlcom.Parameters.AddWithValue("@EmpCountry", EmpCountry);
        sqlcom.Parameters.AddWithValue("@EmpBirthDay", EmpBirthDay);
        sqlcom.Parameters.AddWithValue("@EmpQualification", EmpQualification);
        sqlcom.Parameters.AddWithValue("@EmpPhone", EmpPhone);
        sqlcom.Parameters.AddWithValue("@EmpMobile", EmpMobile);
        sqlcom.Parameters.AddWithValue("@PlaceID", PlaceID);
        sqlcom.Parameters.AddWithValue("@JobID", JobID);
        sqlcom.Parameters.AddWithValue("@UserName", UserName);
        sqlcom.Parameters.AddWithValue("@PassWord", PassWord);
        sqlcom.Parameters.AddWithValue("@Email", Email);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }
    public void DeleteEmployee(int Empid)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.Parameters.AddWithValue("@Empid", Empid);

        sqlcon.Open();
        sqlcom.CommandText = "delete from UserInRole  where UserID=@Empid ";
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        sqlcon.Open();
        sqlcom.CommandText = "delete from Employe where Empid=@Empid ";
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();

    }


    public void UpdateEmployee(string EmpNameAr, string EmpAddress, int EmpCountry, DateTime EmpBirthDay, string EmpQualification, string EmpMobile, string EmpPhone, int PlaceID, int JobID, string UserName, string PassWord, string Email, int Empid, int RoleID)
    {
        sqlcomStr = "UPDATE Employe SET EmpNameAr=@EmpNameAr, EmpAddress =@EmpAddress , EmpCountry =@EmpCountry, EmpBirthDay =@EmpBirthDay, EmpQualification =@EmpQualification, EmpPhone =@EmpPhone, EmpMobile =@EmpMobile, PlaceID =@PlaceID, JobID =@JobID,  UserName =@UserName, PassWord =@PassWord, Email =@Email where Empid=@Empid";
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = sqlcomStr;
        sqlcom.Parameters.AddWithValue("@EmpNameAr", EmpNameAr);
        sqlcom.Parameters.AddWithValue("@EmpAddress", EmpAddress);
        sqlcom.Parameters.AddWithValue("@EmpCountry", EmpCountry);
        sqlcom.Parameters.AddWithValue("@EmpBirthDay", EmpBirthDay);
        sqlcom.Parameters.AddWithValue("@EmpQualification", EmpQualification);
        sqlcom.Parameters.AddWithValue("@EmpPhone", EmpPhone);
        sqlcom.Parameters.AddWithValue("@EmpMobile", EmpMobile);
        sqlcom.Parameters.AddWithValue("@PlaceID", PlaceID);
        sqlcom.Parameters.AddWithValue("@JobID", JobID);
        sqlcom.Parameters.AddWithValue("@UserName", UserName);
        sqlcom.Parameters.AddWithValue("@PassWord", PassWord);
        sqlcom.Parameters.AddWithValue("@Email", Email);
        sqlcom.Parameters.AddWithValue("@Empid", Empid);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();


        sqlcomStr = "update UserInRole Set RoleID=@RoleID where UserID=@Empid ";
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = sqlcomStr;
        sqlcom.Parameters.AddWithValue("@RoleID", RoleID);


        sqlcon.Open();
        int result = sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        if (result == 0)
            InsertUserInRole(RoleID, Empid);


    }

    public void UpdateEmployeeWithouitRole(string EmpNameAr, string EmpAddress, int EmpCountry, DateTime EmpBirthDay, string EmpQualification, string EmpMobile, string EmpPhone, int PlaceID, int JobID, int Empid)
    {
        sqlcomStr = "UPDATE Employe SET EmpNameAr=@EmpNameAr, EmpAddress =@EmpAddress , EmpCountry =@EmpCountry, EmpBirthDay =@EmpBirthDay, EmpQualification =@EmpQualification, EmpPhone =@EmpPhone, EmpMobile =@EmpMobile, PlaceID =@PlaceID, JobID =@JobID  where Empid=@Empid";
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = sqlcomStr;
        sqlcom.Parameters.AddWithValue("@EmpNameAr", EmpNameAr);
        sqlcom.Parameters.AddWithValue("@EmpAddress", EmpAddress);
        sqlcom.Parameters.AddWithValue("@EmpCountry", EmpCountry);
        sqlcom.Parameters.AddWithValue("@EmpBirthDay", EmpBirthDay);
        sqlcom.Parameters.AddWithValue("@EmpQualification", EmpQualification);
        sqlcom.Parameters.AddWithValue("@EmpPhone", EmpPhone);
        sqlcom.Parameters.AddWithValue("@EmpMobile", EmpMobile);
        sqlcom.Parameters.AddWithValue("@PlaceID", PlaceID);
        sqlcom.Parameters.AddWithValue("@JobID", JobID);
        sqlcom.Parameters.AddWithValue("@Empid", Empid);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();


    }
        

    public void Updategents(string agentUserName, string agentPass, string agentEmail, int empId)
    {
        sqlcomStr = " update Agents  set   agentPass =@agentPass , agentEmail =@agentEmail ,empID =@empId where  agentUserName = @agentUserName";
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = sqlcomStr;
        sqlcom.Parameters.AddWithValue("@agentUserName", agentUserName);
        sqlcom.Parameters.AddWithValue("@agentPass", agentPass);
        sqlcom.Parameters.AddWithValue("@agentEmail", agentEmail);
        sqlcom.Parameters.AddWithValue("@empId", empId);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
    }

    #endregion

    #region Country
    public void AllCountry(DropDownList ddl)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Counrty";
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        while (reader.Read())
        {
            ListItem li = new ListItem(reader["CountryNameAr"].ToString(), reader["CountryID"].ToString());
            ddl.Items.Add(li);
        }
        reader.Close();
        sqlcon.Close();

    }
    public DataTable SelectAllCountry()
    {
        DataTable table = new DataTable();
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Counrty";
        SqlDataAdapter adapter = new SqlDataAdapter(sqlcom);
        adapter.Fill(table);
        return table;
    }

    #endregion


    #region WorkPlace

    public void AllWorkPlace(DropDownList ddl)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from WorkPlace";
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        while (reader.Read())
        {
            ListItem li = new ListItem(reader["PlaceNameAr"].ToString(), reader["PlaceID"].ToString());
            ddl.Items.Add(li);
        }
        reader.Close();
        sqlcon.Close();

    }

    public DataTable SelectAllWorkPalce()
    {
        DataTable table = new DataTable();
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from WorkPlace";
        SqlDataAdapter adapter = new SqlDataAdapter(sqlcom);
        adapter.Fill(table);
        return table;
    }

    #endregion


    #region Jop

    public void AllJop(DropDownList ddljop)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Job";
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        while (reader.Read())
        {
            ListItem li = new ListItem(reader["JobNameAr"].ToString(), reader["JobID"].ToString());
            ddljop.Items.Add(li);
        }
        reader.Close();
        sqlcon.Close();


    }

    public DataTable SelectAllJop()
    {
        DataTable table = new DataTable();
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Jop";
        SqlDataAdapter adapter = new SqlDataAdapter(sqlcom);
        adapter.Fill(table);
        return table;
    }

    #endregion

    #region Roles
    public void AllRoles(DropDownList ddljop)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Roles";
        sqlcon.Open();
        SqlDataReader reader = sqlcom.ExecuteReader();
        while (reader.Read())
        {
            ListItem li = new ListItem(reader["RoleName"].ToString(), reader["RoleID"].ToString());
            ddljop.Items.Add(li);
        }
        reader.Close();
        sqlcon.Close();


    }

    public DataTable SelectAllRoles()
    {
        DataTable table = new DataTable();
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "select * from Roles";
        SqlDataAdapter adapter = new SqlDataAdapter(sqlcom);
        adapter.Fill(table);
        return table;
    }

    public void InsertUserInRole(int RoleID, int UserID)
    {
        sqlcom.Connection = sqlcon;
        sqlcom.CommandText = "insert into UserInRole (RoleID,UserID) VALUES (" + RoleID + "," + UserID + ")";
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();

    }

    #endregion

    //end khaled work
    #endregion
    #region menu //byhsalah
    public DataTable getitems(int PairntID)
    {

        string sqlcomStr = "select * from Objects where PairntID=@PairntID";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        sqlcom.Parameters.AddWithValue("@PairntID", PairntID);


        SqlDataReader dr = sqlcom.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        sqlcon.Close();
        return dt;
    }
    public DataTable getMenuTitle(String RoleIDs)
    {
        string sqlcomStr = "SELECT MenuParentID, MenuParentname,UserRoleID FROM MenuParent where UserRoleID in (" + RoleIDs + ")";
        // com.Parameters.AddWithValue("@RoleIDs", );
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        sqlcon.Close();
        return dt;
    }
    #endregion
    #region hoda

    public DataSet GetorderdatabyID(string orderID)
    {

        sqlcomStr = "SELECT     Orders.OrderID, Employe.EmpNameAr, DevicesDamages.DamageNameAr, Devices.DeviceNameAr, Brand.BrandNameAr FROM  Brand INNER JOIN Devices ON Brand.BrandId = Devices.BrandId INNER JOIN ClientCall ON Devices.DeviceID = ClientCall.DeviceID INNER JOIN Orders ON ClientCall.CallID = Orders.CallID LEFT OUTER JOIN Employe ON Orders.empID = Employe.Empid LEFT OUTER JOIN DevicesDamages ON ClientCall.DeviceDamageID = DevicesDamages.DamageID WHERE     (Orders.OrderID = " + orderID + ")";

        sqlcom = new SqlCommand(sqlcomStr, sqlcon);
        //sqlcom.Parameters.AddWithValue("@ClientID", ClientID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom.CommandText, sqlcon.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);


        return ds;


    }

    public int UpdateOrder(int OrderID)
    {
        sqlcomStr = "UPDATE Orders SET OrderStatus = 4, empID = NULL WHERE (OrderID ="+OrderID+")";
        sqlcom = new SqlCommand(sqlcomStr, sqlcon);       
        sqlcom.Parameters.AddWithValue("@OrderID", OrderID);

        sqlcon.Open();
        int row = sqlcom.ExecuteNonQuery();
        sqlcon.Close();

        return row;
    }
    #endregion
}
