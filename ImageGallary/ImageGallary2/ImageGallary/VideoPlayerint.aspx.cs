using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoPlayer : System.Web.UI.Page
{
    #region init settings
    // player width
    private int _W = 535;

    // player height
    private int _H = 305;

    // autoplay disabled
    bool auto = false;
    #endregion

    #region YoutubeClass
    #region YouTube Player default script: no autoplay, 320x240
    /// <summary>
    /// YouTube Player default script: no autoplay, 320x240
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">int</param>
    /// <returns>string</returns>
    public static string Get(string id)
    { return Get(id, false, 320, 240); }
    #endregion

    #region YouTube Player script w/autoplay option (320x240)
    /// <summary>
    /// YouTube Player script w/autoplay option (320x240)
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">bool</param>
    /// <returns>string</returns>
    public static string Get(string id, bool auto)
    { return Get(id, auto, 320, 240); }
    #endregion

    #region YouTube Player script w/autoplay option (320x240)
    /// <summary>
    /// YouTube Player script w/autoplay option (320x240)
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">int</param>
    /// <returns>string</returns>
    public static string Get(string id, int auto)
    { return Get(id, ((auto == 1) ? true : false), 320, 240); }
    #endregion

    #region YouTube Player script w/selectable: autoplay and W/H
    /// <summary>
    /// YouTube Player script w/selectable: autoplay and W/H options
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">bool</param>
    /// <param name="W">int</param>
    /// <param name="H">int</param>
    /// <returns>string</returns>
    public static string Get(string id, bool auto, int W, int H)
    { return Get(id, auto, W, H, true); }
    #endregion

    #region YouTube Player script w/selectable: autoplay, W/H and default border
    /// <summary>
    /// YouTube Player script w/selectable: autoplay, W/H, default border color 
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">bool</param>
    /// <param name="W">int</param>
    /// <param name="H">int</param>
    /// <param name="Border">bool</param>
    /// <returns>string</returns>
    public static string Get(string id, bool auto, int W, int H, bool Border)
    { return Get(id, auto, W, H, Border, "0x2b405b", "0x6b8ab6", 0); }
    #endregion

    #region YouTube Player script w/selectable: autoplay, W/H and border color
    /// <summary>
    /// YouTube Player script w/selectable: autoplay, W/H and border color
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">bool</param>
    /// <param name="W">int</param>
    /// <param name="H">int</param>
    /// <param name="Border">bool</param>
    /// <param name="C1">string</param>
    /// <param name="C2">string</param>
    /// <returns>string</returns>
    public static string Get
            (string id,
            bool auto,
            int W,
            int H,
            string C1,
            string C2)
    { return Get(id, auto, W, H, true, C1, C2, 0); }
    #endregion

    #region YouTube Player script w/selectable: autoplay, W/H and border color
    /// <summary>
    /// YouTube Player script w/selectable: autoplay, W/H and border color
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="auto">bool</param>
    /// <param name="W">int</param>
    /// <param name="H">int</param>
    /// <param name="Border">bool</param>
    /// <param name="C1">string</param>
    /// <param name="C2">string</param>
    /// <returns>string</returns>
    public static string Get
            (string id,
            bool auto,
            int W,
            int H,
            bool Border,
            string C1,
            string C2,
            int Start)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(@"<embed src='http://www.youtube.com/v/");

        // select the youTube item to play
        sb.Append(id);

        // set autoplay options (indicates number of plays)
        if (auto) sb.Append("&autoplay=1");

        // no related items to display
        sb.Append("&rel=0");

        // set border color 1 and 2
        if (Border)
        {
            sb.Append("&border=1");
            sb.Append("&color1=" + @C1);
            sb.Append("&color2=" + @C2);
        }

        // start position
        if (Start > 0) sb.Append("&start=" + Start.ToString());

        // allow full screen
        sb.Append("&fs=1");

        // closing single quote after parameter list
        sb.Append("' ");


        sb.Append("type='application/x-shockwave-flash' ");

        // add id
        sb.Append("id='youTubePlayer" + DateTime.Now.Millisecond.ToString() + "' ");
        sb.Append("allowscriptaccess='never' enableJavascript ='false' ");

        // set parameters: allowfullscreen
        sb.Append("allowfullscreen='true' ");

        // set width
        sb.Append("width='" + W.ToString() + "' ");

        // set height
        sb.Append("height='" + H.ToString() + "' ");

        sb.Append(@"></embed>");

        // get final script
        string scr = sb.ToString();

        sb = null;
        return scr;
    }
    #endregion
    #endregion

    #region Database
    public static OleDbConnection Connection
    {
        get
        {
            string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
            HttpServerUtility sv = HttpContext.Current.Server;
            constr += sv.MapPath(@"~/App_Data/GallaryData.mdb");

            OleDbConnection con = new OleDbConnection(constr);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    public static DataTable LoadDataTable(string CommandString)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
        {
            DA.Fill(ReturnMe);
        }

        return ReturnMe;
    }//Load Table From Database
    private void Loadvideo()
    {
        DataTable dt = LoadDataTable("SELECT TOP 1 MainVideoLink, MainVideoLinkW, MainVideoLinkH FROM Options");
        int W = _W;
        int H = _H;
        if (dt.Rows.Count == 0 || dt.Rows[0]["MainVideoLink"].ToString() == string.Empty)//Check Link Exists In Database
            return;
        if (dt.Rows[0]["MainVideoLinkW"].ToString() != string.Empty)// Get W
            W = Convert.ToInt32(dt.Rows[0]["MainVideoLinkW"]);
        if (dt.Rows[0]["MainVideoLinkH"].ToString() != string.Empty)// Get H
            H = Convert.ToInt32(dt.Rows[0]["MainVideoLinkH"]);

        Literal1.Text = Get(dt.Rows[0]["MainVideoLink"].ToString(), auto, W, H);
    }
    #endregion
    
    #region User events
    protected void Page_Load(object sender, EventArgs e)
    {
        Loadvideo();
    }
    #endregion

}
