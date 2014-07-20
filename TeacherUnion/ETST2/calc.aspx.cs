using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class calc : System.Web.UI.Page
{
    private int GetAge(DateTime dt)
    {
        return 2014 - dt.Year;
    }
    private struct CalcType
    {
        public int A3daa;
        public int Zoog;
        public int Abnaa;
        public int Waldeen;
    }
    private CalcType GetCalcType(int Age, bool Armala)
    {
        CalcType calc = new CalcType();

        if (Armala)
        {
            calc.Abnaa = 80;
            calc.Zoog = 150;
            calc.Waldeen = 350;
            return calc;
        }
        if (Age < 30)
        {
            calc.A3daa = 120;
            calc.Abnaa = 60;
            calc.Zoog = 110;
            calc.Waldeen = 250;
        }
        else if (Age >= 30 && Age <= 39)
        {
            calc.A3daa = 140;
            calc.Abnaa = 70;
            calc.Zoog = 130;
            calc.Waldeen = 280;
        }
        else if (Age >= 40 && Age <= 49)
        {
            calc.A3daa = 160;
            calc.Abnaa = 80;
            calc.Zoog = 150;
            calc.Waldeen = 310;
        }
        else if (Age >= 50 && Age <= 59)
        {
            calc.A3daa = 180;
            calc.Abnaa = 100;
            calc.Zoog = 170;
            calc.Waldeen = 350;
        }
        else if (Age >= 60)
        {
            calc.A3daa = 200;
            calc.Abnaa = 110;
            calc.Zoog = 190;
            calc.Waldeen = 380;
        }
        return calc;
    }
    private int CalcCards()
    {
        if (tbA3daa.Value == null || tbA3daa.Value.ToString() == string.Empty)
        {
            tbA3daa.Value = 0;
        }
        if (tbZoga.Value == null || tbZoga.Value.ToString() == string.Empty)
        {
            tbZoga.Value = 0;
        }
        if (tbAbnaa.Value == null || tbAbnaa.Value.ToString() == string.Empty)
        {
            tbAbnaa.Value = 0;
        }
        if (tbWaldeen.Value == null || tbWaldeen.Value.ToString() == string.Empty)
        {
            tbWaldeen.Value = 0;
        }
        int A3daa = Convert.ToInt32(tbA3daa.Value);
        int Zoga = Convert.ToInt32(tbZoga.Value);
        int Abnaa = Convert.ToInt32(tbAbnaa.Value);
        int Waldeen = Convert.ToInt32(tbWaldeen.Value);
        if (cbArmala.Checked)
        {
            return (Zoga + Abnaa + Waldeen) * 5;
        }
        else
        {
            return (A3daa + Zoga + Abnaa + Waldeen) * 5;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        if (deBirthDate.Value == null || deBirthDate.Value.ToString() == string.Empty)
        {
            return;
        }
        
        int Age = GetAge(deBirthDate.Date);
        CalcType typ = GetCalcType(Age, cbArmala.Checked);
        lblKroot.Value = CalcCards();
        

        if (cbArmala.Checked)
        {
            lblA3daa.Value = 0;
            lblZoga.Value = Convert.ToInt32(tbZoga.Text) * typ.Zoog;
            lblAbnaa.Value = Convert.ToInt32(tbAbnaa.Text) * typ.Abnaa;
            lblWaldeen.Value = Convert.ToInt32(tbWaldeen.Text) * typ.Waldeen;
        }
        else
        {
            lblA3daa.Value = Convert.ToInt32(tbA3daa.Text) * typ.A3daa;
            lblZoga.Value = Convert.ToInt32(tbZoga.Text) * typ.Zoog;
            lblAbnaa.Value = Convert.ToInt32(tbAbnaa.Text) * typ.Abnaa;
            lblWaldeen.Value = Convert.ToInt32(tbWaldeen.Text) * typ.Waldeen;
        }

        lblAgmalAshtrak.Value = Convert.ToInt32(lblA3daa.Value) + Convert.ToInt32(lblZoga.Value) + Convert.ToInt32(lblAbnaa.Value) + Convert.ToInt32(lblWaldeen.Value);
        lblAgmaliNhaai.Value = Convert.ToInt32(lblAgmalAshtrak.Value) + Convert.ToInt32(lblKroot.Value) + Convert.ToInt32(lblKtaab.Value) + Convert.ToInt32(lblEdarya.Value);
    }
}