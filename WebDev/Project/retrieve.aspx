<%@ Page Title="Past Bookings" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<%@ Import Namespace="edu.neu.ccis.tushar27.tushar27" %>
<script runat="server">
    /* I have used LINQ to retrieve the past bookings of the user.
     In this query, I do a join on both my Room Table as well as 
     my Booked_Room table and a where on the username. I display 
     this information using GridView */
    tushar27DataContext dc = new tushar27DataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            var usrname = Session["usr"].ToString();
            GridView1.DataSource = from b in dc.Booked_Rooms
                                   join r in dc.Rooms
                                   on b.room_no.ToString() equals r.room_no
                                   where b.username == usrname
                                   select new { b.username, b.checkin, b.checkout, r.type };
            GridView1.DataBind();

        }
        else
        {
            Response.Redirect("~/Project/login.aspx");
        }

    }


    // Label1 has the content "Sorry, you have no rooms booked." So I make its 
    // visibility false if the user has one or more bookings.
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label1.Visible = false;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" href="css/loginstatus.css" />
    <link rel="Stylesheet" href="css/retrieve.css" />
    <link rel="Stylesheet" href="css/loggedin.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">

        // this is the jquery function to toggle the behavior of the panel that I have created above.
        // I have used Jquery effect slidetoggle.
        $(document).ready(function () {
            $(".flip").click(function () {
                $(this).toggleClass("active");
                $(".panel").slideToggle("slow");

            });

            $(".flip").toggle(function () {
                $(this).text("Click here to hide your bookings")
            }, function () {
                $(this).text("Click here to display your bookings")
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="loginStatus" />
    <!-- This is the at the top which shows or hides the div inside it -->
    <div class="flip">
        Click Here to display your bookings
    </div>
    <br />
    <!-- This is the panel which contains the retrieved values in GridView -->
    <div class="panel">
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
            RowStyle-BackColor="#FAF0E6" RowStyle-ForeColor="#434343" HeaderStyle-BackColor="#434343"
            HeaderStyle-ForeColor="#60b7b7" CellPadding="7" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="Username" SortExpression="username" InsertVisible="false"
                    DataField="username"></asp:BoundField>
                <asp:BoundField ReadOnly="true" HeaderText="Check-in Date and Time" SortExpression="checkin"
                    InsertVisible="false" DataField="checkin"></asp:BoundField>
                <asp:BoundField ReadOnly="true" HeaderText="Check-out Date and Time" InsertVisible="false"
                    DataField="checkout"></asp:BoundField>
                <asp:BoundField ReadOnly="true" HeaderText="Room Type" InsertVisible="false" DataField="type">
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <!-- Label to display no bookings -->
        <asp:Label ID="Label1" runat="server" Text="Sorry, you have no bookings!" CssClass="lbl"></asp:Label>
    </div>
    <br />
    <div class="links">
        <div>
            Check for Room Availability <a href="reservation.aspx" target="_blank">GO </a>
        </div>
        <br />
        <div>
            Track your rewards gained here&nbsp; <a href="rewards.aspx" target="_blank">GO </a>
        </div>
    </div>
</asp:Content>
