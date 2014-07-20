using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Main
/// </summary>
public class Main
{

    #region -   Variables   -
 
    
    
       
#endregion
    
    #region -   Functions   -
    public static string UserID
    {
        get
        {
            if (HttpContext.Current.Session["UserID"] != null)
                return HttpContext.Current.Session["UserID"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["UserID"] = value;

        }
    }
    public static SqlConnection GetConnection
    {
        get
        {
            SqlConnection con = new SqlConnection();
			//con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("App_Data/FXHome.mdb");
            con.ConnectionString = @"Data Source=.;Initial Catalog=FXHome;Persist Security Info=True;User ID=sa;Password=123456";
        return con;
        }
    }
    public static DataTable LoadTable(string CommandText)
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(CommandText, GetConnection))
        {
            da.Fill(dt);
        }
        return dt;
    }
    public static bool LoginRequest(string username, string password)
    {
        bool returnMe;
        using (SqlCommand cmd = new SqlCommand("LoginRequest", GetConnection))
        {
            cmd.Parameters.Add("userName", SqlDbType.NVarChar).Value = username;
            cmd.Parameters.Add("password", SqlDbType.NVarChar).Value = password;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Connection.Open();
                returnMe = Convert.ToBoolean(cmd.ExecuteScalar());
                cmd.Connection.Close();
                
            }
            catch
            {
                throw;
            }
            return returnMe;
        }

        
    }
    #endregion
	
}