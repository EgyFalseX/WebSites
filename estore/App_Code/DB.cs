using System;
using System.Collections.Generic;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Web.UI.WebControls;

public class DB
{
	public DB()
	{
	}
    OleDbConnection con = new OleDbConnection();
    OleDbCommand com = new OleDbCommand();
    OleDbDataReader dr;

    public void conn()
    {
        con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("App_Data/DB.mdb");
    }
   
    #region items
    
    public DataTable getitems()
    {
        conn();
         com.CommandText = ("select * from Items"); 
                com.Connection = con;
                con.Open();
                dr = com.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                con.Close();
                return dt;
    }
    public void InsertItem(string item_name,string item_price,string item_des,int item_CatID,string Pic_URL,bool show)
    {
        conn(); 
        con.Open();
        com = new OleDbCommand("insert into Items (item_name,item_price,item_des,item_CatID,Pic_URL,show) values(@item_name,@item_price,@item_des,@item_CatID,@Pic_URL,@show)", con);
        com.Parameters.AddWithValue("@item_name", item_name);
        com.Parameters.AddWithValue("@item_price", item_price);
        com.Parameters.AddWithValue("@item_des", item_des);
        com.Parameters.AddWithValue("@item_CatID", item_CatID);
        com.Parameters.AddWithValue("@Pic_URL", Pic_URL);
        com.Parameters.AddWithValue("@show",show);

       
        com.ExecuteNonQuery();
        con.Close();
    }
    #endregion
    #region category
    public void InsertCat(string Cat_name)  
    {
        conn();
        con.Open();
        com = new OleDbCommand("insert into Items (category) values(@category)", con);
        com.Parameters.AddWithValue("@category", Cat_name);
    


        com.ExecuteNonQuery();
        con.Close();
    }
    //public void fillCatDrop(DropDownList drop)
    //{
    //    conn();
    //    com.CommandText = ("select ID,category from Items");
    //    com.Connection = con;
    //    con.Open();
    //    dr = com.ExecuteReader();
    //    DataTable dt = new DataTable();
    //    dt.Load(dr);
    //    con.Close();
    //    return drop;
    //}

    public void fillCatDrop(DropDownList drop)
    {
        ListItem li = new ListItem();
        conn();
        com.CommandText = ("SELECT     ID,  category  FROM         category  as t WHERE     (parentID IS NULL) union all SELECT     ID, (select category from category  where ID = t.parentID ) + '  > '+category  FROM         category  as t WHERE     (parentID IS NOT NULL)");
        com.Connection = con;
        con.Open();
        dr = com.ExecuteReader();
        //DataTable dt = new DataTable();
        //dt.Load(dr);
        while (dr.Read())
        {
         li = new ListItem(dr["category"].ToString(),dr["ID"].ToString());

            drop.Items.Add(li);
        }
        con.Close();
       
    }

    public DataTable  fillGridCat ()
    {
        
        conn();
        com.CommandText = ("SELECT     ID,  category , parentID , SortOrder  FROM         category  as t WHERE     (parentID IS NULL) union all SELECT     ID, (select category from category where ID = t.parentID ) + '  > '+category  , parentID , SortOrder  FROM         category  as t WHERE     (parentID IS NOT NULL)");
        com.Connection = con;
        con.Open();
        DataSet  ds= new DataSet ();
        dr= com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
                      
        con.Close();
        return dt;
    }


    #endregion

    #region register
    public bool validUser(string UserName)
    {
        bool valid = false;
        conn();
        com.CommandText = ("select count(*) from users where username=@username");
        com.Parameters.AddWithValue("@username", UserName);

        com.Connection = con;
        con.Open();
        int count =Convert.ToInt32( com.ExecuteScalar());
        
        con.Close();

        if (count > 0)
        {
            valid = false;
        }
        else if (count == 0)
        {
            valid = true;
        }
               return valid;
    }

    public void register(string name, string tel, string mobile, string e_mail, string gender, DateTime birth_date, string countery, string city, string job, string address, string company_kind, string username, string password)
    {
        try
        {
            if (validUser(username))
            {
                conn();
                con.Open();
                com = new OleDbCommand("INSERT INTO users ( name, tel, mobile, e_mail, gender, birth_date, countery, city, job, address, company_kind, username, [password] ) values ( @name, @tel, @mobile, @e_mail, @gender, @birth_date, @countery, @city, @job, @address, @company_kind, @username, @password )", con);

                com.Parameters.AddWithValue(" @name", name);
                com.Parameters.AddWithValue("@tel", tel);
                com.Parameters.AddWithValue("@mobile", mobile);
                com.Parameters.AddWithValue("@e_mail", e_mail);
                com.Parameters.AddWithValue("@gender", gender);
                com.Parameters.AddWithValue("@birth_date", birth_date);
                com.Parameters.AddWithValue("@countery", countery);
                com.Parameters.AddWithValue("@city", city);
                com.Parameters.AddWithValue("@job", job);
                com.Parameters.AddWithValue("@address", address);
                com.Parameters.AddWithValue("@company_kind", company_kind);
                com.Parameters.AddWithValue("@username", username);
                com.Parameters.AddWithValue("@password", password);

                com.ExecuteNonQuery();
                con.Close();

            }
          
        }
        catch (Exception ex)
        {

        }
    }
    #endregion
}
