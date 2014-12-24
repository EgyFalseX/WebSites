using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class QAMenuEditor : System.Web.UI.UserControl
{
    #region -   Variables   -
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/FlexibleData.mdb");
    #endregion
    #region -   Functions   -
    private void LoadData()
    {
        using (OleDbDataAdapter da = new OleDbDataAdapter("SELECT ItemID, ItemName, Show_Hide, ItemInfo, ItemPic, ReleaseDate FROM MenuItem ORDER BY ItemID", constr))
        {
            DataTable dt = new DataTable("FX2012");
            da.Fill(dt);
            DDLItems.DataSource = dt;
            ViewState["dt"] = dt;
        }
        DDLItems.DataBind();
    }
    #endregion
    #region - Event Handlers -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadData();

    }
    protected void DDLItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLItems.SelectedValue == string.Empty)
            return;
        DataRow row = ((DataTable)ViewState["dt"]).Rows[DDLItems.SelectedIndex];
        TxtEdit.Text = row["ItemName"].ToString();
        TxtEditInfo.Text = row["ItemInfo"].ToString();
        TxtEditImg.Text = row["ItemPic"].ToString();
        if (row["ReleaseDate"].ToString() != string.Empty)
            CReleaseDateEdit.SelectedDate = Convert.ToDateTime(row["ReleaseDate"]);

    }
    protected void IBAdd_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (TxtAdd.Text == string.Empty)
            return;
        string ReleaseDate;
        if (CReleaseDateAdd.SelectedDate != null)
            ReleaseDate = "'" + CReleaseDateAdd.SelectedDate.ToShortDateString() + "'";
        else
            ReleaseDate = "NULL";

        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand(String.Format(@"Insert Into MenuItem (ItemName, Show_Hide, ItemInfo, ItemPic, ReleaseDate) VALUES ('{0}', 1, '{1}', '{2}', {3})",
        TxtAdd.Text, TxtAddInfo.Text, TxtAddImg.Text, ReleaseDate), Con);
        try
        {
            Con.Open();
            cmd.ExecuteNonQuery();
            LblMsg.Text = "تم الاضافه";
            LblMsg.ForeColor = System.Drawing.Color.Green;
            TxtAdd.Text = string.Empty;
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
        Con.Close();
        LoadData();
    }
    protected void IBEdit_Click(object sender, ImageClickEventArgs e)
    {
        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 0 || TxtEdit.Text.Length == 0)
        {
            LblMsg.Text = "من فضلك اختار عنصر وادخل التغير ثم اضغط تعديل";
            return;
        }
        string ReleaseDate;
        if (CReleaseDateEdit.SelectedDate != null)
            ReleaseDate = "'" + CReleaseDateEdit.SelectedDate.ToShortDateString() + "'";
        else
            ReleaseDate = "NULL";
        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand(String.Format(@"Update MenuItem Set ItemName = '{0}', ItemInfo = '{1}', ItemPic = '{2}', ReleaseDate = {3} Where ItemID = {4}",
        TxtEdit.Text, TxtEditInfo.Text, TxtEditImg.Text, ReleaseDate, DDLItems.SelectedValue), Con);
        try
        {
            Con.Open();
            cmd.ExecuteNonQuery();
            LblMsg.Text = "تم التعديل";
            LblMsg.ForeColor = System.Drawing.Color.Green;
            TxtEdit.Text = string.Empty;
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
        Con.Close();
        LoadData();
    }
    protected void IBDelete_Click(object sender, ImageClickEventArgs e)
    {
        //ClientScriptManager CSM = Page.ClientScript;
        //if (!ReturnValue())
        //{
        //    string strconfirm = "<script>if(!window.confirm('Are you sure?')){window.location.href='MenuEditor.aspx'}</script>";
        //    CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false);
        //}

        LblMsg.Text = string.Empty;
        if (DDLItems.SelectedIndex < 0)
        {
            LblMsg.Text = "من فضلك اختار عنصر ثم اضغط حذف";
            return;
        }
        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand(String.Format("Delete From MenuItem Where ItemID = {0}", DDLItems.SelectedValue), Con);
        try
        {
            Con.Open();
            cmd.ExecuteNonQuery();
            LblMsg.Text = "تم الحذف";
            LblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
        Con.Close();
        LoadData();
    }
    bool ReturnValue()
    {
        return false;
    }
    #endregion         #region -   Variables   -
    
}