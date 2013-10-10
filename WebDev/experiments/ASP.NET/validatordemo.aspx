<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        /* This will run the code only once, and then when we click a button or fill 
        out some boxes and send that databack to the server that is called a postback the code wont run the 2nd time */
        if (!this.IsPostBack)
        {
           
            Calendar1.SelectionMode = CalendarSelectionMode.Day; // To select only one day at a time
            RangeValidator1.Type = ValidationDataType.Date; // to set the validation type
            // Minimum and maximum values of the range
            RangeValidator1.MinimumValue = DateTime.Now.ToShortDateString(); 
            RangeValidator1.MaximumValue = DateTime.Now.AddDays(7).ToShortDateString();
            RangeValidator1.ErrorMessage = "Select date between today and next 7 days!";
        }
        
    }

    /*This will append the name and the date selected and print it to the label */
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        Label1.Text = "Hi " + TextBox2.Text + ", you have selected " + Calendar1.SelectedDate.ToLongDateString();
    }


    /*Whenever the date on the calendar is changed this function will be called and its textbox value will change */
    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {
                TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();  

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

    /* CSS for the title of the fields */
    .FieldTitle
    {
    font-weight:bold;
    color:Maroon;
    
    }
    
    /*Setting the form margin to 20px */
    #form1 
    {
        width:100%;
        margin: 20px;
        
    }
    
    /*Setting the background color*/
    body
    {
        background-color:#ddd;
    }

    /* Setting the width and height of the submit button */
    .submitB
    {
        width:120px;
        height:50px;    
    }
    
    

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <span class="FieldTitle">* Enter your name: </span>
    
        <!-- text box for entering the name followed by the required field validator on it -->
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="Please enter your name" ForeColor="red" Font-Italic="true"></asp:RequiredFieldValidator>
        <br />
        <br />
    
        <!-- text box for entering the phone number followed by its regular expression validator -->
        <!-- This checks for the proper format (xxx)-xxx-xxx -->
        <span class="FieldTitle">  Enter US phone #   :  </span>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="Please enter valid US Phone#"
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" forecolor="red" Font-Italic="true"></asp:RegularExpressionValidator>
            
        <br />
        <br />
        <!-- Textbox for email address and its validation. The validation Expression is used to validate the email address for 
        things such as @, . etc. and email should have format (ex. abc@neu.edu) -->
        <span class="FieldTitle">Enter Email Address:</span>    
        <asp:TextBox id="TextBox4" runat="server"></asp:TextBox>
          &nbsp;
        <asp:RegularExpressionValidator id="RegularExpressionValidator2" 
          runat="server" ControlToValidate="TextBox4" 
          ErrorMessage="Enter valid email address" 
          forecolor="red" Font-Italic="true"
          ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>

        <br />
        <br />
        <!-- A label to print if the form is submitted with all the fields having correct values entered in them. -->
        <asp:Label ID="Label1" runat="server" Text=" " ForeColor="Blue" Font-Italic="true"></asp:Label>
        <br />    
        <!-- Calendar control and its properties set -->
        <asp:Calendar ID="Calendar1" runat="server"
            onselectionchanged="Calendar1_SelectionChanged1" BackColor="Black" ForeColor="White" 
            DayHeaderStyle-BackColor="Blue" SelectedDayStyle-BackColor="LightBlue"></asp:Calendar>
        <br />
        <span class="FieldTitle">Selected Date: </span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
        <!-- RangeValidator on the calendar to check for the proper date (For example if today's date is 02/24/2012,
        you need to enter a date value between 02/24/2012 and 03/02/2012)-->
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ErrorMessage="RangeValidator" ControlToValidate="TextBox1" ForeColor="red" Font-Italic="true"></asp:RangeValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="Please select a date" ForeColor="red" Font-Italic="true"></asp:RequiredFieldValidator>
        <p class="align">
        <!-- A submit button to submit the form -->
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Submit Date" CssClass="submitB"/>
         
        </p>
    
    </div>
    </form>
</body>
</html>
