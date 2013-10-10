<%@ Page Title="Tushar Hotels Accomodations" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

    /* This changes the view from view 1 to 2 to 3 etc. */
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int n;
        int.TryParse(DropDownList1.SelectedValue, out n); // taking the selected value of the drop down and storing it in n
        MultiView1.ActiveViewIndex = n; // setting the active view index
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Accomodations</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="Stylesheet" href="css/accomodations.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- The ScriptManager control takes care of the client-side script for all the server side controls.-->
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <!-- With this, only the panel gets updated not the entire page...  -->
    <!-- It is the content template that defines what appears in the update panel when it is rendered. -->
    <!-- The fieldset specifies the boundary of the update panel -->
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="ddlTitle">
                <div class="ddlTitle1">
                    Select Room Type to view details:</div>
                <br />
                <!-- Drop down list to display the various room types and depending on the one selected you can see 
                 the respective room type description. I have used multiviews for this. -->
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    AutoPostBack="true" Width="250" CssClass="ddl">
                    <asp:ListItem Value="0">Deluxe Room</asp:ListItem>
                    <asp:ListItem Value="1">Executive Suite</asp:ListItem>
                    <asp:ListItem Value="2">Presidential Suite</asp:ListItem>
                </asp:DropDownList>
            </div>
            <!-- Multiview tag where the active view index is 0 that means the 1st one is selected. -->
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <!--This view is for the deluxe room type -->
                    <div class="RoomTitle">
                        DELUXE ROOM ($400 per day)</div>
                    <img src="images/deluxe.jpg" alt="" class="type" />
                    <div class="details">
                        Often called oversized, they have an elegant workspace and state of the art entertainment
                        area which includes a television and music system with surround sound. Bright and
                        spacious, the Deluxe rooms offer exceptional views and impeccable service at an
                        affordable cost! These rooms are furnished with either one king or two double beds
                        with 400-thread-count linens. Overlooking the action packed atrium, each of these
                        spacious rooms includes an oversized shower, a 27'' cable TV, in-room high speed
                        internet access, iron and board.
                        <br />
                        <br />
                        <!-- The amenities will be viewed as a list in two columns -->
                        <div class="double_column_list">
                            Amenities:
                            <ul>
                                <li>24-hour room service</li>
                                <li>Dual line phones</li>
                                <li>Individual air conditioning control</li>
                                <li>Maximum guests per room: 3</li>
                                <li>Alarm clock</li>
                                <li>Marble bath</li>
                                <li>Cable/satellite TV channels</li>
                                <li>Speakerphone</li>
                                <li>Wi-fi enabled high-speed Internet</li>
                                <li>24-hour concierge</li>
                                <li>Morning newspaper</li>
                                <li>Robes</li>
                                <li>Bottled water</li>
                            </ul>
                        </div>
                    </div>
                </asp:View>
                <!--End tag for deluxe room type view -->
                <asp:View ID="View2" runat="server">
                    <!-- This view is for executive suite room type -->
                    <div class="RoomTitle">
                        EXECUTIVE SUITE ($600 per day)</div>
                    <img src="images/executive.jpg" alt="" class="type" />
                    <div class="details">
                        The Executive Suites ensure comfort and exude an ambience of exquisitely detailed
                        modern design features Malaysian teak floors, oversized mirrors and floor-to-ceiling
                        windows in a spacious 73 sq. mt. It provides a living and a dining area, a spacious
                        bathroom with jacuzzi, separate washrooms for your guests and a pantry with basic
                        conveniences.The Pyramid Suite offers separate living and bedroom areas, along with
                        oversized bathrooms and premium amenities. Available with one king or two queen
                        sized beds, these rooms are a great way to experience the best of our hotel!
                        <br />
                        <br />
                        <div class="double_column_list">
                            Amenities:
                            <ul>
                                <li>High-end Video Equipment</li>
                                <li>Valet Service</li>
                                <li>24-hour room service</li>
                                <li>Dual line phones</li>
                                <li>Individual air conditioning control</li>
                                <li>Maximum guests per room: 4</li>
                                <li>Alarm clock</li>
                                <li>Marble bath</li>
                                <li>Cable/satellite TV channels</li>
                                <li>Speakerphone</li>
                                <li>Wi-fi enabled high-speed Internet</li>
                                <li>24-hour concierge</li>
                                <li>Morning newspaper</li>
                                <li>Robes</li>
                                <li>Mini Bar</li>
                                <li>Mini Refrigerator</li>
                                <li>Work Desk w/ Lamp</li>
                                <li>Jacuzzi</li>
                            </ul>
                        </div>
                    </div>
                </asp:View>
                <!-- End tag for executive suite room type view -->
                <asp:View ID="View3" runat="server">
                    <!-- This view is for presidential suite room type -->
                    <div class="RoomTitle">
                        PRESIDENTIAL SUITE ($800 per day)</div>
                    <img src="images/presidential.jpg" alt="" class="type" />
                    <div class="details">
                        The Presidential Suite is a perfect urban retreat. This beautifully appointed 100
                        sq. mt. room includes a luxurious living area and an inviting bedroom with an aesthetic
                        Indian theme! This luxurious suite features desk with high-speed Internet access,
                        marble bath with sunken tub and step-down rain shower and bedroom with plush king
                        bed. Enjoy modern design with Malaysian teak floors, plus exclusive royal amenities
                        such as boardroom usage, complimentary bar setup of premium brands, airport transfers
                        and private lounge with Continental breakfast, tea and evening cocktail hour. The
                        bathroom include separate spa tubs, dual sinks and lighted mirrors. Discover luxury
                        at our hotel and treat yourself to this amazing suite.
                        <br />
                        <br />
                        <div class="double_column_list">
                            Amenities:
                            <ul>
                                <li>Balcony</li>
                                <li>52 inch Plasma TV</li>
                                <li>Printer/copier</li>
                                <li>In-room wine cabinet</li>
                                <li>In-room fax machine</li>
                                <li>Private concierge</li>
                                <li>Cordless phone with Voice Mail</li>
                                <li>Maximum guests per room: 5</li>
                                <li>Alarm clock</li>
                                <li>Marble bath</li>
                                <li>Wi-fi enabled high-speed Internet</li>
                                <li>Robes</li>
                                <li>Mini Refrigerator</li>
                                <li>Separate Work Area</li>
                                <li>Jacuzzi</li>
                            </ul>
                        </div>
                    </div>
                </asp:View>
                <!-- End tag for presidential suite room type -->
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
