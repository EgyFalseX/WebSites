using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.UserControl
{
    #region - Functions - 
    private void LoadDefaultData()
    {
        DDLsefaid.DataSource = DB.LoadTableABOUT(@"Select sefaid, sefa From sefa");
        DDLsefaid.DataValueField = "sefaid";
        DDLsefaid.DataTextField = "sefa";
        DDLsefaid.DataBind();

        DDLcontypeid.DataSource = DB.LoadTableABOUT(@"Select contypeid, contype From contype");
        DDLcontypeid.DataValueField = "contypeid";
        DDLcontypeid.DataTextField = "contype";
        DDLcontypeid.DataBind();
    }
    private void ClearForm()
    {
        Txtconame.Text = string.Empty;
        DDLsefaid.ClearSelection();
        DDLcontypeid.ClearSelection();
        Txttel.Text = string.Empty;
        Txtmail.Text = string.Empty;
        Txtmassage.Text = string.Empty;
        Txtconame.Focus();
    }
    #endregion
    
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadDefaultData();
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    #endregion
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (Txtconame.Text.Trim().Length == 0 || Txttel.Text.Trim().Length == 0 || Txtmassage.Text.Trim().Length == 0 || DDLsefaid.SelectedValue == string.Empty || DDLcontypeid.SelectedValue == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات المطلوبه";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string Result = DB.Insertcontact(Txtconame.Text.Trim(), DDLsefaid.SelectedValue, DDLcontypeid.SelectedValue, Txttel.Text.Trim(), Txtmail.Text.Trim(), Txtmassage.Text.Trim());
        if (Result == string.Empty)
        {
            LblState.Text = "تم الارسال";
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
}