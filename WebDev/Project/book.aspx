<%@ Page Title="Confirm Booking" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
    
    // On page load, use the session variables and print the respective values
    // if the user is still logged in otherwise redirect him to login page
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            
            Label1.Text = Session["usr"].ToString();

            if (Profile.FirstName == null || Profile.FirstName == "" || Profile.LastName == null || Profile.LastName == "")
                Label2.Text = "N/A";
            else Label2.Text = Profile.FirstName + " " + Profile.LastName;
            
            Label3.Text = Session["type"].ToString();
            Label4.Text = Session["checkin"].ToString();
            Label5.Text = Session["checkout"].ToString();
            Label6.Text = Session["guests"].ToString();

            if (Label3.Text == "Deluxe") Label7.Text = "$400 per day per guest";
            else if (Label3.Text == "Executive") Label7.Text = "$600 per day per guest";
            else  Label7.Text = "$800 per day per guest";
            
            
            
        }
        else
        {
            Response.Redirect("~/Project/login.aspx");
        }

        
            Label1.Text = Session["flagvar"].ToString();
        
        
    }

    // insert the data in Booked_Room Table
    // Also insert the respective points for the user in the Points table
    // Finally redirect the user to booked.aspx
    protected void bookBtn_Click(object sender, EventArgs e)
    {
        //GridView1.DataSourceID = "SqlDataSource1";
        //GridView1.DataBind();
        SqlDataSource1.Insert();
        PointsSqlDataSource.Insert();
        Response.Redirect("booked.aspx");
    }

    
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/loginstatus.css" />
<link rel="Stylesheet" href="css/book.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- This is the button for logging out -->
<asp:LoginStatus ID="LoginStatus1" runat="server" cssClass="loginStatus" />   
<div class="heading"> CONFIRM YOUR STAY </div>
<div class="staydetails">
<br />
<div class="subheading">These are the details that you desire! Please verify each of them accurately and then click on the button to confirm your booking.</div>
<br />
<table cellpadding="8" cellspacing="10">
<tr>
<td> Username</td> 
<td><asp:Label ID="Label1" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Name</td>    
<td><asp:Label ID="Label2" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Room Type</td>    
<td><asp:Label ID="Label3" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Check-in Date</td>    
<td><asp:Label ID="Label4" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Check-out Date</td>    
<td><asp:Label ID="Label5" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Number of guests</td>    
<td><asp:Label ID="Label6" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
<tr>
<td>Room Tariff</td>    
<td><asp:Label ID="Label7" runat="server" Text="Label" CssClass="lbl"></asp:Label></td>
</tr>
</table>

</div>
<br />
<asp:Button ID="bookButton" runat="server" Text="Confirm Booking" onclick="bookBtn_Click" CssClass="btn" />

<!-- This is the SQL Query for inserting this data into Booked_Room table -->
<!-- Here I have used Session Parameters to get the values from the session variables and then insert them into the database -->
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="SELECT * FROM tushar27.[Booked_Room]"
        InsertCommand="INSERT INTO tushar27.[Booked_Room] values(@room,@checkin,@checkout,@usr)">
        <InsertParameters>
        <asp:SessionParameter Name="room" SessionField="room_no" Type="Int32" />
        <asp:SessionParameter Name="checkin" SessionField="checkin" Type="String" />
        <asp:SessionParameter Name="checkout" SessionField="checkout" Type="String" />
        <asp:SessionParameter Name="usr" SessionField="usr" Type="String" />
        </InsertParameters>
 </asp:SqlDataSource>

 <!-- This is the SQL Query for inserting the points in the Points table for the respective user -->
 <asp:SqlDataSource ID="PointsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="SELECT * FROM tushar27.[Points]" 
        InsertCommand="insert into tushar27.[Points] (username, points)
                        (select username,count(*) 
                         from tushar27.[Booked_Room]
                         where (username = @user)
                         group by username);">
        <InsertParameters>
        <asp:SessionParameter Name="user" SessionField="usr" Type="String" />
        </InsertParameters>
        </asp:SqlDataSource>
    
    <!-- <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>-->
</asp:Content>

