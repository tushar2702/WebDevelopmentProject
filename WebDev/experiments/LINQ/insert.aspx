<%@ Page Language="C#" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<%@ Import Namespace="edu.neu.ccis.tushar27.tushar27" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script runat="server">
    
    // This function inserts the data in the table LINQTest
    protected void Button1_Click(object sender, EventArgs e)
    {
        tushar27DataContext testContext = new tushar27DataContext();
        // The id will be set to 1 initially and then increment by one
        int id;
        LINQTest lastObj = testContext.LINQTests.OrderByDescending(n => n.ID).FirstOrDefault();
        if (lastObj != default(LINQTest))
        {
            System.Nullable<int> maxid =
                (from t in testContext.LINQTests
                 select t.ID).Max();
            id = (int)maxid + 1;
        }
        else
        {
            int firstid = 1;
            id = firstid;
        }

        // Creating an object test1 which holds the name and location from the input textboxes
        LINQTest test1 = new LINQTest 
        { 
            Name=Textbox1.Text,
            Location=Textbox2.Text
        
        };
        
        // insert test1
        testContext.LINQTests.InsertOnSubmit(test1);
        try
        {
            testContext.SubmitChanges();
            Label1.Text = "Successfully inserted";
            // make the textboxes empty once the values are inserted
            Textbox1.Text = "";
            Textbox2.Text = "";
            // display id, name and location
            var output = from testtable in testContext.LINQTests
                     select new {testtable.ID,testtable.Name,testtable.Location};
            GridView1.DataSource = output;
            GridView1.DataBind();
            
        }
        catch (Exception ex)
        {
            Label1.Text = "Error! Please try inserting again!";
        }
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // display the id,name and location even when page loads.
        tushar27DataContext testContext = new tushar27DataContext();
        var output = from testtable in testContext.LINQTests
                     select new { testtable.ID, testtable.Name, testtable.Location };
        GridView1.DataSource = output;
        GridView1.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Basic LINQ</title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">

    .lbl
    {
        color:Blue;
        font-style:italic;
    }
    
    .btn
    {
        padding:5px;
    }

    </style>    
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Inserting data using LINQ </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate the insertion of data using LINQ </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/bb882674.aspx" target="_blank">
        MSDN - Using LINQ with ASP.NET </a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
    In this experiment, I learnt how to insert values into database using LINQ. First, I created a table
    called LINQTest in my database with columns ID, Name and Location. Then I dragged and dropped this table
    in the previously created tushar27.dbml file for my previous LINQ Experiment.
    </p>
    <p class="content">
    Then I made the basic layout with text boxes and labels and a button called "insert data" in which I write the
    entire code. Initially I set the id to 1 if it is the firstid or else increment the id by one. Then,
    I create an object named test1 which holds the name and location from the input textboxes which the user provides.
    Then I insert using InsertOnSubmit() and finally I submit the changes by calling the function SubmitChanges().
    I then, set the label to "Successfully inserted" and also display the data using GridView control.
    </p>
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/LINQ/insert.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENTS:</p>
   
    <div class="content">
    <table cellpadding="5px" cellspacing="5px">
        <tr>
        <td>Name </td>
        <td><asp:textbox ID="Textbox1" runat="server"></asp:textbox> </td>
        <!-- Name is a required field -->
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Please Enter Name" ControlToValidate="TextBox1" Font-Italic="true" ForeColor="red">
        </asp:RequiredFieldValidator></td>
        </tr>
            
        <tr>
        <td>Location </td>
        <td><asp:textbox ID="Textbox2" runat="server"></asp:textbox> </td>
        <!-- Location is a required field -->
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Please Enter Location" ControlToValidate="TextBox2" Font-Italic="true" ForeColor="red">
        </asp:RequiredFieldValidator></td>
        </tr>
        </table>       
        <br />  
        <asp:Button ID="Button1" runat="server" Text="Insert Data" OnClick="Button1_Click" CssClass="btn" />
        <asp:Label ID="Label1" runat="server" Text="" CssClass="lbl"></asp:Label>
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="5" AlternatingRowStyle-BackColor="#60b7b7"
            HeaderStyle-BackColor="gray" ForeColor="#222" HeaderStyle-ForeColor="#222" Width="300px" GridLines="None">
        </asp:GridView>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
