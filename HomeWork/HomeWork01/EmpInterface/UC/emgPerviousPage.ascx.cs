using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_emgPerviousPage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
            {
                Session["prev"] = Request.UrlReferrer.ToString();
            }
        }
        doPrevious();
    }
    protected virtual void OnPreInit(EventArgs e)
    {
        doPrevious();
    }
    protected override void OnInit(EventArgs e)
    {
        doPrevious();
            base.OnInit(e);
    }
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
            {
                Session["prev"] = Request.UrlReferrer.ToString();
            }
        }
        doPrevious();
    }
    protected override void LoadControlState(object savedState)
    {
            base.LoadControlState(savedState);
            doPrevious();
    }
     
    protected void PrePage_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    Session["prev"] = Request.UrlReferrer.ToString();
        //}
        doPrevious();
    }
    string firstSes;
    string secondses;
    string indexurl;
    bool forc;
    public string FirstSession { get { return firstSes; } set { firstSes = value; } }
    public string SecondSession { get { return secondses; } set { secondses = value; } }
    public string IndexUrl { get { return indexurl; } set { indexurl = value; } }
    public bool ForceIndex { get { return forc; } set { forc = value; } }
    protected override void OnPreRender(EventArgs e)
    {

            base.OnPreRender(e);
            doPrevious();
    }
   
    public void doPrevious()
    {
        if (FirstSession != null)
        {
            if (!ForceIndex)
            {
                if (Session[FirstSession] == null)
                {
                    if (Session["prev"] != null)
                    {
                        Response.Redirect(Session["prev"].ToString());
                    }
                    else if (IndexUrl != null)
                    {
                        Response.Redirect(IndexUrl);
                    }
                    else
                    {

                    }
                }
            }
            else if (ForceIndex)
            {
                if (Session[FirstSession] == null)
                {
                    if (IndexUrl != null)
                    {
                        Response.Redirect(IndexUrl);
                    }
                    else
                    {

                    }
                }
            }
        }
    }
}
