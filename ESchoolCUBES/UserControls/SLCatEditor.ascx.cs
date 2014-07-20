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
using Telerik.Web.UI;

public partial class UserControl_SLCatEditor : System.Web.UI.UserControl
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
    protected void RTVCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {
        //OleDbConnection Con = MySchool.SLConnection;
        //OleDbCommand CMD = new OleDbCommand("Select CatID,CatName From Categories Where CatParent = " + e.Node.Value.ToString(),Con);
        //OleDbDataReader DR;
        //Con.Open();
        //DR = CMD.ExecuteReader();
        //while (DR.Read())
        //{
        //    Telerik.Web.UI.RadTreeNode Nodi = new Telerik.Web.UI.RadTreeNode(DR.GetValue(1).ToString(),DR.GetValue(0).ToString());
            
        //    e.Node.Nodes.Add(Nodi);
        //    Nodi.Expanded = true;
        //}

        //Con.Close();
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        LoadAllCats(RPBCats.Items);
    }
    protected void BtnAddNew_Click(object sender, EventArgs e)
    {
        if (BtnUpdateCat.Visible == true)
        {
            BtnUpdateCat.Visible = false;
            TxtCatName.Text = String.Empty;
            TxtCatInfo.Text = String.Empty;
            TxtCatVisitCounter.Text = String.Empty;
            //FileUploadImage Must clear it

        }
        else
        {
            //Save new Cat here
        }
    }
    protected void RPBCats_ItemClick(object sender, Telerik.Web.UI.RadPanelBarEventArgs e)
    {
        CatImage.Visible = false;
        LblStatus.Visible = false;
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Categories.CatID, Categories.CatName, Categories.CatImage, Categories.CatInfo, Categories.CatOrder, Categories.VisitCounter, (Select TOP 1 Categories_1.CatName From Categories Categories_1 Where Categories_1.CatID= Categories.CatParent) AS CatParent FROM (Categories INNER JOIN Categories Categories_1 ON Categories.CatID = Categories_1.CatID) Where Categories.CatID = " + e.Item.Value.ToString(), Con);
        OleDbDataReader DR;
        Con.Open();
        DR = CMD.ExecuteReader();
        while (DR.Read())
        {
            TxtCatName.Text = DR.GetValue(1).ToString();
            if (!DR.IsDBNull(2))
            {
                CatImage.Visible = true;
                CatImage.ImageUrl = DR.GetValue(2).ToString();
            }
            else
            {
                CatImage.Visible = true;
                CatImage.ImageUrl = "~/libimages/defaultpic.jpg";
            }
            TxtCatInfo.Text = DR.GetValue(3).ToString();
            ListBoxCatOrder.SelectedIndex = Convert.ToInt16(DR.GetValue(4).ToString()) - 1;
            TxtCatVisitCounter.Text = DR.GetValue(5).ToString();
            TxtCatParent.Text = DR.GetValue(6).ToString();
            BtnUpdateCat.Visible = true;
        }
        Con.Close();
        BtnUpdateCat.Enabled = true;
    }
    protected void CheckBoxMainCat_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxMainCat.Checked)
        {
            TxtCatParent.Text = string.Empty;
        }
        else
        {
            if (RPBCats.SelectedItem.Level > 0)
            {
                TxtCatParent.Text = ((RadPanelItem)RPBCats.SelectedItem.Parent).Text.ToString();   
            }
             
        }
        
    }
    protected void BtnUpdateCat_Click(object sender, EventArgs e)
    {
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD;
        string ParentID = string.Empty;
        if (RPBCats.SelectedItem.Level == 0)
        {
            ParentID = "0";
        }
        else
        {
            ParentID = ((RadPanelItem)RPBCats.SelectedItem.Parent).Value.ToString();
        }
        if (FileUploadImage.HasFile)
        {
            string SavingImageFileName = "";
            SavingImageFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
            FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("libimages") + "/" + SavingImageFileName);
            SavingImageFileName = "~/libimages/" + SavingImageFileName;
            CMD = new OleDbCommand("Update Categories Set CatName = '" + TxtCatName.Text + "', CatImage = '" + SavingImageFileName + "', CatInfo = '" + TxtCatInfo.Text + "', CatOrder = " + ListBoxCatOrder.SelectedValue.ToString() + ",CatParent = " + ParentID + ",VisitCounter = " + TxtCatVisitCounter.Text + " Where CatID = " + RPBCats.SelectedItem.Value.ToString(), Con);
        }
        else
        {
            CMD = new OleDbCommand("Update Categories Set CatName = '" + TxtCatName.Text + "', CatInfo = '" + TxtCatInfo.Text + "', CatOrder = " + ListBoxCatOrder.SelectedValue.ToString() + ",CatParent = " + ParentID + ",VisitCounter = " + TxtCatVisitCounter.Text + " Where CatID = " + RPBCats.SelectedItem.Value.ToString(), Con);
        }
        Con.Open();
        try
        {
            CMD.ExecuteNonQuery();
            LblStatus.Text = "تم التعديل بنجاح";
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;

        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message.ToString();
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
        }
        Con.Close();
        
    }
    protected void TxtCatName_TextChanged(object sender, EventArgs e)
    {
        if (TxtCatName.Text.Length > 0)
        {
            BtnUpdateCat.Enabled = true;
            BtnAddNew.Enabled = true;
        }
        else
        {
            BtnUpdateCat.Enabled = false;
            BtnAddNew.Enabled = false;
        }
    }
}
