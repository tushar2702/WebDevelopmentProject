<%@ Page Title="Tushar Hotels Job Search" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<%@ Import Namespace="edu.neu.ccis.tushar27.tushar27" %>


<script runat="server">
    
    tushar27DataContext jobsContext = new tushar27DataContext();
    protected void Button1_Click(object sender, EventArgs e)
    {
        // This gridview is basically retrieving values from the Jobs table depending on the selection
        GridView1.DataSource = from job in jobsContext.Jobs
                               where job.Location == DropDownList2.SelectedValue && job.Title == DropDownList1.SelectedValue
                               select new { job.Title, job.JobLevel, job.Description, job.Location };
        GridView1.DataBind();
        // if there are no values retrieved change the label text.
        if (GridView1.Rows.Count == 0)
        {
            Label1.Text = "Sorry, there are no jobs that match your criteria. Please make another selection!";
            Label1.Visible = true;
            Button2.Visible = false;
        }
            
            // else let him proceed with online application. hence apply online button becomes visible
        else
        {
            Button2.Visible = true;
            Label1.Visible = false;
        }

    }

    // Click on Apply Online Button and redirect to Application page
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("applyJob.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/careers.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<br />
<div class="careerDesc">
Hello! Welcome to Tushar Hotels and Resorts Career Page! We also have much for the ones who want to work here
and help us serve our guests in a better way.<br /><br /><br />
</div>
<!-- For populating the dropdown  list -->
    <asp:SqlDataSource ID="SqlDataSource1" 
                       runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
                       SelectCommand="SELECT Distinct Title FROM tushar27.[Jobs]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
                       SelectCommand="SELECT Distinct Location FROM tushar27.[Jobs]">
    </asp:SqlDataSource>
    <table cellpadding="10" cellspacing="7" class="careerTable">
    <tr><td align="center" colspan="2" class="bold">Careers</td></tr>
    <tr>
    <td align="right">Select a Job Title</td>
    <td><asp:DropDownList ID="DropDownList1" runat="server"
                          DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Title" CssClass="ddl">
        </asp:DropDownList></td>
    </tr>
    <tr>
    <td align="right">Select a Location</td>
    <td><asp:DropDownList ID="DropDownList2" runat="server"
                          DataSourceID="SqlDataSource2" DataTextField="Location" DataValueField="Location" CssClass="ddl">
        </asp:DropDownList></td>
    </tr>
    <tr>
    <td><asp:Button ID="Button1" runat="server" Text="Search for jobs" OnClick="Button1_Click" CssClass="button"/></td>
    </tr>
    </table>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="8" AutoGenerateColumns="false"
    ForeColor="#333333" GridLines="None"  CssClass="grid">
    <Columns>
    <asp:BoundField DataField="Title" HeaderText="Job Title" SortExpression="Title" />
    <asp:BoundField DataField="JobLevel" HeaderText="Job Level" SortExpression="JobLevel" />
    <asp:BoundField DataField="Description" HeaderText="Job Description" SortExpression="Description" />
    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
    </Columns>
    <HeaderStyle BackColor="#088f9f" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="#242424" />
    <RowStyle BackColor="#150e0b" ForeColor="#f0e8e8" />
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" CssClass="lbl"></asp:Label>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Apply Online" Visible="false" CssClass="button"
        onclick="Button2_Click"></asp:Button>
</asp:Content>

