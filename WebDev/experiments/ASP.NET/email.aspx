<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
protected void Button1_Click(object sender, EventArgs e)
    {
        // this stores the result.
        // true -> email sent
        // false -> email not sent
        
        bool result;
        // Here I use the value from the text box that is the users email address and call the sendEmail function.
        result = sendEmail(TextBox2.Text);
        if (result == true)
        {
            lblresult.Text = "Your message has been sent !";
        }
        else
        {
            lblresult.Text = "Sorry, unable to send message. Please try again!";
        }            
    }
      
    private bool sendEmail(string emailAddress)
        {

            try
            {
            // using the namespace System.Net.Mail create an object of MailMessage
            // The from email address is my test email address. The to email address is the one the user inputs.
            // The subject and the body is fixed by me.
            // Then create SmtpClient object and add the smtp server name
            // Finally call send passing the MailMessage object
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            bool SSLSecure = true;
            mailMessage.To.Add(new System.Net.Mail.MailAddress (emailAddress));  
            mailMessage.From = new System.Net.Mail.MailAddress("Tushar Bhandari <xyz1abc23@gmail.com>");
            mailMessage.Subject = "ASP.NET e-mail test";
            mailMessage.Body = "Hello!! This is an ASP.NET test e-mail!";
            System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            //if you mail contains html format keep this true else it will be plain text
            mailMessage.IsBodyHtml = true;        
            smtpClient.Credentials = new System.Net.NetworkCredential ("xyz1abc23@gmail.com","xyz1abc23");
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = SSLSecure;
            smtpClient.Send(mailMessage);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Sending Email using ASP.NET </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
     
    
    /* CSS for round text boxes */
    .round
    {
        border:2px solid gray;
        border-radius:8px;
        -webkit-border-radius:8px;
        -moz-border-radius:8px;
        box-shadow: 2px 2px 3px gray inset;
        -webkit-box-shadow: 2px 2px 3px gray inset;
        -moz-box-shadow: 2px 2px 3px gray inset;
        padding:7px;
        font-family:Trebuchet MS;
        font-size:18px;
        color:Gray;
        
        
    }
    
    /* CSS for the button */
    .btn
    {
        padding:8px;
        width:100px;
        
    }
    
    /* CSS for title of the fields such as from and to */
    .fieldTitle 
    {
      font-family: Century Gothic, Trebuchet MS, Sans-Serif;
      font-size:20px;
      font-weight:bold;
      color:Red;   
     }
     
     
     
     .lbl
     {
     color:Gray;
     font-size:15px;
     font-family:Trebuchet MS,Sans-serif;
     font-style:italic;    
         
     }
     
     
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Sending Email using ASP.NET </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To use ASP.NET System.Net.Mail namespace to send emails. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.worldofasp.net/tut/Email_ASP.NET2/Sending_Email_in_ASPNET_20_83.aspx" target="_blank">
        How to send Emails using ASP.NET - 1</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://weblogs.asp.net/scottgu/archive/2005/12/10/432854.aspx" target="_blank">
        How to send Emails using ASP.NET - 2</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://www.exclamationsoft.com/exclamationsoft/netmailbot/help/website/HowToFindTheSMTPMailServerForAnEmailAddress.html" target="_blank">
        How to find the SMTP mail server for an email address. </a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
         </p>
    <p class="content">
        I always wanted to try sending emails through ASP.NET. In this experiment, I have made one text-box which
        take as input the "to" of the email address. However,the from email address (my test gmail address), 
        the body and the subject of the email is fixed. I would definitely want to use this feature in feedback forms
        in my project that will be mailed to the desired recipient and/or any other functionality. </p>
    

    <p class="content">
        Next, I have also used a required field validator for the text box. It will display a message saying
        "Please enter your email address" if the field is left blank.</p>
        
    <p class="content">
        I also experimented with the text box and the button control. I gave padding to the button and also gave 
        border-radius and box-shadow to the text boxes as well as changed their fonts. </p>
    <p class="content">
        The detailed steps are as follows: </p>
        <ol>
        <li>Using the namespace System.Net.Mail create an object of MailMessage.</li>
        <li>Add the to email address using <code>mailMessage.To.Add(new System.Net.Mail.MailAddress (emailAddress))</code></li>
        <li>Similarly add the from email address.</li>
        <li>Specify the subject and the body using <code>mailMessage.Subject = "..."</code>
            and <code>mailMessage.Body = "..."</code></li>
        <li>Then create an object of SmtpClient and add the smtp server name</li>
        <li>Add your credentials and delivery method</li>
        <li>Finally send the mail using <code>smtpClient.Send(mailMessage)</code></li>
        </ol>
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/email.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
   <div>
    
    <p class="align">
    <span class="fieldTitle"> To email address:</span>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="round txtfield"></asp:TextBox>
    <asp:RequiredFieldValidator
        ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your email address" 
        ControlToValidate="TextBox2" ForeColor="red" Font-Italic="true"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator id="RegularExpressionValidator2" 
          runat="server" ControlToValidate="TextBox2" 
          ErrorMessage="Enter valid email address" 
          forecolor="red" Font-Italic="true"
          ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
    </p>
    <p>

    <asp:Button ID="Button1" runat="server" Text="Send Email" onclick="Button1_Click" CssClass="btn" />
    <!-- This is the label to display the message either email sent or the error message -->
    <asp:Label ID="lblresult" runat="server" Text=" " CssClass="lbl"></asp:Label>
    </p>
         
    </div>
    </form>
</body>
</html>
