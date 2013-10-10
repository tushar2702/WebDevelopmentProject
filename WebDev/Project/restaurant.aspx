<%@ Page Title="Tushar Hotels Top Specials" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="Stylesheet" href="css/restaurant.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="align">
        TOP SPECIALS</div>
    <br />
    <div class="italic">
        We're better… We're fresher… We're tastier!</div>
    <br />
    <div class="SpecialDescription">
        Tushar Hotels and Resorts offer you with 5 five star restaurants and the best and
        varied meals to choose from! With that, we suggest you the TOP THREE meals that
        you would definitely want to try at our highly delectable restaurants!
        <br />
        <br />
        Hope you like the food and services that we offer! Enjoy your meal.
    </div>
    <br />
    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" AutoPostBack="True"
        DataSourceID="SqlDataSource1" DataTextField="r_name" DataValueField="r_name"
        CssClass="ddl">
        <asp:ListItem Text="--Select a Restaurant--" Value="" />
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <!--This SQL Query returns the distinct restaurant name from the Restaurant table and binds it to the drop down list. -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="SELECT DISTINCT r_name FROM tushar27.[Restaurant]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="6"
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowSorting="True"
        CssClass="grid">
        <Columns>
            <asp:BoundField DataField="item_name" HeaderText="Specials" SortExpression="item_name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
        </Columns>
        <HeaderStyle BackColor="#088f9f" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#242424" />
        <RowStyle BackColor="#150e0b" ForeColor="#f0e8e8" />
    </asp:GridView>
    <!-- This Sql Query displays the data corresponding to a particular restaurant chosen -->
    <!-- Hence I have used Control parameter for the dropdownlist control data -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="SELECT [item_name], [description], [price] FROM tushar27.[Restaurant] WHERE ([r_name] = @rname)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="rname" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
