using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for ET_Lib
/// </summary>
public class ET_Lib
{
    #region -   Variables   -
    public static string DBConStrE_training = ConnectionStr("E_training.mdb");
    public static string EvalItemType_Course = "1";//الخاص بتقيم الدورات ID
    public static string EvalItemType_Ins = "2";//الخاص بتقيم المدربين ID
    public enum EmpType_Enum
    {
        Instructor,Trainer,None
    }
    #endregion
	#region -   Functions   -
    public static bool TryLogin(string username, string password)
    {
        using (OleDbConnection Con = new OleDbConnection(DBConStrE_training))
        {
            OleDbCommand Cmd = new OleDbCommand(String.Format("SELECT EmpId, EmpName, EmpTypeId, RoleID FROM Emp_Data WHERE (UserName = '{0}') AND ([password] = '{1}')", username, password), Con);
            OleDbDataReader DR;
            try
            {
                Con.Open();
                DR = Cmd.ExecuteReader();
                if (DR.HasRows)
                {
                    DR.Read();
                    Empid = DR.GetValue(0).ToString();
                    UserName = DR.GetValue(1).ToString();
                    HttpContext.Current.Session["CEmpType"] = DR.GetValue(2).ToString();
                    if (DR.GetValue(3) != DBNull.Value)
                        ET_Lib.RoleIDs = DR.GetValue(3).ToString();
                    else
                        ET_Lib.RoleIDs = DBNull.Value.ToString();
                    Con.Close();
                    return true;
                }
                else
                {
                    Empid = null;
                    UserName = null;
                    Con.Close();
                    return false;
                }
            }
            catch (Exception)
            {
                Con.Close();
                return false;
            }
        }
    }
    public static OleDbConnection E_trainingConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(DBConStrE_training);
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }
    static string ConnectionStr(string DataBaseName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"~\App_Data\" + DataBaseName);

        return constr;
    }
    public static string Empid
    {
        get
        {
            if (HttpContext.Current.Session["Empid"] != null)
                return HttpContext.Current.Session["Empid"].ToString();
            else return null;
        }
        set
        {
            HttpContext.Current.Session["Empid"] = value;

        }
    }
    public static string UserName
    {
        get { if (HttpContext.Current.Session["EmpName"] != null) return HttpContext.Current.Session["EmpName"].ToString(); else return null; }
        set { HttpContext.Current.Session["EmpName"] = value;}
    }
    public static EmpType_Enum CEmpType
    {
        get
        {
            if (HttpContext.Current.Session["CEmpType"] != null)
            {
                switch (HttpContext.Current.Session["CEmpType"].ToString())
                {
                    case "1":
                        return EmpType_Enum.Trainer;
                    case "2":
                        return EmpType_Enum.Instructor;
                    default:
                        return EmpType_Enum.None;
                }
            }
            else return EmpType_Enum.None;
        }
        set
        {
            HttpContext.Current.Session["CEmpType"] = value;

        }
    }
    public static string RoleIDs
    {
        get { if (HttpContext.Current.Session["RoleIDs"] != null) return HttpContext.Current.Session["RoleIDs"].ToString(); else return null; }
        set { HttpContext.Current.Session["RoleIDs"] = value; }
    }
    public static void EmptyRow(DataTable MyTable)
    {
        DataRow Roz = MyTable.NewRow();
        Roz[0] = DBNull.Value;
        Roz[1] = "-----  لا شيء  -----";
        MyTable.Rows.InsertAt(Roz, 0);

    }
    public static bool CheckEmpType(EmpType_Enum MyEmpType)
    {
        if (Empid == null)
        {
            return false;
        }
        if (MyEmpType == CEmpType)
        {
            return true;
        }
        return false;
    }
    public static int ToInt(string value)
    {
        string returnVal = string.Empty;
        MatchCollection collection = Regex.Matches(value, "\\d+");
        foreach (Match match in collection)
        {
            returnVal += match.ToString();
        }
        int i;
        if (!int.TryParse(returnVal,out i))
        {
            return 0;   
        }
        return i;
    }
    public static string Msg(string MSG)
    {
        return "<script>alert('" + MSG + "');</script>";
    }
    public DataTable getitems(int PairntID)
    {
        OleDbConnection con = E_trainingConnection;
        OleDbCommand com = new OleDbCommand();
        OleDbDataReader dr;

        com.CommandText = ("select * from MENU where PairntID=@PairntID");
        com.Parameters.AddWithValue("@PairntID", PairntID);
        com.Connection = con;
        con.Open();
        dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        return dt;
    }
    public DataTable getMenuTitle(String RoleIDs)
    {
        OleDbConnection con = E_trainingConnection;
        OleDbCommand com = new OleDbCommand();
        OleDbDataReader dr;
        com.CommandText = ("SELECT PairntID, PairntName ,UserRoleID FROM MPairntID where UserRoleID in (" + RoleIDs + ")");
        // com.Parameters.AddWithValue("@RoleIDs", );
        com.Connection = con;
        con.Open();
        dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        return dt;
    }
    #endregion

}
