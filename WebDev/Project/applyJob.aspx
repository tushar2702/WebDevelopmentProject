<%@ Page Title="Tushar Hotels Apply Online" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<%@ Import Namespace="edu.neu.ccis.tushar27.tushar27" %>

<script runat="server">

    // This function inserts the data in the table Applicants
    protected void Button1_Click(object sender, EventArgs e)
    {
        tushar27DataContext testContext = new tushar27DataContext();
        // The id will be set to 1 initially and then increment by one
        int id;
        Applicant lastObj = testContext.Applicants.OrderByDescending(n => n.ID).FirstOrDefault();
        if (lastObj != default(Applicant))
        {
            System.Nullable<int> maxid =
                (from t in testContext.Applicants
                 select t.ID).Max();
            id = (int)maxid + 1;
        }
        else
        {
            int firstid = 1;
            id = firstid;
        }

        // Creating an object test1 which holds the details from the text boxes
        Applicant test1 = new Applicant
        {
            Name = Name.Text,
            Email= Email.Text,
            Country=Country.Text,
            City=City.Text,
            State=State.Text,
            Zip=ZipCode.Text,
            Phone=phone.Text,
            WorkEx=Workexp.Text

        };

        // insert test1 and redirect to upload resume page!
        testContext.Applicants.InsertOnSubmit(test1);
        try
        {
            testContext.SubmitChanges();
            Response.Redirect("Resume.aspx");
            
        }
        catch (Exception ex)
        {
            Label1.Text = "Error! Please try inserting again!";
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/careers.css" />
<style type="text/css">

    .careerTable
    {
        margin-left:0px;
    }
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br />
    <!-- The table for all the fields of the form -->
    <table cellpadding="10" cellspacing="5" class="careerTable">
    <tr><td align="center" colspan="2" class="bold">Job Application</td></tr>
    <!-- Name of applicant -->
    <tr>
    <td align="left">Name</td>
    <td><asp:TextBox ID="Name" runat="server" CssClass="round" MaxLength="45"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Name_Required" runat="server" Font-Italic="true"
        ControlToValidate="Name" ErrorMessage="*"> </asp:RequiredFieldValidator><br /><br />
    </td></tr>
    <!-- Email of applicant -->
    <tr><td align="left">Email</td>
    <td>
    <asp:TextBox ID="Email" runat="server" CssClass="round"  MaxLength="80"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Italic="true" 
    ControlToValidate="Email" ErrorMessage="*"></asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator id="RegularExpressionValidator2" 
    runat="server" ControlToValidate="Email" 
    ErrorMessage="Enter valid Email Address" 
    Font-Italic="true"
    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>
    </td></tr>
    <!-- Country -->
    <tr><td align="left">Country</td>
    <td>
    <asp:TextBox ID="Country" runat="server" CssClass="round" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Italic="true"
    ControlToValidate="Country" ErrorMessage="*"> </asp:RequiredFieldValidator><br /><br />
    </td></tr>
    <!-- City -->
    <tr>
    <td align="left">City</td><td>
    <asp:TextBox ID="City" runat="server" CssClass="round"  MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Italic="true"
    ControlToValidate="City" ErrorMessage="*"></asp:RequiredFieldValidator><br /><br />
    </td></tr>
    <!-- State -->
    <tr><td align="left">State</td>
    <td>
    <asp:TextBox ID="State" runat="server" CssClass="round"  MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="State" ErrorMessage="*" Font-Italic="true"> </asp:RequiredFieldValidator><br /><br />
    </td>
    </tr>
    <!-- ZIP Code -->
    <tr><td align="left">Zip Code</td>
    <td>
    <asp:TextBox ID="ZipCode" runat="server" CssClass="round"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Italic="true"
    ControlToValidate="ZipCode" ErrorMessage="*"> </asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator id="RegularExpressionValidator1" 
    runat="server" ControlToValidate="ZipCode" ErrorMessage="Enter valid Zip Code" Font-Italic="true"
    ValidationExpression="^\d{5}(-\d{4})?$"> </asp:RegularExpressionValidator>
    </td></tr>
    <!-- Phone Number -->
    <tr><td align="left">Phone</td>
    <td>
    <asp:TextBox ID="phone" runat="server" CssClass="round"></asp:TextBox><br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
    ControlToValidate="phone" ErrorMessage="Please enter in format (xxx)xxx-xxxx"
    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Font-Italic="true"> </asp:RegularExpressionValidator>
    </td>
    </tr>
    <!-- Work experience or other info -->
    <tr><td align="left">Work Experience</td>
    <td>
    <asp:TextBox ID="Workexp" runat="server" TextMode="MultiLine" Columns="30" Rows="5" CssClass="round"
    onkeypress="return this.value.length<=100" Width="260"></asp:TextBox>
    </td>
    </tr>
    <tr>    
    <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Submit Application" CssClass="button"
    onclick="Button1_Click" /></td>
    </tr>
    <!-- Label to print error -->
    <tr>
    <td colspan="2"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
    </tr>
    </table><br />
                    
                    
</asp:Content>

