<%@ Page Title="Feedback Form" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        // this stores the result.
        // true -> email sent
        // false -> email not sent

        bool result;
        // Here I use the value from the text box that is the users email address and call the sendEmail function.
        result = sendEmail(TextBox1.Text, TextBox2.Text,TextBox3.Text,TextBox4.Text);
        if (result == true)
        {
            lblresult.Text = "Thankyou for contacting us! Your feedback is of great importance!!";
        }
        else
        {
            lblresult.Text = "Sorry, unable to send message. Please try again!";
        }
    }

    private bool sendEmail(string name, string emailAddress, string subject, string comments)
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
            mailMessage.To.Add(new System.Net.Mail.MailAddress("Tushar Bhandari <xyz1abc23@gmail.com>"));
            mailMessage.From = new System.Net.Mail.MailAddress("Tushar Bhandari <xyz1abc23@gmail.com>");
            mailMessage.Subject = subject;
            mailMessage.Body = name + "(" + emailAddress + ") says: <br /> " + comments;
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
<link rel="Stylesheet" href="css/feedback.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="align">FEEDBACK</div><br />
<div class="title">It would be a pleasure if you could send us a feedback about the hotel and we will work towards your hospitality!</div>
<br /><br />
Name:<br />
<asp:TextBox ID="TextBox1" runat="server" CssClass="round"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ErrorMessage="Please enter your Name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
<br />
<br />
Email Address:<br />
<asp:TextBox ID="TextBox2" runat="server" CssClass="round"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ErrorMessage="Please enter your Email Address" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator id="RegularExpressionValidator2" 
          runat="server" ControlToValidate="TextBox2" 
          ErrorMessage="Enter valid Email Address" 
          ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
          CssClass="moveLeft">
        </asp:RegularExpressionValidator>
<br />
<br />
Subject:<br />
<asp:TextBox ID="TextBox3" runat="server" CssClass="round"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
    ErrorMessage="Please enter the subject" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
<br />
<br />
Comments:<br />
<asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="7" Columns="30" CssClass="round long"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ErrorMessage="Please enter your comments" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
<br />
<asp:Button ID="Button1" runat="server" Text="Submit Feedback" OnClick="Button1_Click" class="btn" />
<br />
<asp:Label ID="lblresult" runat="server" Text="" class="lbl"></asp:Label>
</asp:Content>

