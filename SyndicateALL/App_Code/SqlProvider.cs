using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SqlProvider
/// </summary>
public static class SqlProvider
{
  
    #region -   Variables   -
    public static string SqlConStr
    {
        get
        { return ConfigurationManager.ConnectionStrings["ETSDATAConnectionString"].ConnectionString; }
    }
    #endregion
    #region -   Functions   -
    public static DataTable LoadDataTable(string CommandString)
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(CommandString, SqlConStr))
        {
            da.Fill(dt);
        }
        return dt;
    }
    public static bool IsNullOrEmpty(object obj)
    {
        if (obj == null)
            return true;

        if (obj.ToString() == string.Empty)
            return true;
        else
            return false;
    }
    public static void InsertEmptyValue(ref SqlCommand cmd)
    {
        foreach (SqlParameter item in cmd.Parameters)
        {
            if (IsNullOrEmpty(item.Value))
            {
                if (item.SqlDbType == SqlDbType.Bit)
                    item.Value = "False";
                else
                    item.Value = DBNull.Value;
            }

        }
    }
    #endregion
    #region - Event Handlers -
    
    #endregion

	
}