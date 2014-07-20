using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class UserControls_StuMenuEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    private void LoadData()
    {
        DataTable DTMenus = new DataTable("Menus");
        DataTable DTElements = new DataTable("Elements");
        OleDbDataAdapter DA = new OleDbDataAdapter("SELECT PairntID, PairntName FROM MPairntID", MySchool.ServicesConnection);
        try
        {
            DA.Fill(DTMenus);
            DDLAllMenus.DataSource = DTMenus;
            DDLAllMenus.DataTextField = "PairntName";
            DDLAllMenus.DataValueField = "PairntID";
            DDLAllMenus.DataBind();
            //
            DDLAllMenus2.DataSource = DTMenus;
            DDLAllMenus2.DataTextField = "PairntName";
            DDLAllMenus2.DataValueField = "PairntID";
            DDLAllMenus2.DataBind();
        }
        catch (Exception ex)
        {
            LblError1.Text = ex.Message.ToString();
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
        }
        try
        {
            DA.SelectCommand.CommandText = "SELECT ItemId, ItemName, PicPath, PageLink, PairntID FROM MENU";
            DA.Fill(DTElements);
            DDLAllElements.DataSource = DTElements;
            DDLAllElements.DataTextField = "ItemName";
            DDLAllElements.DataValueField = "ItemId";
            DDLAllElements.DataBind();
        }
        catch (Exception ex)
        {
            LblError2.Text = ex.Message.ToString();
            LblError2.ForeColor = System.Drawing.Color.Red;
            LblError2.Visible = true;
        }
    }
    protected void BtnAddMenu_Click(object sender, EventArgs e)
    {
        if (TxtMenu.Text.Length == 0)
        {
            LblError1.Text = "من فضلك ادخل اسم القائمه";
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
            return;
        }
        OleDbConnection Con = MySchool.ServicesConnection;
        OleDbCommand CMD = new OleDbCommand("INSERT INTO MPairntID (PairntName) VALUES ('" + TxtMenu.Text + "')", Con);
        //
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError1.Text = "تم اضافة القائمه";
            LblError1.ForeColor = System.Drawing.Color.Green;
            LblError1.Visible = true;
            LoadData();
        }
        catch (Exception ex)
        {
            LblError1.Text = ex.Message.ToString();
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
        }
        Con.Close();
    }
    protected void BtnDelMenu_Click(object sender, EventArgs e)
    {
        if (DDLAllMenus.SelectedIndex > -1)
        {
            OleDbConnection Con = MySchool.ServicesConnection;
            OleDbCommand CMD = new OleDbCommand("Delete From MENU Where PairntID = " + DDLAllMenus.SelectedValue.ToString(), Con);
            string Result = string.Empty;
            try
            {
                Con.Open();
                CMD.ExecuteNonQuery();
                CMD.CommandText = "Delete From MPairntID Where PairntID = " + DDLAllMenus.SelectedValue.ToString();
                CMD.ExecuteNonQuery();
                LblError1.Text = "تم حذف القائمه";
                LblError1.ForeColor = System.Drawing.Color.Green;
                LblError1.Visible = true;
            }
            catch (Exception ex)
            {
                LblError1.Text = ex.Message.ToString();
                LblError1.ForeColor = System.Drawing.Color.Red;
                LblError1.Visible = true;
            }
            Con.Close();
        }
    }
    protected void BtnDelElement_Click(object sender, EventArgs e)
    {
        if (DDLAllElements.SelectedIndex > -1)
        {
            OleDbConnection Con = MySchool.ServicesConnection;
            OleDbCommand CMD = new OleDbCommand("Delete From MENU Where ItemId = " + DDLAllElements.SelectedValue.ToString(), Con);
            string Result = string.Empty;
            try
            {
                Con.Open();
                CMD.ExecuteNonQuery();
                LblError2.Text = "تم حذف العنصر";
                LblError2.ForeColor = System.Drawing.Color.Green;
                LblError2.Visible = true;
            }
            catch (Exception ex)
            {
                LblError2.Text = ex.Message.ToString();
                LblError2.ForeColor = System.Drawing.Color.Red;
                LblError2.Visible = true;
            }
            Con.Close();
        }
    }
    protected void BtnEditMenu_Click(object sender, EventArgs e)
    {
        if (TxtMenuEdit.Text.Length == 0 || DDLAllMenus.SelectedIndex == -1)
        {
            LblError1.Text = "من فضلك اختار قائمه و ادخل اسم القائمه الجديد";
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
            return;
        }
        OleDbConnection Con = MySchool.ServicesConnection;
        try
        {
            OleDbCommand CMD = new OleDbCommand("UPDATE MPairntID SET PairntName = '" + TxtMenuEdit.Text + "' Where PairntID=" + DDLAllMenus.SelectedValue.ToString(), MySchool.ServicesConnection);
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError1.Text = "تم تعديل الاسم";
            LblError1.ForeColor = System.Drawing.Color.Green;
            LblError1.Visible = true;
        }
        catch (Exception ex)
        {
            LblError1.Text = ex.Message.ToString();
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
        }
        Con.Close();
    }
    protected void BtnEditElement_Click(object sender, EventArgs e)
    {
        if (TxtElementEdit.Text.Length == 0 || DDLAllElements.SelectedIndex == -1)
        {
            LblError1.Text = "من فضلك اختار العنصر و ادخل اسم العنصر الجديد";
            LblError1.ForeColor = System.Drawing.Color.Red;
            LblError1.Visible = true;
            return;
        }
        OleDbConnection Con = MySchool.ServicesConnection;
        try
        {
            OleDbCommand CMD = new OleDbCommand("UPDATE MENU SET ItemName = '" + TxtElementEdit.Text + "' Where ItemId=" + DDLAllElements.SelectedValue.ToString(), Con);
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError2.Text = "تم تعديل الاسم";
            LblError2.ForeColor = System.Drawing.Color.Green;
            LblError2.Visible = true;
        }
        catch (Exception ex)
        {
            LblError2.Text = ex.Message.ToString();
            LblError2.ForeColor = System.Drawing.Color.Red;
            LblError2.Visible = true;
        }
        Con.Close();
    }
    protected void BtnAddElement_Click(object sender, EventArgs e)
    {
        if (TxtElementName.Text.Length == 0 || DDLAllMenus2.SelectedIndex == -1)
        {
            LblError2.Text = "من فضلك اختار قائمه و ادخل اسم العنصر";
            LblError2.ForeColor = System.Drawing.Color.Red;
            LblError2.Visible = true;
            return;
        }
        string SavingFileName = string.Empty;
        SavingFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
        FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("MenuElementsImages\\") + SavingFileName);
        SavingFileName = "~/MenuElementsImages/" + SavingFileName;
        OleDbConnection Con = MySchool.ServicesConnection;
        OleDbCommand CMD = new OleDbCommand("INSERT INTO MENU (ItemName,PicPath,PageLink,PairntID) VALUES ('" + TxtElementName.Text + "','" + SavingFileName + "','" + TxtElementLink.Text + "'," + DDLAllMenus2.SelectedValue.ToString() + ")", Con);
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError2.Text = "تم اضافة العنصر";
            LblError2.ForeColor = System.Drawing.Color.Green;
            LblError2.Visible = true;
        }
        catch (Exception ex)
        {
            LblError2.Text = ex.Message.ToString();
            LblError2.ForeColor = System.Drawing.Color.Red;
            LblError2.Visible = true;
        }
        Con.Close();
    }
    protected void DDLAllMenus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLAllMenus.SelectedIndex != -1)
        {
            TxtMenuEdit.Text = DDLAllMenus.SelectedItem.ToString();
        }
    }
    protected void DDLAllElements_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLAllElements.SelectedIndex != -1)
        {
            TxtElementEdit.Text = DDLAllElements.SelectedItem.ToString();
        }
    }
}