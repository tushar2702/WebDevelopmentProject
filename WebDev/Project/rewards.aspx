<%@ Page Title="Member Rewards" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

    // On page load, SQLDataSource1 gives the table having all the Rewards to the GridView1
    // and SQLDataSource2 gives the count of the points the user currently has to GridView2
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            Session["usr"] = Profile.UserName.ToString();
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
            GridView2.DataSourceID = "SqlDataSource2";
            GridView2.DataBind();
        }
        else
        {
            Response.Redirect("~/Project/login.aspx");
        }

    }

    // If GridView1 receives any data from its SqlDataSource, then the label "You are not eligible for points" is set to false
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label1.Visible = false;
    }

    // GridView2 contains the max points that the user currently has. It is present in the first cell
    // So I retrieve that value from the gridview and print it on a label "Label2".
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == 0)
            {
                String s = (e.Row.Cells[0].Text).ToString();
                Label2.Text = "You currently have " + s + " point(s)";
            }
        }
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="Stylesheet" href="css/loginstatus.css" />
    <link rel="Stylesheet" href="css/rewards.css" />
    <link rel="Stylesheet" href="css/loggedin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="loginStatus" LogoutPageUrl="~/Project/login.aspx" />
    <br />
    <div class="title">
        What's new? When you stay with us, you get reward points. With one booking you get
        1 point and if you gained any, you can use coupon codes that are listed below!!</div>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="" class="lbl"></asp:Label>
    <!-- This SQL query returns the coupon code, its description and minimum number of points required
     for redemption and check in the where clause if it is the user who is currently logged in and if
     the users points is greater than or equal to the minimum number of points for that coupon -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="select distinct c.code,c.description,c.minPts from tushar27.[Coupon] c, tushar27.[Points] p where (p.username = @user) and p.points >= c.minPts;">
        <SelectParameters>
            <asp:SessionParameter Name="user" SessionField="usr" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
        RowStyle-BackColor="#FAF0E6" RowStyle-ForeColor="#434343" HeaderStyle-BackColor="#434343"
        HeaderStyle-ForeColor="#60b7b7" CellPadding="7" AutoGenerateColumns="false" CssClass="grid">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="Coupon Code" SortExpression="code" InsertVisible="false"
                DataField="code"></asp:BoundField>
            <asp:BoundField ReadOnly="true" HeaderText="Description" SortExpression="description"
                InsertVisible="false" DataField="description"></asp:BoundField>
            <asp:BoundField ReadOnly="true" HeaderText="Minimum Points Required" InsertVisible="false"
                DataField="minPts"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Sorry, you currently are not eligible for any rewards since you do not have the minimum number
    of bookings required!" class="lbl"></asp:Label>
    <br />
    <br />
    <!-- For redeeming Coupons there is a text content -->
    <div class="redeem">
        For redeeming any of the coupons, please contact Tushar Hotels and Resorts before
        you make any booking!</div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="select max(points) from tushar27.[Points] where (username=@user) group by username">
        <SelectParameters>
            <asp:SessionParameter Name="user" SessionField="usr" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" OnRowDataBound="GridView2_RowDataBound"
        Visible="false">
    </asp:GridView>
    <br />
    <div class="links">
        <div>
            Check for Room Availability <a href="reservation.aspx" target="_blank">GO </a>
        </div>
        <br />
        <div>
            Retrieve your past bookings here <a href="retrieve.aspx" target="_blank">GO </a>
        </div>
        <br />
    </div>
</asp:Content>
