using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class TreeViewer : System.Web.UI.Page
{
    public string LoadData()
    {
        if (treeList.FocusedNode == null)
            return string.Empty;

        DataRowView row = (DataRowView)treeList.FocusedNode.DataItem;
        if (row == null)
            return string.Empty;

        
        return treeList.FocusedNode.GetValue("Contains").ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
            return;
        }
		//if (e.Column.FieldName == "Data_Path")
			//{
				//if (e.Value.ToString().Length > 31)
				//{
					//var displayText = Regex.Replace(e.Value.ToString(), "<.*?>", string.Empty).Substring(0, 31);
					//e.DisplayText = string.Concat(displayText, "...");
				//}
			//}
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        DevExpress.Web.ASPxTreeList.TreeListNode node = treeList.FindNodeByFieldValue("ItemName", tbsearch.Text);
        if (node != null)
        {
            node.Focus();
        }
    }
}