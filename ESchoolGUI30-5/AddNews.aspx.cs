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

public partial class AddNews : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loaddata();
        }
        
        if (Request.QueryString["status"] != null)
        {
            switch (Request.QueryString["status"].ToString())
            {
                case "success":
                    //if success
                    LblStatus.ForeColor = System.Drawing.Color.Green;
                    LblStatus.Text = "تمت الاضافه";
                    break;
                case "failed":
                    //if failed
                    LblStatus.Text="خطاء!!  لم تتم الاضافه";
                    LblStatus.ForeColor = System.Drawing.Color.Red;
                    break;
                case "missing":
                    //if missing
                    LblStatus.Text = "خطأ!! البيانات ليست كامله";
                    LblStatus.ForeColor = System.Drawing.Color.Blue;
                    break;
                default:
                    break;
            }
           
        }

    }

    protected void BtnAddNews_Click(object sender, EventArgs e)
    {
        if (TxtDetails.Text.Trim().Length > 0 && TxtTitle.Text.Trim().Length > 0 && TxtDate.Text.Trim().Length > 0)
        {
            OleDbConnection AccessCon = MySchool.ServicesConnection;
            OleDbCommand AccessCmd;
            if (CBShow.Checked)
            {
                AccessCmd = new OleDbCommand("INSERT INTO News (news_title, news_details, Timeline, id_starting) VALUES ('" + TxtTitle.Text.Trim() + "', '" + TxtDetails.Text.Trim() + "', #" + TxtDate.Text.Trim() + "#,2)", AccessCon);
            }
            else {
                AccessCmd = new OleDbCommand("INSERT INTO News (news_title, news_details, Timeline, id_starting) VALUES ('" + TxtTitle.Text.Trim() + "', '" + TxtDetails.Text.Trim() + "', #" + TxtDate.Text.Trim() + "#,1)", AccessCon);
            }
            
            try
            {
                AccessCon.Open();
                AccessCmd.ExecuteNonQuery();
                AccessCon.Close();
            }
            catch
            {
                AccessCon.Close();
                Response.Redirect("AddNews.aspx?status=failed");
            }
            Response.Redirect("AddNews.aspx?status=success");
        }
        else
        {
            Response.Redirect("AddNews.aspx?status=missing");
        }
        
    }

    public void loaddata()
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("",AccessCon);
        DataTable DTable = new DataTable("DataTable");
        AccessDA.SelectCommand.CommandText = "select * from news";
        AccessDA.Fill(DTable);
        GridView2.DataSource = DTable;
        GridView2.DataBind();
        //Response.Write("<script>alert('" + DTable.Rows.Count.ToString() + "');</script>");
    }
    public string SplitIncomingData1()
    {
        DataTable DTable = (DataTable)GridView2.DataSource;
        return null;
    }



    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('" +GridView2.SelectedDataKey.Value+"');</script>");
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("Delete from news Where code_news= " + GridView2.SelectedDataKey.Value.ToString(), AccessCon);
        try
        {
            AccessCon.Open();
            AccessCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() +"');</script>");
        }
        AccessCon.Close();
        loaddata();
        //Response.Redirect("AddNews.aspx");
    }

    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow GVR in GridView2.Rows)
        {
            HiddenField HF = (HiddenField)GVR.FindControl("HiddenField2");

            CheckBox CB = (CheckBox)GVR.FindControl("CheckBox1");
            if (HF.Value.ToString() == "1")
            {
                CB.Checked = true;
            }
            else
            {
                CB.Checked = false;
            }
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox CB = (CheckBox)sender;
        GridViewRow GVR = (GridViewRow)CB.Parent.Parent;
        HiddenField HF = (HiddenField )GVR.FindControl("HiddenField1");
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd;
        if (CB.Checked)
        {
            AccessCmd = new OleDbCommand("Update news Set id_starting = 1 Where code_news =" + HF.Value.ToString(), AccessCon);
        }
        else
        {
            AccessCmd = new OleDbCommand("Update news Set id_starting = 2 Where code_news =" + HF.Value.ToString(), AccessCon);
        }
        try
        {
            AccessCon.Open();
            AccessCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
        }
        AccessCon.Close();
        loaddata();
    }
}
