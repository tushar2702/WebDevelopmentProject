<%@ Page Title="Tushar Hotels LoggedIn" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
    /* This is the logic to redirect to the login page if the user has logged out from any page
     he was previously logged in. Now he logs out of all pages! */
        protected void Page_Load(object sender, EventArgs e)
            {
            MembershipUser myObject = Membership.GetUser();
                if (myObject != null)
                {
                    Session["usr"] = Profile.UserName.ToString(); // preserve the user name in session variable usr
                }else{
                       Response.Redirect("~/Project/login.aspx");
                 }
            
        }   

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/loggedin.css" />
<link rel="Stylesheet" href="css/loginstatus.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" cssClass="loginStatus" LogoutPageUrl="~/Project/login.aspx" />   
    <div class="welcome_message">Welcome <asp:LoginName ID="LoginName1" runat="server" CssClass="loginName"></asp:LoginName>!</div>
    <br />
    <br />
    <div class="MemberContent">You are now a member of Tushar Hotels and Resorts. We are pleased to have you as our guest. You can go ahead and search for rooms that are available and
    select a room for booking. You can also retrieve any existing bookings that you have made! </div>
    <br />
    <div class="links">
    <div> Check availability of Rooms here <a href="reservation.aspx" target="_blank"> GO </a></div>
    <br />
    <div> Retrieve your past bookings here <a href="retrieve.aspx" target="_blank"> GO </a></div>
    <br />
    <div> Track your rewards gained here&nbsp; <a href="rewards.aspx" target="_blank"> GO </a></div>
    </div>             
</asp:Content>

