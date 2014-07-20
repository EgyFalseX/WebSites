using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CreateReply : System.Web.UI.Page
{
    const string imageFolder = "Assets/rplyattach/";
    const string SuccessText = "تــم ارســال الــــــــرد";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        Session.Remove("replyattach");
        
        if (IsPostBack)
        {
            Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.onunload = CloseWindow();");
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        int msgid = Convert.ToInt32(Request.QueryString["id"]);
        string attachfilename = string.Empty;
        
        if (Session["replyattach"] != null)
            attachfilename = Session["replyattach"].ToString();
        
        dsMails ds = new dsMails();
        dsMailsTableAdapters.msgreplyTableAdapter adpRply = new dsMailsTableAdapters.msgreplyTableAdapter();
        adpRply.Insert(msgid, Convert.ToInt32(sessionMails.UserID), editor.Html, attachfilename, DateTime.UtcNow.AddHours(2));
        
        Session.Remove("replyattach");

        HtmlForm form = Page.FindControl("formmsg") as HtmlForm;
        if (form != null)
        {
            form.Controls.Clear();
            WebControl textControl = CreateCentredText(SuccessText);
            textControl.ForeColor = System.Drawing.Color.FromArgb(0, 51, 51);
            if (textControl != null)
                form.Controls.Add(textControl);
            
        }

    }
    protected virtual WebControl CreateCentredText(string TextAlign)
    {
        Table table = new Table();
        TableRow row = new TableRow();
        TableCell cell = new TableCell();
        TableRow row2 = new TableRow();
        TableCell cell2 = new TableCell();
        Label lbl = new Label();
        Button btn = new Button();
        btn.Text = "اغلاق";
        btn.Click += (o, e) => { Response.Redirect("CreateReply.aspx?id=" + Request.QueryString["id"]); };

        lbl.Text = TextAlign;

        table.Rows.Add(row);
        table.Rows.Add(row2);

        row.Cells.Add(cell);
        row2.Cells.Add(cell2);
       
        cell.Controls.Add(lbl);
        cell2.Controls.Add(btn);

        table.Height = Unit.Percentage(100);
        table.Width = Unit.Percentage(100);
        table.BorderWidth = Unit.Pixel(0);

        cell.VerticalAlign = VerticalAlign.Middle;
        cell.HorizontalAlign = HorizontalAlign.Center;
        cell2.VerticalAlign = VerticalAlign.Middle;
        cell2.HorizontalAlign = HorizontalAlign.Center;

        lbl.Font.Name = "Tahoma";
        lbl.Font.Size = FontUnit.Point(8);

        return table;
    }
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        DateTime dt = DateTime.UtcNow.AddHours(2);
        string FName = "attach" + dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() +
            dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString() + uploader.UploadedFiles[0].FileName;

        uploader.UploadedFiles[0].SaveAs(MapPath(imageFolder + FName), true);
        Session["replyattach"] = FName;
        
    }

}