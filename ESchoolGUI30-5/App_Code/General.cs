using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for General
/// </summary>
public class General
{
	public General()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static AjaxControlToolkit.ModalPopupExtender SearchPoPUp(System.Web.UI.MasterPage master, string PoPUpName)
    {
        System.Web.UI.WebControls.ContentPlaceHolder holder = (System.Web.UI.WebControls.ContentPlaceHolder)master.FindControl("ContentPlaceHolder1");
        AjaxControlToolkit.ModalPopupExtender popup = new AjaxControlToolkit.ModalPopupExtender();

        popup = (AjaxControlToolkit.ModalPopupExtender)holder.FindControl(PoPUpName);

        return popup;
    }
}
