using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Configuration;
using System.Data.SqlClient;
using Functions;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class AutoComplete : WebService
{
    public AutoComplete()
    {
    }
    [WebMethod(EnableSession = true)]
    public string[] GetCompletionList(string prefixText, int count)
   {
        if (count == 0)
        {
            count = 10;
        }
        List<string> items = new List<string>(count);
        SqlConnection con = MC.EStoreConnection;
        con.Open();
        SqlCommand com = new SqlCommand("SELECT top " + count + "    Customer, Customernid FROM  TblCustomes WHERE     (Customer LIKE N'" + prefixText + "%')", con);
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {

            //Application["Id"] = dr["stu_code"].ToString();
            items.Add(dr["Customer"].ToString());
        }
       
       
        con.Close();
        return items.ToArray();
    }
    public string[] GetnameeList(string prefixText, int count)
    {
        if (count == 0)
        {
            count = 10;
        }
        List<string> items = new List<string>(count);
        SqlConnection con = MC.EStoreConnection;
        con.Open();
        SqlCommand com = new SqlCommand(String.Format("SELECT TOP {0} HarakaNo, namee FROM TblAlkazna WHERE (namee LIKE N'{1}%')", count, prefixText), con);
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            items.Add(dr["namee"].ToString());
        }
        con.Close();
        return items.ToArray();
    }
  
}

