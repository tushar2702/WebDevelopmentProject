<%@ Page Title="Tushar Hotels Dining" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    
// this method is basically changing the source of the image dynamically
protected void ticker(object sender, EventArgs e)
{   
    Image1.Src = getRandomImageSource();
}

// This uses Random to generate random numbers between 0 and 4 which is then used in the switch case
// to decide which image is to be rendered. here, i return the image path.
protected string getRandomImageSource()
{

    Random rand = new Random();
    int random = rand.Next(0, 9);

    switch (random)
    {
        case 0: return "images/dining/dine1.jpg";
        case 1: return "images/dining/dine2.jpg";
        case 2: return "images/dining/dine3.jpg";
        case 3: return "images/dining/dine4.jpg";
        case 4: return "images/dining/dine5.jpeg";
        case 5: return "images/dining/dine6.jpeg";
        case 6: return "images/dining/dine7.jpeg";
        case 7: return "images/dining/dine8.jpeg";
        case 8: return "images/dining/dine9.jpeg";
        default: return "images/dining/dine10.jpeg";   
    }

}
// This is used to read the xml file and bind it to the repeater control.
protected void Button1_Click(object sender, EventArgs e)
{
    var mydining = new DataSet();
    mydining.ReadXml(MapPath("dining.xml"));
    dine.DataSource = mydining;
    dine.DataBind();
    
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" href="css/dining.css" />
<style type="text/css">

/* CSS for header template of repeater */
.HeaderTemp
{
    background-color: #434343;
    color: #60b7b7;
    font-weight: bold;
    width: 220px;
}

/* CSS for alternating template of repeater */
.AlternatingTemp
{
    background-color: #e8e8e8;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    
    <asp:ScriptManager runat="server" ID="ScriptManager">
    </asp:ScriptManager>

    <!-- The timer takes care of the tick event that will be triggered every 4000 ms. -->
    <asp:Timer runat="server" Interval="4000" ID="AjaxTimer" OnTick="ticker" />
    <br />
    <!-- Only the update panel is updated. This is called partial page updates -->
    <!--  The trigger is used so that the update panel will do the task asynchronously -->
    <asp:UpdatePanel runat="server" ID="SlideShow" UpdateMode="Always">
    <ContentTemplate>
        <!-- This is the First image that is displayed -->
        <img runat="server" id="Image1" alt="" src="images/dining/dine10.jpeg" class="size" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="AjaxTimer" EventName="Tick" />
    </Triggers>    
    </asp:UpdatePanel>
 </div>

 <div class="contentDine">
 <span class="firstLetter">W</span>elcome to the dining services at Tushar Hotels and Resorts. We offer you an exciting spectrum of  culinary experiences.
 We make you experience imaginative menus and the area’s most sought-after dining experience in sophisticated yet casual surroundings.
 We cater to your need for wellness cuisine by simply opting for healthier cooking styles. 
 Yet, every ounce of yum flavour is left perfectly intact. 
 For, really, what would be the point otherwise?
<br /> <br />
Ready for a taste of something fresher? Come, dig in. <asp:Button ID="Button1" runat="server" Text="Different types of cuisines that we offer!" OnClick="Button1_Click" class="btn" />
</div>
<br />

<!-- The repeater has a header template which shows how the header will look including the various titles of the table,
    Also it has all the items that are bound from the xml file in the item template. I have given different colors
    to alternative rows by using alternating item template. -->
<asp:Repeater id="dine" runat="server">

<HeaderTemplate>
<table border="0" class="dine" cellpadding="6" cellspacing="0">
<tr class="HeaderTemp">
<th>Cuisine Type</th>
<th>Restaurant Name</th>
<th>Description</th>
<th>Rating</th>
</tr>
</HeaderTemplate>

<ItemTemplate>
<tr>
<td><%# DataBinder.Eval(Container.DataItem, "Cuisine") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "RestaurantName") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "Rating") %></td>
</tr>
</ItemTemplate>

<AlternatingItemTemplate>
<tr class="AlternatingTemp">
<td><%# DataBinder.Eval(Container.DataItem, "Cuisine") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "RestaurantName") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "Rating") %></td>
</tr>
</AlternatingItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>

</asp:Repeater>
<br />

<a href="restaurant.aspx" target="_blank" class="next">CHECK THE TOP SPECIALS</a>

</asp:Content>
