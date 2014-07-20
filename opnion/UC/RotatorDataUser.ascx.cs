using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class RotatorDataUser : System.Web.UI.UserControl
{
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/DataDB.mdb");
    #region - Functions - 
    private DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    private string Insertcontact(string IDElement, string name, string mail, string msg)
    {
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO RotatorData (IDElement, name, mail, userreply)
            VALUES ({0}, '{1}', '{2}', '{3}')", IDElement, name, mail, msg);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            return ex.Message;
        }
        con.Close();
        return string.Empty;
    }
    private void ClearForm()
    {
        Txtname.Text = string.Empty;
        Txtmail.Text = string.Empty;
        Txtmassage.Text = string.Empty;
        Txtname.Focus();
    }
    #endregion
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("../ChooseRotatorElement.aspx");
                return;
            }
            else
            {
                //show selected element caption
                DataTable dt = LoadTable("SELECT Caption FROM RotatorElement WHERE IDElement = " + Request.QueryString["id"]);
                if (dt.Rows.Count != 0)
                    LblCaption.Text = dt.Rows[0][0].ToString();
                else
                {
                    Response.Redirect("../ChooseRotatorElement.aspx");
                    return;
                }

            }
        }
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (Txtname.Text.Trim().Length == 0 || Txtmassage.Text.Trim().Length == 0 || Txtmail.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك اكمل البيانات المطلوبه";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string Result = Insertcontact(Request.QueryString["id"].ToString(), Txtname.Text.Trim(), Txtmail.Text.Trim(), Txtmassage.Text.Trim());
        if (Result == string.Empty)
        {
            LblState.Text = "تم ارسال المشاركه .. شكرا لك";
            LblState.ForeColor = System.Drawing.Color.Green;
            ClearForm();
            return;
        }
        else
        {
            LblState.Text = Result;
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
    }
    #endregion
    
}