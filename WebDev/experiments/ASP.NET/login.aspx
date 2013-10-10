<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // Displays the profile name that was filled in as your first name in the register form.
        if (Profile.FirstName != null) 
        {
            Label l = (Label)LoginView1.FindControl("lname");
            if (l != null)
            {
                l.Text = Profile.FirstName;
            }
        }
    }
 
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Login Control in ASP.NET </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    
    .login
    {
        background-color:Teal;
        width:300px;
        border:2px solid black;
    }
    
    .loginStatus
    {
        width:750px;
        float:right;
        font-size:larger;
        font-family:Trebuchet MS,"Sans-Serif";
    }
    
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Login Control in ASP.NET </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To use login control of ASP.NET and to use the database to check for authenticated users. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://net35.ccs.neu.edu/home/gnaik/Experiments/ex20_loginC.aspx" target="_blank">
        http://net35.ccs.neu.edu/home/gnaik/Experiments/ex20_loginC.aspx</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        In this experiment, I have demonstrated the use of login control of ASP.NET and I have followed all the steps 
        given on the web site of Gautam naik that I referred to. Its a step by step approach. </p>
    

    <p class="content">
        The credentials that are required to log in to the page is being stored in SQL Server and the "Register"
        page is there for you to register yourself in the database. Once you are registered, you can 
        go ahead and login. When you are logged in the text will change to Logout and you can click 
        on logout. </p>
        
    <p class="content">
        I'll just try to summarize a few steps. First, you need to modify the authentication tag in web.config
        and then add membership tag. Then create a ASP.NET login control and add login view control to it.Further we need 
        to run ASP.NET configuration. For the steps you can check the link above. It is beautiful and perfect. I really need to 
        thank Gautam Naik for such a beautiful description on how to use login and register. </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/login.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
      <div>
    <!-- Login or Logout status -->
    <!-- When the user is logged in, use login template -->
    <!-- When the user is not authenticated to log in or this person is anonymous, use anonymous template -->
    
    <br />
        <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
        <asp:LoginStatus ID="LoginStatus1" runat="server" cssClass="loginStatus" />
            Welcome <asp:Label id="lname" runat="server"/>!
        </LoggedInTemplate>
        
        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server" CreateUserText="New User?? Register" CreateUserUrl="~/experiments/ASP.NET/register.aspx"
                DestinationPageUrl="~/experiments/ASP.NET/login.aspx" RememberMeText="Remember me."
                FailureText="Username or password you entered is incorrect.Please try again!"
                CssClass="login">
            </asp:Login>
        </AnonymousTemplate>
    </asp:LoginView>
    </div>
    </form>
</body>
</html>
