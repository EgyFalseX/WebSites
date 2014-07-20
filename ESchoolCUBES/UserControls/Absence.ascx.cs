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

public partial class UserControls_Absence : System.Web.UI.UserControl
{
    public string STDID = string.Empty;
    public DataSet AbsenceDataSet = new DataSet("AbsenceDS");

    protected void Page_Load(object sender, EventArgs e)
    {
        STDID = "1416002071";
        //if (HttpContext.Current.Session["STID"] != null)
        //{
        //    STDID = HttpContext.Current.Session["STID"].ToString();
        //}
        GetAllAbsence();
    }
    public void GetAllAbsence()
    {
        DataTable Absence_Info = new DataTable("Absence_Info");
        DataTable Absence_Type = new DataTable("Absence_Type");
        DataTable AbsenceCount = new DataTable("Absence_Count");
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("Select SPOS,[date],eyab_code,eyab_date_from,eyab_date_to,'' AS FalseX From stu_eyab Where stu_code = " + STDID, MySchool.StudentConnection);
        try
        {
            AccessDA.Fill(Absence_Info);
            if (Absence_Info.Rows.Count > 0)
            {
                AccessDA = new OleDbDataAdapter("Select eyab_code,eyab_Name from eyab_code", MySchool.TheCodesConnection);
                AccessDA.Fill(Absence_Type);
                AbsenceCount.Columns.Add("AbsenceType");
                AbsenceCount.Columns.Add("AbsenceCounter");
                AbsenceCount.Columns.Add("No");
                int ICounter = 1;
                foreach (DataRow AbsenceInfoRow in Absence_Info.Rows)
                {
                    AbsenceInfoRow[0] = ICounter;
                    ICounter++;
                    foreach (DataRow AbsenceTypeRow in Absence_Type.Rows)
                    {
                        if (AbsenceInfoRow[2].ToString() == AbsenceTypeRow[0].ToString())
                        {
                            AbsenceInfoRow[5] = AbsenceTypeRow[1].ToString();
                            break;
                        }
                    }
                    bool AbsenceCountRowExisted = false;
                   foreach (DataRow AbsenceCountRow in AbsenceCount.Rows)
                   {
                       if (AbsenceCountRow[0].ToString() == AbsenceInfoRow[5].ToString())
                       {
                           AbsenceCountRow[1] = (Convert.ToInt16(AbsenceCountRow[1]) + 1).ToString();
                           AbsenceCountRowExisted = true;
                       }
                   }
                    if (AbsenceCountRowExisted == false)
                    {
                        DataRow X = AbsenceCount.NewRow();
                        X[0] = AbsenceInfoRow[5].ToString();
                        X[1] = "1";
                        AbsenceCount.Rows.Add(X);
                    }
                }
                int i = 1;
                foreach (DataRow AbsenceCountRow in AbsenceCount.Rows)
                {
                    AbsenceCountRow[2] = i.ToString();
                    i++;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }

        AbsenceDataSet.Tables.Add(Absence_Info);
        AbsenceDataSet.Tables.Add(AbsenceCount);
        GVAllAbsence.DataSource = AbsenceDataSet.Tables[0];
        GVAllAbsence.DataBind();
        GVAbsenceCount.DataSource = AbsenceDataSet.Tables[1];
        GVAbsenceCount.DataBind();
    }
}
