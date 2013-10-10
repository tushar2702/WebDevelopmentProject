<%@ Page Title="Room Booked" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            Session["flagvar"] = "true";    
        }
        else
        {
            Response.Redirect("~/Project/login.aspx");
        }
        
    }

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

        TextBox2.Text = "";
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
            mailMessage.To.Add(new System.Net.Mail.MailAddress(emailAddress));
            mailMessage.From = new System.Net.Mail.MailAddress("Tushar Bhandari <xyz1abc23@gmail.com>");
            mailMessage.Subject = "Tushar Hotels and Resorts Booking Confirmation";
            mailMessage.Body = "Hello "+ Session["usr"] + ".. Thank you for wishing to stay with us! I am sure you will have a wonderful time here. <br /><br />" +
                "Your booking details are as follows: <br /><br />" + 
                "<table><tr><td>Room Type:</td><td>" + Session["type"] + " </td></tr> " +
                "<tr><td>Checkin Date:</td><td>" + Session["checkin"] + " </td></tr> " +
                "<tr><td>Checkout Date:</td><td>" + Session["checkout"] + " </td></tr> " +
                "<tr><td>Number of guests:</td><td>" + Session["guests"] + " </td></tr></table>" +
                "<br /> See you soon!!";
            System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            //if you mail contains html format keep this true else it will be plain text
            mailMessage.IsBodyHtml = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("xyz1abc23@gmail.com", "xyz1abc23");
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


    


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/loginstatus.css" />
<link rel="Stylesheet" href="css/booked.css" />
<link rel="Stylesheet" href="css/loggedin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:LoginStatus ID="LoginStatus1" runat="server" cssClass="loginStatus" />   
<br />
<div class="success">You have successfully booked a room. We welcome you to have a pleasant stay with us! </div>
<br />
<div class="sendmail">You can also enter your email address and click on send if you want an email to be sent to you with your booking details. Thank you!</div>
<div>
    
    <p>
    <span class="fieldTitle"> Email Address</span>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" CssClass="round txtfield"></asp:TextBox>
    <br />
    <!-- regular expression validator for the email address -->
    <asp:RegularExpressionValidator id="RegularExpressionValidator2" 
          runat="server" ControlToValidate="TextBox2" 
          ErrorMessage="Enter valid email address" 
          forecolor="red" Font-Italic="true"
          ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator
        ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your email address" 
        ControlToValidate="TextBox2" ForeColor="red" Font-Italic="true"></asp:RequiredFieldValidator>
    </p>
    <p>

    <asp:Button ID="Button1" runat="server" Text="Send Email" onclick="Button1_Click" CssClass="btn" />
    <!-- This is the label to display the message either email sent or the error message -->
    <asp:Label ID="lblresult" runat="server" Text=" " CssClass="lbl"></asp:Label>
    </p>
    <div class="links">
    <div> Check for more Rooms Availabile <a href="reservation.aspx" target="_blank"> GO </a></div>     
    <br />
    <div> Retrieve your past bookings here <a href="retrieve.aspx" target="_blank"> GO </a></div>
    <br />
    <div> Track your rewards gained here&nbsp; <a href="rewards.aspx" target="_blank"> GO </a></div>
    </div>             
    </div>
</asp:Content>

