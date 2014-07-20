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
using Telerik.Web.UI;
using System.Data.OleDb;
using System.IO;

public partial class UserControl_SLBookEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable DT = new DataTable("GeneralTable");
            OleDbDataAdapter AccessDA = new OleDbDataAdapter("Select CatID,CatName From Categories Where CatParent = 0 ORDER BY CatOrder", MySchool.SLConnection);
            AccessDA.Fill(DT);
            RPBCats.DataSource = DT;
            RPBCats.DataTextField = "CatName";
            RPBCats.DataValueField = "CatID";
            RPBCats.DataBind();
            LoadAllCats(RPBCats.Items);
        }
    }
    private void LoadAllCats(Telerik.Web.UI.RadPanelItemCollection NItem)
    {
        foreach (Telerik.Web.UI.RadPanelItem CItem in NItem)
        {
            LoadSupCat(CItem);
        }

    }
    private void LoadSupCat(Telerik.Web.UI.RadPanelItem CItem)
    {
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD = new OleDbCommand("Select CatID,CatName From Categories Where CatParent = " + CItem.Value.ToString() + " ORDER BY CatOrder", Con);
        OleDbDataReader DR;
        Con.Open();
        DR = CMD.ExecuteReader();
        CItem.Items.Clear();
        while (DR.Read())
        {
            Telerik.Web.UI.RadPanelItem Itemi = new Telerik.Web.UI.RadPanelItem(DR.GetValue(1).ToString());
            Itemi.Value = DR.GetValue(0).ToString();
            CItem.Items.Add(Itemi);
            LoadSupCat(Itemi);
        }
        Con.Close();
    }
    protected void TxtBookName_TextChanged(object sender, EventArgs e)
    {
        if (TxtBookName.Text.Length > 0)
        {
            BtnAddNew.Enabled = true;
        }
        else
        {
            BtnAddNew.Enabled = false;
        }
    }
    protected void RPBCats_ItemClick(object sender, RadPanelBarEventArgs e)
    {
        DataTable DT = new DataTable("GeneralTable");
        BookImage.Visible = false;
        LblStatus.Visible = false;
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT BookID, BookName, BookImage, BookLink, BookFileName, BookOwner, BookInfo FROM Books WHERE CatID = " + e.Item.Value.ToString(), MySchool.SLConnection);
        AccessDA.Fill(DT);
        DDLBooks.DataSource = DT;
        DDLBooks.DataTextField = "BookName";
        DDLBooks.DataValueField = "BookID";
        DDLBooks.DataBind();
        ViewState["Books"] = DT;
        if (DDLBooks.Items.Count > 0)
        {
            DDLBooks.SelectedIndex = 0;
        }
        TxtCatParent.Text = e.Item.Text;
    }
    protected void DDLBooks_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLBooks.SelectedIndex > -1)
        {
            BtnDelBook.Visible = true;
            BtnUpdateBook.Visible = true;
            DataTable DT = (DataTable)ViewState["Books"];
            TxtBookName.Text = DT.Rows[DDLBooks.SelectedIndex][1].ToString();
            if ((string)DT.Rows[DDLBooks.SelectedIndex][2] != string.Empty)
            {
                BookImage.Visible = true;
                BookImage.ImageUrl = DT.Rows[DDLBooks.SelectedIndex][2].ToString();
            }
            else
            {
                BookImage.Visible = true;
                BookImage.ImageUrl = "~/libimages/defaultpic.jpg";
            }
            TxtOwner.Text = DT.Rows[DDLBooks.SelectedIndex][5].ToString();
            TxtBookInfo.Text = DT.Rows[DDLBooks.SelectedIndex][6].ToString();
            TxtCatParent.Text = RPBCats.SelectedItem.Text.ToString();
        }
        else
        {
            BtnDelBook.Visible = false;
            BtnUpdateBook.Visible = false;
        }
    }
    protected void BtnUpdateBook_Click(object sender, EventArgs e)
    {
        OleDbConnection AccessCon = MySchool.SLConnection;
        OleDbCommand AccessCMD;
        try
        {
            string SavingBookFileName = "";
            string SavingImageFileName = "";
            DataTable DT = (DataTable)ViewState["Books"];
            if (FileUploadBook.HasFile)
            {
                SavingBookFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadBook.FileName.ToString();
                FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("Books\\") + SavingBookFileName);
                SavingBookFileName = "~/Books/" + SavingBookFileName;
                DeleteAFile(DT.Rows[DDLBooks.SelectedIndex][3].ToString());//Delete Old Book File
            }
            if (FileUploadImage.HasFile)
            {
                SavingImageFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
                FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("libimages\\") + SavingImageFileName);
                SavingImageFileName = "~/libimages/" + SavingImageFileName;
                DeleteAFile(DT.Rows[DDLBooks.SelectedIndex][2].ToString());//Delete Old Book Image
            }
            AccessCMD = new OleDbCommand("Update Books Set BookName = '" + TxtBookName.Text + "', BookImage = '" + SavingImageFileName + "', BookLink = '" + SavingBookFileName + "', BookFileName = '" + FileUploadBook.FileName.ToString() + "', BookOwner = '" + TxtOwner.Text + "', CatID = " + RPBCats.SelectedItem.Value.ToString() + ", BookInfo = '" + TxtBookInfo.Text + "' Where BookID = " + DDLBooks.SelectedValue.ToString() , AccessCon);
            AccessCon.Open();
            AccessCMD.ExecuteNonQuery();
            LblStatus.Text = " „ «· ⁄œÌ· »‰Ã«Õ";
            LblStatus.Visible = true;
            LblStatus.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            LblStatus.Visible = true;
            LblStatus.Text = ex.Message.ToString();
            LblStatus.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void BtnDelBook_Click(object sender, EventArgs e)
    {
        OleDbConnection AccessCon = MySchool.SLConnection;
        OleDbCommand AccessCMD;
        try
        {
            DataTable DT = (DataTable)ViewState["Books"];
            DeleteAFile(DT.Rows[DDLBooks.SelectedIndex][2].ToString());
            DeleteAFile(DT.Rows[DDLBooks.SelectedIndex][3].ToString());
            AccessCMD = new OleDbCommand("Delete From Books Where BookID = " + DDLBooks.SelectedValue.ToString(), AccessCon);
            AccessCon.Open();
            AccessCMD.ExecuteNonQuery();
            LblStatus.Text = " „ «·Õ–› »‰Ã«Õ";
            LblStatus.Visible = true;
            LblStatus.ForeColor = System.Drawing.Color.Green;
            RadPanelBarEventArgs Argz = new RadPanelBarEventArgs(RPBCats.SelectedItem);
            RPBCats_ItemClick(RPBCats, Argz);
        }
        catch (Exception ex)
        {
            LblStatus.Visible = true;
            LblStatus.Text = ex.Message.ToString();
            LblStatus.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void BtnAddNew_Click(object sender, EventArgs e)
    {
        OleDbConnection AccessCon = MySchool.SLConnection;
        OleDbCommand AccessCMD;
        try
        {
            string SavingBookFileName = "";
            string SavingImageFileName = "";
            if (FileUploadBook.HasFile)
            {
                SavingBookFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadBook.FileName.ToString();
                FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("Books\\") + SavingBookFileName);
                SavingBookFileName = "~/Books/" + SavingBookFileName;
            }
            if (FileUploadImage.HasFile)
            {
                SavingImageFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
                FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("libimages\\") + SavingImageFileName);
                SavingImageFileName = "~/libimages/" + SavingImageFileName;
            }
            AccessCMD = new OleDbCommand("Insert Into Books (BookName,BookImage,BookLink,BookFileName,BookOwner,CatID,BookInfo) VALUES ('" + TxtBookName.Text + "','" + SavingImageFileName + "','" + SavingBookFileName + "','" + FileUploadBook.FileName.ToString() + "','" + TxtOwner.Text + "'," + RPBCats.SelectedItem.Value.ToString() + ",'" + TxtBookInfo.Text + "')", AccessCon); 
            AccessCon.Open();
            AccessCMD.ExecuteNonQuery();
            LblStatus.Text = " „ «·«÷«›Â »‰Ã«Õ";
            LblStatus.Visible = true;
            LblStatus.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
             LblStatus.Visible = true;
             LblStatus.Text = ex.Message.ToString();
             LblStatus.ForeColor = System.Drawing.Color.Red;
        }
        
    }
    public void DeleteAFile (string FilePath)
    {
        FilePath = HttpContext.Current.Server.MapPath(FilePath);
        if (File.Exists(FilePath))
        {
            System.IO.File.Delete(FilePath);
        }
    }
}
