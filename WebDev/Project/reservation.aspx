<%@ Page Title="Check Room Availability" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">    
    /* This is the logic to redirect to the login page if the user has logged out from any page
     he was previously logged in. Now he logs out of all pages! */
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser myObject = Membership.GetUser();
        if (myObject != null)
        {
            
        }
        else
        {
            
            Response.Redirect("~/Project/login.aspx");
        }

        Session["flagvar"] = "false";
    }

    /* On the click of check availability function, first I check if any of the two date fields is blank or null
     if it is null, error message prints that either of the dates are missing, else it will preserve all the field
     values in session variables to be displayed on the next page. And I also retrieve the data in a hidden gridview
     so that I can take this value from the gridview and get useful information such as room number */
    protected void Button1_Click(object sender, EventArgs e)
    {
        // different ways of checking null or blank 
        if ((Request.Form["indate"] != "" && Request.Form["indate"] != "null" && Request.Form["indate"] != null && Request.Form["indate"].ToString().Length == 10) 
            && (Request.Form["outdate"] != "" && Request.Form["outdate"] != "null" && Request.Form["outdate"] != null && Request.Form["outdate"].ToString().Length == 10))
        {
                MissingDateLbl.Visible = false;
                Session["checkin"] = Request.Form["indate"].ToString();
                Session["checkout"] = Request.Form["outdate"].ToString();
                Session["type"] = DropDownList1.SelectedValue;
                Session["guests"] = DropDownList2.SelectedValue;
                Session["usr"] = Profile.UserName.ToString();
                GridView1.DataSourceID = "RoomsData";
                GridView1.DataBind();
        }
        else
        {

            MissingDateLbl.Text = "Checkin/Checkout date missing!";
            MissingDateLbl.Visible = true;
            NoRoomsLbl.Text = "";
            ProceedBtn.Visible = false;

        }

    }

    // This will count the number of rows by the query of getting the count of rooms available
    // Hence I can display the number of rooms available
    protected void RoomsData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

        int totalRows = e.AffectedRows;
        if (totalRows == 0)
            NoRoomsLbl.Text = "Sorry, no rooms are available for this period. Please try again!";
        else
        {
            NoRoomsLbl.Text = totalRows + " room(s) of this type is/are available. Click on the button to proceed with booking";
            ProceedBtn.Visible = true;

        }
    }
    // I take the value from the Gridview's first cell and save that room number for the person
    // to book the room if at all he books it.
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == 0)
            {
                String s = (e.Row.Cells[0].Text).ToString();
                Session["room_no"] = s;
            }
        }
    }

    // Redirect to book the room if the user hits proceed button 
    protected void ProceedBtn_Click(object sender, EventArgs e)
    {
        Session["flagvar"] = "false";
        //SqlDataSource1.InsertCommand = "Insert into Booked_Room values("+Session["room_no"]+", "+Session["checkin"]+", "+Session["checkout"]+")";
        //SqlDataSource1.Insert();
        Response.Redirect("book.aspx");


    }

    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        if (!Master.Page.ClientScript.IsStartupScriptRegistered("alert"))
        {
            // since it is not registered, register the script
            Master.Page.ClientScript.RegisterStartupScript
                (this.GetType(), "alert", "removeSession();", true);
        }
        

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css"
        type="text/css" />
    <link rel="Stylesheet" href="css/loginstatus.css" />
    <link rel="Stylesheet" href="css/reservation.css" />
    <script language="javascript" type="text/javascript">

        // Function for check out date greater than checkin date
        // Also to set Checkin and Checkout dates in HTML5 Session storage
        function fChangeDatepicker() {
            var oDatepickerFrom = document.querySelector('#inDate');
            var oDatepickerTo = document.querySelector('#outDate');
            if (oDatepickerFrom) {
                var selectedDate = new Date(oDatepickerFrom.value);
                $("#outDate").datepicker("option", "minDate", selectedDate);
                sessionStorage.setItem("checkin", oDatepickerFrom.value);
                sessionStorage.setItem("checkout", oDatepickerTo.value);

            }
        }

        // Initial datepicker for checkin date
        $(document).ready(function () {
            $('#inDate').datepicker({
                changeMonth: true,
                minDate: +0,
                changeYear: true
            });
        });

        // Initial datepicker for checkout date 
        $(document).ready(function () {
            $('#outDate').datepicker({
                changeMonth: true,
                minDate: +0,
                changeYear: true

            });
        });

        // Gets the value from the HTML5 Session storage of the dates and sets in the text boxes.
        function getValue() {
            var oDatepickerFrom = document.querySelector('#inDate');
            var oDatepickerTo = document.querySelector('#outDate');
            if (sessionStorage.getItem("checkin") !== null || sessionStorage.getItem("checkin") !== "") {
                oDatepickerFrom.value = sessionStorage.getItem("checkin");
            }

            if (sessionStorage.getItem("checkout") !== null || sessionStorage.getItem("checkout") !== "") {
                oDatepickerTo.value = sessionStorage.getItem("checkout");
            }

        }

        $(document).ready(function () { getValue() });

        function removeSession() {
            sessionStorage.setItem("checkin", null);
            sessionStorage.setItem("checkout", null);

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="loginStatus" OnLoggingOut="LoginStatus1_LoggingOut" />
    <div class="available-form">
        <table cellpadding="10" cellspacing="7">
            <tr>
                <th colspan="2">
                    CHECK AVAILABILITY
                </th>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="* Check-in Date" CssClass="subtitle"></asp:Label>
                </td>
                <td>
                    <input name="indate" type="text" value="" id="inDate" onchange="fChangeDatepicker()"
                        class="round" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="* Check-out Date" CssClass="subtitle"></asp:Label>
                </td>
                <td>
                    <input name="outdate" type="text" value="" id="outDate" onchange="fChangeDatepicker()"
                        class="round" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Room Type" CssClass="subtitle"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="165px" CssClass="ddl">
                        <asp:ListItem>Deluxe</asp:ListItem>
                        <asp:ListItem>Executive</asp:ListItem>
                        <asp:ListItem>Presidential</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Number of Guests" CssClass="subtitle"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="165px" CssClass="ddl">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Check availablity" OnClick="Button1_Click"
                        CssClass="button" />
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="MissingDateLbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <div class="display_rooms">
            <asp:Label ID="NoRoomsLbl" runat="server" Text="" CssClass="disp_rooms"></asp:Label></div>
    </div>
    <br />
    <asp:Button ID="ProceedBtn" runat="server" Text="Proceed to book room" Visible="false"
        CssClass="proceed" OnClick="ProceedBtn_Click" />
    <!-- Hidden Gridview that contains all the available room numbers -->
    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
        CssClass="hide">
    </asp:GridView>
    <!-- SQL Query to check availability of rooms -->
    <asp:SqlDataSource ID="RoomsData" runat="server" ConnectionString="<%$ ConnectionStrings:net4SqlServer %>"
        SelectCommand="(SELECT room_no FROM tushar27.[Room] WHERE (type=@roomtype) 
        except (SELECT room_no from tushar27.[Booked_Room]))
        union
        (select b.room_no from tushar27.[Room] r inner join tushar27.[Booked_Room] b
        on r.room_no = b.room_no
        where (type=@roomtype) and not exists (
        select c.room_no from tushar27.[Booked_Room] c
        where (c.checkin between @startdate AND @enddate)
        or (c.checkout between @startdate AND @enddate)))" OnSelected="RoomsData_Selected">
        <SelectParameters>
            <asp:ControlParameter Name="roomtype" Type="String" ControlID="DropDownList1" PropertyName="SelectedValue">
            </asp:ControlParameter>
            <asp:FormParameter Name="startdate" FormField="indate" />
            <asp:FormParameter Name="enddate" FormField="outdate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
