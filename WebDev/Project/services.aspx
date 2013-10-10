<%@ Page Title="Tushar Hotels Services" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="Stylesheet" href="css/services.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tagline">
        <!-- Tagline for services that MY HOTEL offer -->
        <blockquote>
            Surround yourself with the ultimate modern conveniences and luxury for business
            and leisure.
        </blockquote>
    </div>
    <br />
    <br />
    <!-- Each of the divs represent a different service -->
    <div class="photo">
        <a href="pool.aspx" target="_blank">
            <img src="images/pool.jpeg" alt="" /></a>
        <br />
        <br />
        The Hotel's outdoor swimming pool surrounded by lush green landscaping offers calm
        respite from the city... <a href="pool.aspx" target="_blank">Read More</a>
    </div>
    <div class="photo">
        <a href="gym.aspx" target="_blank">
            <img src="images/gym.jpg" alt="" /></a>
        <br />
        <br />
        Re-invigorate at the Hotel's spacious health club, with it's state of the art cardiovascular
        equipments, free ... <a href="gym.aspx" target="_blank">Read More</a>
    </div>
    <div class="photo">
        <a href="shopping.aspx" target="_blank">
            <img src="images/shopping.jpg" alt="" /></a>
        <br />
        <br />
        Enhance your shopping experience within the hotel with brands such as Versace, Hugo
        Boss, Tag Heuer... <a href="shopping.aspx" target="_blank">Read More</a>
    </div>
    <div class="photo">
        <a href="transportation.aspx" target="_blank">
            <img src="images/trans.jpg" alt="" /></a>
        <br />
        <br />
        Have a relaxing journey from the airport to the hotel in our hotels' chauffeur driven
        limousines... <a href="transportation.aspx" target="_blank">Read More</a>
    </div>
    <div class="photo">
        <a href="spa1.aspx" target="_blank">
            <img src="images/spa.jpg" alt="" /></a>
        <br />
        <br />
        Relax and revitalize your body at the Hotel Spa and enjoy your experience.. <a href="spa1.aspx"
            target="_blank">Read More</a>
    </div>
</asp:Content>
