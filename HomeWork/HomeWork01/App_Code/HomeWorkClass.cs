using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for propertyClass
/// </summary>
public class HomeWorkClass
{
	public HomeWorkClass()
	{
		//
		// TODO: Add constructor logic here
		//
    }

    #region Home Work
    int _id, _asase_code, _alsofof_code,  _fasl_code, _hasa_code, _mawad_no, _daycode, _read_code ;
    long _SPOS, _code;
    string _home_work;
    DateTime _add_date;

    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public long Code
    {
        get { return _code; }
        set { _code = value; }
    }

    public long School
    {
        get { return _SPOS; }
        set { _SPOS = value; }
    }

    public int Asase_code
    {
        get { return _asase_code; }
        set { _asase_code = value; }
    }

    public int Alsofof_Code
    {
        get { return _alsofof_code; }
        set { _alsofof_code = value; }
    }

    public int Fasl_code
    {
        get { return _fasl_code; }
        set { _fasl_code = value; }
    }

    public int Hasa_code
    {
        get { return _hasa_code; }
        set { _hasa_code = value; }
    }

    public int Mawad_no
    {
        get { return _mawad_no; }
        set { _mawad_no = value; }
    }

    public int Daycode
    {
        get { return _daycode; }
        set { _daycode = value; }
    }

    public int Read_code
    {
        get { return _read_code; }
        set { _read_code = value; }
    }

    public string Home_work
    {
        get { return _home_work; }
        set { _home_work = value; }
    }

    public DateTime Add_date
    {
        get { return _add_date; }
        set { _add_date = value; }
    }

  

#endregion

    //#region Motabaa
    //int _Mid, _Mstu_code, _MCODE, _Masase_code, _MSPOS, _Mreply_code;
    //string _Mtitle;// tital of motabaa
    //string _Mnotice; //teacher notice
    //string _Mreply;//father reply
    //DateTime _Madd_date;

    ////public int MId
    ////{
    ////    get { return _Mid; }
    ////    set { _Mid = value; }
    ////}

    //public int stu_code
    //{
    //    get { return _stu_code; }
    //    set { _stu_code = value; }
    //}

    //public int MCode
    //{
    //    get { return _MCODE; }
    //    set { _MCODE = value; }
    //}

    //public int Masase_code
    //{
    //    get { return _Masase_code; }
    //    set { _Masase_code = value; }
    //}

    //public int MSchool
    //{
    //    get { return _MSPOS; }
    //    set { _MSPOS = value; }
    //}

    //public int Mreply_code
    //{
    //    get { return _Mreply_code; }
    //    set { _Mreply_code = value; }
    //}

    //public string MTitle
    //{
    //    get { return _Mtitle; }
    //    set { _Mtitle = value; }
    //}

    //public string MNotice
    //{
    //    get { return _Mnotice; }
    //    set { _Mnotice = value; }
    //}

    //public string Mreply
    //{
    //    get { return _Mreply; }
    //    set { _Mreply = value; }
    //}

    //public DateTime MAdd_date
    //{
    //    get { return _Madd_date; }
    //    set { _Madd_date = value; }
    //}

    //#endregion


}
