using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using Functions;

public partial class MainMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadPanelBarMain_Load(object sender, EventArgs e)
    {
        
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        DataTable AllMenuItems = MC.LoadDataTable(string.Format(@"SELECT PageName FROM MenuItemName WHERE
        EXISTS (SELECT TOP (1) MenuItemNameID FROM RoleDetial WHERE (MenuItemNameID = MenuItemName.MenuItemNameID) 
        AND RoleID IN (SELECT RoleId FROM UserRoles WHERE UserId = {0}))", TheSessions.UserID), "");
        foreach (DataRow row in AllMenuItems.Rows)
        {
            RadPanelItem RPI = (RadPanelItem)RadPanelBarMain.FindItemByValue(row["PageName"].ToString());
            if (RPI == null)
                continue;
            RPI.Visible = true;
            if (RPI.Parent != null)
                RPI.Parent.Visible = true;
            if (RPI.Parent.Parent != null)
                RPI.Parent.Parent.Visible = true;

        }
        if (Request.QueryString["expendThis"] != null)
        {
            string X = Request.QueryString["expendThis"];
            RadPanelItem RPI = (RadPanelItem)RadPanelBarMain.FindItemByValue(Request.QueryString["expendThis"]);
            if (RPI != null)
            {

                if (RPI.Parent is RadPanelBar == false)
                    ((RadPanelItem)RPI.Parent).Expanded = true;
                if (RPI.Parent.Parent is RadPanelBar == false)
                    ((RadPanelItem)RPI.Parent.Parent).Expanded = true;
            }
            
        }
    }
}