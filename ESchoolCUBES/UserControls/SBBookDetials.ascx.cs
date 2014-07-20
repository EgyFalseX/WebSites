using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControl_SBBookDetials : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }
    
    public void LoadData(int IndexID, DataTable DT)
    {
        //DataTable DT = new DataTable("SearchedBooksTable");
        //DT = (DataTable)ViewState["SearchedBooksTable"];
        LblBookName.Text = DT.Rows[IndexID]["name_book"].ToString();
        LblBookLang.Text = DT.Rows[IndexID]["name_printl"].ToString();
        LblBookBran.Text = DT.Rows[IndexID]["name_fari"].ToString();
        LblBookDep.Text = DT.Rows[IndexID]["name_tahasos"].ToString();
        LblBookPre.Text = DT.Rows[IndexID]["name_alnasher"].ToString();
        LblBookOwner.Text = DT.Rows[IndexID]["masol"].ToString();
        //int bookid;
        //if (Request.QueryString["bookid"] != null)
        //{
        //    bookid = Convert.ToInt16(Request.QueryString["bookid"]);
        //    DataTable DT = new DataTable("SearchedBooksTable");
        //    DT = (DataTable)ViewState["SearchedBooksTable"];
        //    if (DT.Rows.Count > 0)
        //    {
        //        LblBookName.Text = DT.Rows[bookid]["name_book"].ToString();
        //        LblBookLang.Text = DT.Rows[bookid]["name_printl"].ToString();
        //        LblBookBran.Text = DT.Rows[bookid]["name_fari"].ToString();
        //        LblBookDep.Text = DT.Rows[bookid]["name_tahasos"].ToString();
        //        LblBookPre.Text = DT.Rows[bookid]["name_alnasher"].ToString();
        //        LblBookOwner.Text = DT.Rows[bookid]["masol"].ToString();
        //    }
        //}
    }

    protected void BtnReserve_Click(object sender, EventArgs e)
    {

    }
}
