using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for zdata
/// </summary>
public class zdata
{
    object _memberid;
    object _membernid;
    object _schoolcode;
    object _NAME;
    object _bdate;
    object _taeendate;
    object _salary;
    object _userin;
    object _datein;
    object _rema;
    public zdata(object memberid, object membernid, object schoolcode, object NAME, object bdate, object taeendate, object salary, object rema, object userin, object datein)
    {
        _memberid = memberid;
        _membernid = membernid;
        _schoolcode = schoolcode;
        _NAME = NAME;
        _bdate = bdate;
        _taeendate = taeendate;
        _salary = salary;
        _userin = userin;
        _datein = datein;
        _rema = rema;
    }
    public object memberid_ { get { return this._memberid; } }
    public object membernid_ { get { return this._membernid; } }
    public object schoolcode_ { get { return this._schoolcode; } }
    public object NAME_ { get { return this._NAME; } }
    public object bdate_ { get { return this._bdate; } }
    public object taeendate_ { get { return this._taeendate; } }
    public object salary_ { get { return this._salary; } }
    public object rema_ { get { return this._rema; } }
    public object userin_ { get { return this._userin; } }
    public object datein_ { get { return this._datein; } }
   
}