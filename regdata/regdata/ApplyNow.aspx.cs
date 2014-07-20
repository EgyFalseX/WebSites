using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApplyNow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void showTabs_Init(object sender, EventArgs e)
    {
        //if (!IsCallback && !IsPostBack)
        //{
        //    ASPxCheckBox cb = (ASPxCheckBox)sender;
        //    cb.Checked = pageControl.ShowTabs;
        //}
    }
    protected void showTabs_CheckedChanged(object sender, EventArgs e)
    {
        //ASPxCheckBox cb = (ASPxCheckBox)sender;
        //pageControl.ShowTabs = cb.Checked;
        //popupControl.ShowOnPageLoad = false;
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        dsRegdataTableAdapters.regdataTableAdapter adp = new dsRegdataTableAdapters.regdataTableAdapter();
        adp.Insert(Convert.ToByte(cbSectorId.Value), Convert.ToByte(cbGradeId.Value), (string)tbstudentname.Value, Convert.ToByte(cbGenderId.Value), Convert.ToDateTime(deBirthdate.Value), (string)tbReligion.Value, (string)tbNationality.Value,
            (string)tbLanguage.Value, (string)tbPreviousschool.Value, (string)tbLanguageofInstruction.Value, (string)tbPresentClassLevel.Value, Convert.ToInt32(tbAttendaneFROMYEAR.Value), Convert.ToInt32(tbAttendaneTOYEAR.Value),
            Convert.ToBoolean(ceskippedyear.Value), (string)tbNameFather.Value, (string)tbFatherNationality.Value, (string)tbOccupation.Value, (string)tbHomeAddress.Value, (string)tbTelephone.Value, (string)tbMobile.Value,
            (string)tbEmail.Value, (string)tbNameMother.Value, (string)tbMotherNationality.Value, (string)tbMotherOccupation.Value, (string)tbMotherHomeAddress.Value, (string)tbMotherTelephone.Value, (string)tbMotherMobile.Value,
            (string)tbMotherEmail.Value, Convert.ToByte(cbMaritalStatusId.Value), (string)tbNameGuard.Value, (string)tbGuardNationality.Value, (string)tbGuardrOccupation.Value, (string)tbGuardHomeAddress.Value,
            (string)tbGuardTelephone.Value, (string)tbGuardMobile.Value, (string)tbGuardEmail.Value, (string)string.Empty, (string)tbOtherGuard.Value, (string)tbOtheNationality.Value, (string)tbOtheOccupation.Value,
            (string)tbOtheHomeAddress.Value, (string)tbOtheTelephone.Value, (string)tbOtheMobile.Value, (string)tbOtheEmail.Value);
        Response.Redirect("RegDone.aspx");
        //popupControl.JSProperties["popDaya"] = "Registration completed ...";

    }
   
}