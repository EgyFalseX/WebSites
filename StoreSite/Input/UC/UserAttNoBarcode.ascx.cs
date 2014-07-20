using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using Functions;

public partial class UC_UserAttBarcode : System.Web.UI.UserControl
{
    public enum HarakaTypeStr
    {
        Refuse = 0, Hedoor = 1, Inseraf = 2, Azzn = 3, AzznBack = 4, Nothing = -1
    }
    #region -   Functions   -
    private void LoadDefaultDat()
    {
        DDLShift.DataSource = MC.LoadDataTable("Select shift_code, shift From CDATT_sheft", "");
        DDLShift.DataTextField = "shift";
        DDLShift.DataValueField = "shift_code";
        DDLShift.DataBind();
        DataTable EmpsTbl = MC.LoadDataTable(@"Select EmpID, EmpName From TblEmp");
        DDLEmps.DataSource = EmpsTbl;
        DDLEmps.DataTextField = "EmpName";
        DDLEmps.DataValueField = "EmpID";
        DDLEmps.DataBind();
    }
    private string GetShiftID()
    {
        SqlConnection Con = MC.EStoreConnection;
        string TheTime = String.Format("{0}:{1}:{2}", DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        SqlCommand Cmd = new SqlCommand(String.Format("SELECT shift, shift_code FROM CDATT_sheft WHERE (CONVERT(DATETIME, shift_Start, 108) < CONVERT(DATETIME, '{0}', 108)) AND (CONVERT(DATETIME, shift_End, 108) > CONVERT(DATETIME, '{0}', 108))", TheTime), Con);
        SqlDataReader dr;
        string ReturnMe = string.Empty;
        try
        {
            Con.Open();
            dr = Cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                LblShift.Text = dr.GetValue(0).ToString();
                ReturnMe = dr.GetValue(1).ToString();
                LblShift.ForeColor = Color.Green;
                //TxtNo.Visible = true;
            }
            else
            {
                LblShift.Text = "لا يوجد فتره الان";
                LblShift.ForeColor = Color.Red;
                //TxtNo.Visible = false;
            }
        }
        catch (SqlException ex)
        {
            LblShift.Text = ex.Message;
            LblShift.ForeColor = Color.Red;
        }
        Con.Close();
        return ReturnMe;
    }
    private void GetEmpInfo()
    {
        DataTable EmpInfo = new DataTable("FX2011-01");
        if (DDLEmps.SelectedIndex <= 0)
            return;
        EmpInfo = MC.LoadDataTable(String.Format(@"SELECT EmpID, EmpName, (SELECT JobId1 FROM CdJob WHERE (JobId = TblEmp.JobId)) AS job,'~/images/userSearch.png' AS EmpPic
                                                   FROM TblEmp WHERE (EmpID = {0})", DDLEmps.SelectedValue),"");
        if (EmpInfo.Rows.Count != 0)
        {
            LblState.Text = string.Empty;
            LblState.ForeColor = Color.Green;
            ViewState["EmpID"] = EmpInfo.Rows[0]["EmpID"].ToString();
            TxtName.Text = EmpInfo.Rows[0]["EmpName"].ToString();
            TxtJob.Text = EmpInfo.Rows[0]["job"].ToString();
            Pic.ImageUrl = EmpInfo.Rows[0]["EmpPic"].ToString();
            Pnl.Visible = true;
            DataTable TempTbl = new DataTable();
            TempTbl = MC.LoadDataTable("SELECT hedor_time_End, enseraf_time_Start FROM ATT_Company_Emp WHERE EmpID = " + DDLEmps.SelectedValue + " AND shift_code = " + ViewState["ShiftId"], "");
            if (TempTbl.Rows.Count != 0)
            {
                ViewState["hedor_time_End"] = TempTbl.Rows[0]["hedor_time_End"].ToString();
                ViewState["enseraf_time_Start"] = TempTbl.Rows[0]["enseraf_time_Start"].ToString();
            }
            else
            {
                ViewState["hedor_time_End"] = string.Empty;
                ViewState["enseraf_time_Start"] = string.Empty;
            }
        }
        else
        {
            LblState.Text = "رقم موظف مرفوض";
            LblState.ForeColor = Color.Red;
            ViewState["EmpID"] = string.Empty;
            ViewState["hedor_time_End"] = string.Empty;
            ViewState["enseraf_time_Start"] = string.Empty;
            TxtName.Text = string.Empty;
            TxtJob.Text = string.Empty;
            Pnl.Visible = false;
            //Pic.ImageUrl = string.Empty;
        }
        ViewState["EmpInfo"] = EmpInfo;
    }
    private HarakaTypeStr GetHarakaType()
    {
        /*
         * 1- Check if Emp assign to this shaft.
         * 2- Get last haraka type if its not return Refuse.
         * 3- If no haraka type for this emp 2day then return Hedoor.
         * 4- If last haraka was Hedoor then (if enseraf_time_start == nothing then return [Refuse]).
         * 5- If last haraka was Hedoor and enseraftime.Hour > this Hour then return [Azzen].
         * 6- If last haraka was Hedoor and enseraftime.Hour = this Hour then return check if enseraftime.Minute > this minute then return [Azzen] else return [Inseraf]
         * 7- If last haraka was Inseraf then return [Refuse].
         * 8- If last haraka was Azzen then return [AzznBack].
         * 9- If last haraka was AzzenBack then repeate (If last haraka was Hedoor).
         * */
        DataTable TempTbl = new DataTable();
        DataTable EmpInfo = (DataTable)ViewState["EmpInfo"];
        TempTbl = MC.LoadDataTable(String.Format("SELECT EmpID, shift_code FROM ATT_Company_Emp WHERE (EmpID = {0}) AND (shift_code = {1})", EmpInfo.Rows[0]["EmpID"], ViewState["ShiftId"]), "");
        if (TempTbl.Rows.Count == 0) //if this emp assign to this shift
            return HarakaTypeStr.Refuse;

        TempTbl = new DataTable();
        string today = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(DateTime.Now.ToShortDateString()));
        TempTbl = MC.LoadDataTable(String.Format("SELECT TOP (1) c_emp_harka_type FROM ATT_empharaka WHERE (EmpID = {0}) AND (shift_code = {1}) AND (harka_date = {2}) ORDER BY EmpHarakaID DESC", EmpInfo.Rows[0]["EmpID"], ViewState["ShiftId"], today), "");
        if (TempTbl.Rows.Count == 0) //if this emp have row b4 in this (shift + day)
            return HarakaTypeStr.Hedoor;
        int EmpHarkaType = Convert.ToInt16(TempTbl.Rows[0]["c_emp_harka_type"]);
        switch (EmpHarkaType)
        {
            case (int)HarakaTypeStr.Hedoor:
                if (ViewState["enseraf_time_Start"].ToString() == string.Empty)
                    return HarakaTypeStr.Refuse;
                else
                {
                    DateTime enseraftime = Convert.ToDateTime(ViewState["enseraf_time_Start"]);
                    if (enseraftime.Hour > DateTime.Now.Hour)
                        return HarakaTypeStr.Azzn;
                    else if (enseraftime.Hour == DateTime.Now.Hour)
                    {
                        if (enseraftime.Minute > DateTime.Now.Minute)
                            return HarakaTypeStr.Azzn;
                        else
                            return HarakaTypeStr.Inseraf;
                    }
                    else
                        return HarakaTypeStr.Inseraf;
                }

            case (int)HarakaTypeStr.Inseraf:
                return HarakaTypeStr.Refuse;

            case (int)HarakaTypeStr.Azzn:
                return HarakaTypeStr.AzznBack;

            case (int)HarakaTypeStr.AzznBack:
                DateTime inseraftime = Convert.ToDateTime(ViewState["enseraf_time_Start"]);
                if (inseraftime.Hour > DateTime.Now.Hour)
                    return HarakaTypeStr.Azzn;
                else if (inseraftime.Hour == DateTime.Now.Hour)
                {
                    if (inseraftime.Minute > DateTime.Now.Minute)
                        return HarakaTypeStr.Azzn;
                    else
                        return HarakaTypeStr.Inseraf;
                }
                else
                    return HarakaTypeStr.Inseraf;
            default:
                return HarakaTypeStr.Refuse;
        }
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        LblDate.Text = DateTime.Now.ToLongDateString();//Show Time
        ViewState["ShiftId"] = DDLShift.SelectedValue; //Show Shift
        if (TheSessions.UserID == string.Empty)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadDefaultDat();
            RDPDate.SelectedDate = DateTime.Now;
            ViewState["EmpID"] = string.Empty;
            ViewState["hedor_time_End"] = string.Empty;
            ViewState["enseraf_time_Start"] = string.Empty;
            ViewState["ShiftId"] = string.Empty;
            ViewState["HarakaType"] = HarakaTypeStr.Nothing;
        }
    }
    protected void DDLShift_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["ShiftId"] = DDLShift.SelectedValue; //Show Shift
    }
    protected void DDLEmps_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLEmps.SelectedIndex <= 0)
            return;
        GetEmpInfo();
    }
    protected void BtnAtt_Click(object sender, EventArgs e)
    {
        if (DDLEmps.SelectedIndex <= 0)
            return;
        GetEmpInfo();
        if (RDPDate.SelectedDate == null || DDLShift.SelectedIndex == -1)
        {
            LblState.Text = "من فضلك ادخل تاريخ ز اختار الفتره";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable EmpInfo = (DataTable)ViewState["EmpInfo"];
        if (EmpInfo.Rows.Count == 0)//if this emp assign to this shift
        {
            LblState.Text = "تم رفــــــض البطاقة";
            LblState.ForeColor = Color.Red;
            return;
        }
        HarakaTypeStr HarakaType = (HarakaTypeStr)ViewState["HarakaType"];
        HarakaType = GetHarakaType();
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        string EmpID = EmpInfo.Rows[0]["EmpID"].ToString();
        string harka_date = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(DateTime.Now.ToShortDateString()));
        string c_emp_harka_type = "NULL";
        string shift_code = (string)ViewState["ShiftId"];
        string harka_time = "GETDATE()";
        string adafetime = "NULL", gasmtime = "NULL", time_mokarara;
        try
        {
            con.Open();
            switch (HarakaType)
            {
                case HarakaTypeStr.Refuse:
                    LblState.Text = "تم رفــــــض البطاقة";
                    LblState.ForeColor = Color.Red;
                    break;
                case HarakaTypeStr.Hedoor:
                    c_emp_harka_type = ((int)HarakaTypeStr.Hedoor).ToString();
                    TimeSpan HedorTime = Convert.ToDateTime(ViewState["hedor_time_End"]).TimeOfDay;
                    time_mokarara = String.Format(" CONVERT(DATETIME, '{0}:{1}:{2}', 108) ", HedorTime.Hours, HedorTime.Minutes, HedorTime.Seconds);
                    DateTime Hedor_Time = Convert.ToDateTime(ViewState["hedor_time_End"]);
                    int hours;
                    int minutes = 0;
                    if (DateTime.Now.Hour > Hedor_Time.Hour)
                        hours = DateTime.Now.Hour - Hedor_Time.Hour;
                    else
                        hours = 0;
                    if (DateTime.Now.Minute > Hedor_Time.Minute)
                        minutes = DateTime.Now.Minute - Hedor_Time.Minute;
                    if (hours > 0 || minutes > 0)
                        gasmtime = " CONVERT(DATETIME, '" + hours + ":" + minutes + ":00" + "', 108) ";
                    cmd.CommandText = string.Format("INSERT INTO ATT_empharaka (EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})", EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara);
                    cmd.ExecuteNonQuery();
                    LblState.Text = "تسجيـــل حضــور";
                    LblState.ForeColor = Color.Green;
                    break;

                case HarakaTypeStr.Inseraf:
                    c_emp_harka_type = ((int)HarakaTypeStr.Inseraf).ToString();
                    TimeSpan HedorTime1 = Convert.ToDateTime(ViewState["hedor_time_End"]).TimeOfDay;
                    time_mokarara = String.Format(" CONVERT(DATETIME, '{0}:{1}:{2}', 108) ", HedorTime1.Hours, HedorTime1.Minutes, HedorTime1.Seconds);
                    DateTime Inseraf_Time = Convert.ToDateTime(RDPDate.SelectedDate.Value.ToShortDateString() + " " + Convert.ToDateTime(ViewState["enseraf_time_Start"]).ToShortTimeString());
                    TimeSpan ts = DateTime.Now.Subtract(Inseraf_Time);
                    if (ts.TotalMinutes > 0)
                        adafetime = String.Format(" CONVERT(DATETIME, '{0}:{1}:00', 108) ", ts.Hours, ts.Minutes);
                    cmd.CommandText = string.Format("INSERT INTO ATT_empharaka (EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})", EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara);
                    cmd.ExecuteNonQuery();
                    LblState.Text = "تسجيـــل انصــــراف";
                    LblState.ForeColor = Color.Green;
                    break;

                case HarakaTypeStr.Azzn:
                    c_emp_harka_type = ((int)HarakaTypeStr.Azzn).ToString();
                    TimeSpan HedorTime2 = Convert.ToDateTime(ViewState["hedor_time_End"]).TimeOfDay;
                    time_mokarara = String.Format(" CONVERT(DATETIME, '{0}:{1}:{2}', 108) ", HedorTime2.Hours, HedorTime2.Minutes, HedorTime2.Seconds);
                    DateTime Ins_Time = Convert.ToDateTime(ViewState["enseraf_time_Start"]);
                    int hours3 = 0, minutes3 = 0;
                    if (DateTime.Now.Hour < Ins_Time.Hour)
                        hours3 = Ins_Time.Hour - DateTime.Now.Hour;
                    if (DateTime.Now.Minute < Ins_Time.Minute)
                        minutes3 = Ins_Time.Minute - DateTime.Now.Minute;
                    if (hours3 > 0 || minutes3 > 0)
                        gasmtime = String.Format(" CONVERT(DATETIME, '{0}:{1}:00', 108) ", hours3, minutes3);
                    cmd.CommandText = string.Format("INSERT INTO ATT_empharaka (EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})", EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara);
                    cmd.ExecuteNonQuery();
                    LblState.Text = "تسجيـــل اذن";
                    LblState.ForeColor = Color.Green;
                    break;

                case HarakaTypeStr.AzznBack:
                    c_emp_harka_type = ((int)HarakaTypeStr.AzznBack).ToString();
                    TimeSpan HedorTime3 = Convert.ToDateTime(ViewState["hedor_time_End"]).TimeOfDay;
                    time_mokarara = String.Format(" CONVERT(DATETIME, '{0}:{1}:{2}', 108) ", HedorTime3.Hours, HedorTime3.Minutes, HedorTime3.Seconds);
                    cmd.CommandText = string.Format("INSERT INTO ATT_empharaka (EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})", EmpID, harka_date, c_emp_harka_type, shift_code, harka_time, adafetime, gasmtime, time_mokarara);
                    cmd.ExecuteNonQuery();
                    LblState.Text = "تسجيـــل عوده من الاذن";
                    LblState.ForeColor = Color.Green;
                    break;

                case HarakaTypeStr.Nothing:
                    LblState.Text = "تم رفــــــض البطاقة";
                    LblState.ForeColor = Color.Red;
                    break;
            }
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    #endregion


    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}