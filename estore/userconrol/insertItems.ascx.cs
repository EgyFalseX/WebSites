using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userconrol_insertItems : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string path = "UploadFiles/" + System.IO.Path.GetFileName(fileupload1.filename);
        fileupload1.save_as(Server.MapPath(path));
        
            DB b = new DB();
            b.InsertItem(TxtItem_name.Text, txtItemPrice.Text, TxtItemDesc.Text, 1, "../" + path, Check_appear.Checked);
            TxtItem_name.Text = string.Empty;
            txtItemPrice.Text = string.Empty;
            TxtItemDesc.Text = string.Empty;
            Check_appear.Checked = false;
    }
}
