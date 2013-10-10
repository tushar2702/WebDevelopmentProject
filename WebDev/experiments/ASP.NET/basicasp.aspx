<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void RadioButtonList1_SelectedIndexChanged(object sender, System.EventArgs e) {
        string li = RadioButtonList1.SelectedItem.Text; // This will return the text of the selected radio button
        // Switch case to choose which radio button is selected and accordingly take action
        switch (li){
            case ("Convert to Uppercase"):
                Label1.Text = TextBox1.Text.ToUpper();
                break;

            case ("Convert to Lowercase"):
                Label1.Text = TextBox1.Text.ToLower();
                break;

            case ("Prepend"):
                Label1.Text = ""; // removes the existing result because of any other selection.
                Label1.Text += "Hello " + TextBox1.Text; 
                break;

            case ("Append"):
                Label1.Text = "";
                Label1.Text += TextBox1.Text + ", have a nice day! ";
                break;

            case ("Copy"):
                Label1.Text = "";
                Label1.Text = TextBox1.Text;
                break;

            case ("Split"):
                Label1.Text = "";
                string mystring = TextBox1.Text.ToString(); 
                char[] separator = new char[] {'.', ' '};  // separators(in my e.g. i have chosen dot or space)
                string[] splitList = mystring.Split(separator); // split method to split at separator and store in array
                for (int i = 0; i < splitList.Length; i++) // for loop to display all the strings in the array
                    Label1.Text += splitList[i] + "<br/ > ";
                break;


            case ("Pad Left"):
                Label1.Text = "";
                string left = TextBox1.Text.ToString();
                Label1.Text = left.PadLeft(50, '-'); // '-' is the pad character, 50 is the width
                break;

            case ("Pad Right"):
                Label1.Text = "";
                string right = TextBox1.Text.ToString();
                Label1.Text = right.PadRight(50, '-');
                break;      
                                
            default:
                Label1.Text = "Invalid input";
                break;
        }
    }

    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Basic ASP.NET and String Handling in C# </title>

    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    /* CSS for RadioButtonList*/
    .rb 
    {
        padding:10px;
        text-align:justify;
    }
         
    
    h3 
    {
        font-family:'Trebuchet MS','Arial','Sans-Serif';
        font-size:20px;
        color:Red;
    }
    
    .result 
    {
        color:Maroon;
        font-size:15px;
    }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Basic ASP.NET and String Handling in C# </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate basic ASP.NET tools and string handling in C# </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/aspnet/" target="_blank">
        http://www.w3schools.com/aspnet/</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/7wtc81z6.aspx" target="_blank">
        http://msdn.microsoft.com/en-us/library/7wtc81z6.aspx</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        This is my first ASP.NET and C# experiment where I have used a textbox for the user to enter some string,
        a label to show the result and a RadioButtonList to choose from the 
        list of actions the user wants to perform on the text entered. </p>
    <p class="content">
        There are basic string handling operations like converting the inputted text to uppercase or lowercase,
        prepending and appending a string to the given text, copying the given text as it is,
        splitting the text at any space or dot in the given text, and
        padding "-" to the given text on its right or left. </p>
    

    <p class="content">
        I was initially thinking of using buttons for each of these functions instead of a radiobutton list.
        But, in this case I thought using RadioButtonList was useful as the C# code was in one function. 
        Otherwise for buttons, I would have to write code in specific functions. </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/basicasp.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
   <div>
        <h3>Enter some text 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </h3>
         <h3>Result: <span class= "result"><asp:Label ID="Label1" runat="server" Text=" "></asp:Label></span></h3>
         <div class = "rb">
         <!-- RadioButtonList with 2 column layout and width equal to 500 px -->
        <asp:RadioButtonList
             ID="RadioButtonList1"
             runat="server" 
             AutoPostBack="true"
             RepeatColumns="2" 
             Font-Bold="true"
             Width="500px"
             OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>Convert to Uppercase</asp:ListItem>
            <asp:ListItem>Convert to Lowercase</asp:ListItem>
            <asp:ListItem>Prepend</asp:ListItem>
            <asp:ListItem>Append</asp:ListItem>
            <asp:ListItem>Copy</asp:ListItem>
            <asp:ListItem>Split</asp:ListItem>
            <asp:ListItem>Pad Left</asp:ListItem>
            <asp:ListItem>Pad Right</asp:ListItem>
        </asp:RadioButtonList>
       </div>
    </div>
    
    
    </form>
</body>
</html>
