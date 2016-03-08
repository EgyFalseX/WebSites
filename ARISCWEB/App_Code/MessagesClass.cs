using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MessagesClass
/// </summary>
public class MessagesClass
{
    private string invitationMsg;
    public string contactUsMsg;


    public string GetContactUsMsg()
    {
        invitationMsg = contactUsMsg;
        return invitationMsg;
    }
   


   
}