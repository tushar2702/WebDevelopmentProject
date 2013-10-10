<%@ Page Title="Tushar Hotels Login" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
    /* This is the logic to redirect to the login page if the user has logged out from any page
     he was previously logged in. Now he logs out of all pages! */
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            Response.Redirect("~/Project/loggedin.aspx");
        }

    }

    protected void Login2_LoggingIn(object sender, LoginCancelEventArgs e)
    {
        // This is so that users can view the update progress template (circular moving image)
        // when logging in!
        System.Threading.Thread.Sleep(1000);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="Stylesheet" href="css/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Script Manager is required for any page having AJAX functionality -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!-- UpdateProgress control which has an image in the progress template which says loading. -->
    <div class="Body">
        <div class="login1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:LoginView ID="LoginView2" runat="server">
                        <LoggedInTemplate>
                        </LoggedInTemplate>
                        <AnonymousTemplate>
                            <asp:Login ID="Login2" runat="server" CreateUserText="New User?? Signup" CreateUserUrl="register.aspx"
                                DestinationPageUrl="loggedin.aspx" FailureText="Username/password is incorrect.Please try again!"
                                FailureTextStyle-CssClass="failure_text" CssClass="login" LoginButtonStyle-CssClass="button1"
                                TextBoxStyle-CssClass="textbox" LabelStyle-CssClass="label" TitleText="" RememberMeText="Remember Me"
                                OnLoggingIn="Login2_LoggingIn">
                            </asp:Login>
                        </AnonymousTemplate>
                    </asp:LoginView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <div class="update">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <div>
                            <img alt="" src="images/ajax-loader.gif" class="loaderimg" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div class="text">
                <span class="credentials">Evaluation Login:<br />
                </span>
                <br />
                Username: tushar<br />
                Password: tushar@123
            </div>
        </div>
        <br />
    </div>
</asp:Content>
