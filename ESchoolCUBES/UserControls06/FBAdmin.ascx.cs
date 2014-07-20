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

public partial class FBAdmin : System.Web.UI.UserControl
{
    string GridPaging = string.Empty;
    public enum ViewTypeMember
    {
        All,
        Answered,
        UnAnswered,
        Readed,
        Unreaded
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMSG(ViewTypeMember.All);
        }
    }
    public void LoadMSG(ViewTypeMember ShowMSG)
    {
        DataTable DT = new DataTable("MSGTable");
        OleDbDataAdapter DA = new OleDbDataAdapter("", MySchool.feedbackConnection);
        switch (ShowMSG)
        {
            case ViewTypeMember.All :
                DA.SelectCommand.CommandText = "SELECT id_Contact_Us, date_entry, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, (Select name_kind_m From kind_m Where id_kind_m =Contact_Us.id_kind_m) As id_kind_m,(Select TypeName From JobTypes Where TypeID=Contact_Us.Guest_Type) AS Guest_Type, address_Contact_Us, text_Contact_Us, reply_Contact_Us, data_reply, IIF(Is_Readed=1,'Yes','No') As Is_Readed FROM Contact_Us";
                break;
            case ViewTypeMember.Readed:
                DA.SelectCommand.CommandText = "SELECT id_Contact_Us, date_entry, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, (Select name_kind_m From kind_m Where id_kind_m =Contact_Us.id_kind_m) As id_kind_m,(Select TypeName From JobTypes Where TypeID=Contact_Us.Guest_Type) AS Guest_Type, address_Contact_Us, text_Contact_Us, reply_Contact_Us, data_reply, IIF(Is_Readed=1,'Yes','No') As Is_Readed FROM Contact_Us Where Is_Readed = 1";
                break;
            case ViewTypeMember.Unreaded:
                DA.SelectCommand.CommandText = "SELECT id_Contact_Us, date_entry, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, (Select name_kind_m From kind_m Where id_kind_m =Contact_Us.id_kind_m) As id_kind_m,(Select TypeName From JobTypes Where TypeID=Contact_Us.Guest_Type) AS Guest_Type, address_Contact_Us, text_Contact_Us, reply_Contact_Us, data_reply, IIF(Is_Readed=1,'Yes','No') As Is_Readed FROM Contact_Us Where Is_Readed = 0";
                break;
            case ViewTypeMember.UnAnswered:
                DA.SelectCommand.CommandText = "SELECT id_Contact_Us, date_entry, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, (Select name_kind_m From kind_m Where id_kind_m =Contact_Us.id_kind_m) As id_kind_m,(Select TypeName From JobTypes Where TypeID=Contact_Us.Guest_Type) AS Guest_Type, address_Contact_Us, text_Contact_Us, reply_Contact_Us, data_reply, IIF(Is_Readed=1,'Yes','No') As Is_Readed FROM Contact_Us Where reply_Contact_Us Is NULL";
                break;
            case ViewTypeMember.Answered:
                DA.SelectCommand.CommandText = "SELECT id_Contact_Us, date_entry, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, (Select name_kind_m From kind_m Where id_kind_m =Contact_Us.id_kind_m) As id_kind_m,(Select TypeName From JobTypes Where TypeID=Contact_Us.Guest_Type) AS Guest_Type, address_Contact_Us, text_Contact_Us, reply_Contact_Us, data_reply, IIF(Is_Readed=1,'Yes','No') As Is_Readed FROM Contact_Us Where NOT(reply_Contact_Us) Is NULL";
                break;
        }
        try
        {
            DA.Fill(DT);
            GridViewMSG.DataSource = DT;
            GridViewMSG.DataBind();
            ViewState["MSGTable"] = DT;
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message;
            LblError.Visible = true;
        }
    }
    protected void DDLViewType_SelectedIndexChanged(object sender, EventArgs e)
    {
        PnlMSGDetails.Visible = false;
        switch (DDLViewType.SelectedValue)
        {
            case "1":
                LoadMSG(ViewTypeMember.All);
                break;
            case "2":
                LoadMSG(ViewTypeMember.Answered);
                break;
            case "3":
                LoadMSG(ViewTypeMember.UnAnswered);
                break;
            case "4":
                LoadMSG(ViewTypeMember.Readed);
                break;
            case "5":
                LoadMSG(ViewTypeMember.Unreaded);
                break;
        }
    }
    protected void GridViewMSG_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewMSG.PageIndex = e.NewPageIndex;
        DDLViewType_SelectedIndexChanged(DDLViewType,new EventArgs());
    }
    protected void GridViewMSG_SelectedIndexChanged(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        PnlMSGDetails.Visible = true;
        GridViewRow GVR = GridViewMSG.SelectedRow;
        for (int i = 0; i < GVR.Cells.Count; i++)
        {
            if (GVR.Cells[i].Text == "&nbsp;")
            {
                GVR.Cells[i].Text = string.Empty;
            }
        }
        
        TxtMSGNo.Text = GVR.Cells[0].Text;
        TxtSenderPhone.Text = GVR.Cells[4].Text;
        TxtSenderName.Text = GVR.Cells[2].Text;
        TxtSenderMail.Text = GVR.Cells[3].Text;
        if (GVR.Cells[1].Text == string.Empty)
        {
            TxtMSGDate.Text = string.Empty;    
        }
        else
        {
            TxtMSGDate.Text = GVR.Cells[1].Text;
        }
        TxtSenderType.Text = GVR.Cells[5].Text;
        TxtMSGType.Text = GVR.Cells[6].Text;
        TxtMSGTitle.Text = GVR.Cells[7].Text;
        TxtMSGContain.Text = GVR.Cells[8].Text;
        if (GVR.Cells[10].Text == string.Empty)
        {
            TxtRpyDate.Text = string.Empty;
        }
        else
        {
            TxtRpyDate.Text = GVR.Cells[10].Text;
        }
        TxtRpyContian.Text = GVR.Cells[9].Text;
    }
    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        if (TxtMSGNo.Text.Length == 0)
        {
            LblStatus.Text = "من فضلك قم بأختيار احدي الرسائل اولا";
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
            return;
        }
        
        OleDbConnection Con = MySchool.feedbackConnection;
        OleDbCommand CMD = new OleDbCommand("UPDATE Contact_Us SET name_Contact_Us = '" + TxtSenderName.Text + "', mail_Contact_Us = '" + TxtSenderMail.Text + "', phone_Contact_Us = '" + TxtSenderPhone.Text + "', text_Contact_Us = '" + TxtMSGContain.Text + "', reply_Contact_Us = '" + TxtRpyContian.Text + "', address_Contact_Us = '" + TxtMSGTitle.Text + "'", Con);
        if (TxtMSGDate.Text != string.Empty)
        {
            CMD.CommandText += ", date_entry = #" + TxtMSGDate.Text + "# ";
        }
        else
        {
            CMD.CommandText += ", date_entry = Null ";
        }
        if (TxtRpyDate.Text != string.Empty)
        {
            CMD.CommandText += ", data_reply = #" + TxtRpyDate.Text + "# ";
        }
        else
        {
            CMD.CommandText += ", data_reply = Null ";
        }
        CMD.CommandText += "Where id_Contact_Us = '" + TxtMSGNo.Text + "'";
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblStatus.Text = "تم حفظ التعديل";
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
            GridViewRow GVR = GridViewMSG.SelectedRow;
            GridViewMSG.SelectedRow.Cells[4].Text = TxtSenderPhone.Text;
            GridViewMSG.SelectedRow.Cells[2].Text = TxtSenderName.Text;
            GridViewMSG.SelectedRow.Cells[3].Text = TxtSenderMail.Text;
            GridViewMSG.SelectedRow.Cells[1].Text = TxtMSGDate.Text;
            GridViewMSG.SelectedRow.Cells[7].Text = TxtMSGTitle.Text;
            GridViewMSG.SelectedRow.Cells[8].Text = TxtMSGContain.Text;
            GridViewMSG.SelectedRow.Cells[10].Text = TxtRpyDate.Text;
            GridViewMSG.SelectedRow.Cells[9].Text = TxtRpyContian.Text;
        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message;
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
        }
        Con.Close();
    }
    protected void btnDelMSG_Click(object sender, EventArgs e)
    {
        if (TxtMSGNo.Text.Length == 0)
        {
            LblStatus.Text = "من فضلك قم بأختيار احدي الرسائل اولا";
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
            return;
        }
        OleDbConnection Con = MySchool.feedbackConnection;
        OleDbCommand CMD = new OleDbCommand("DELETE FROM Contact_Us WHERE (id_Contact_Us = '" + TxtMSGNo.Text + "')", Con);
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblStatus.Text = "تم حفظ التعديل";
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
            GridViewMSG.DeleteRow(GridViewMSG.SelectedIndex);
            // Grid view didnt delete the row----------------------------------------------------X
        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message;
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
        }
    }
   
    protected void GridViewMSG_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        return;
    }
   
}