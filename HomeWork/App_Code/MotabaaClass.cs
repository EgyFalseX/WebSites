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
/// Summary description for MotabaaClass
/// </summary>
public class MotabaaClass:SHWClass
{
	public MotabaaClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    string _title, _notice, _reply;
    int _reply_code;




    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }

    public string Notice
    {
        get { return _notice; }
        set { _notice = value; }
    }

    public string Reply
    {
        get { return _reply; }
        set { _reply = value; }
    }

    public int ReplyCode
    {
        get { return _reply_code; }
        set { _reply_code = value; }
    }
}
