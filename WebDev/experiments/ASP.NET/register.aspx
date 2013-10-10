<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    // Register the new user and add his profile to database
    // So now I can store the users first name and last name also in the database along with the other credentials.
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        ProfileCommon p = (ProfileCommon)ProfileCommon.Create(CreateUserWizard1.UserName, true);
        p.FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Fname")).Text;
        p.LastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lname")).Text;
        p.Save();

    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Register Control </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    
    .userWiz
    {
        background-color:Teal;
        border: 2px solid black;
    }
    
    .red
    {
        color:Red;
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Register - CreateUserWizard control in ASP.NET </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate CreateUserWizard control in ASP.NET and help any user to register himself in the database. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://net35.ccs.neu.edu/home/gnaik/Experiments/ex21_register.aspx" target="_blank">
        http://net35.ccs.neu.edu/home/gnaik/Experiments/ex21_register.aspx</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
         </p>
    <p class="content">
        This experiment makes use of the CreateUserWizard control in ASP.NET and allows new users to 
        register themselves in the database. </p>
    

    <p class="content">
        You can try registering yourself here and then make use of the previous experiment to login
        yourself and see a welcome message with your name printed. This is a very important experiment
        from the point of view of my project.   </p>
        
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/register.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
   <div>
   <!-- This is the CreateUserWizard control that is used to register new users. Once you register yourself
   and click on continue it goes to the logged in page. that is the login page with the loggedin Template -->
<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        CancelDestinationPageUrl="~/experiments/ASP.NET/login.aspx" 
        ContinueDestinationPageUrl="~/experiments/ASP.NET/login.aspx" 
        oncreateduser="CreateUserWizard1_CreatedUser" CreateUserButtonText="Register" CssClass="userWiz">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table border="0">
                        <tr>
                            <td align="center" colspan="2">
                                Register User</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="FnameLabel" runat="server" 
                                    AssociatedControlID="Fname">First Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Fname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="FnameRequired" runat="server" 
                                    ControlToValidate="Fname" 
                                    ErrorMessage="First Name is required." 
                                    ToolTip="First Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lnameLabel" runat="server" 
                                    AssociatedControlID="lname">Last Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="lnameRequired" runat="server" 
                                    ControlToValidate="lname" 
                                    ErrorMessage="Last Name is required." 
                                    ToolTip="Last Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" ErrorMessage="Security question is required." 
                                    ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                    ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="The Password and Confirmation Password must match." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" class="red">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    </form>
</body>
</html>
