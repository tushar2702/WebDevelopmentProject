<%@ Page Title="Tushar Hotels Contact Us" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link rel="Stylesheet" href="css/contact.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB0iIcHFRrojSik75TB5mmFKD6RsBhNruM&sensor=false">
    </script>
    <script type="text/javascript">

        function initialize() {
            // set the map options
            var myOptions = {
                center: new google.maps.LatLng(42.338891, -71.092349),
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            // create a map and set its latitude and longitude. I have set it to Northeastern University
            // Also create a marker to point to the desired location
            var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
            var myLatLng = new google.maps.LatLng(42.338891, -71.092349);
            var site1Marker = new google.maps.Marker({
                position: myLatLng,
                map: map
            });
            site1Marker.setTitle("Northeastern University");
            var site1infowindow = new google.maps.InfoWindow({
                content: '<img src="images/hotel.jpg" width= 180 height=80 /><p> Tushar Hotels and Resorts </p>'
            });
            google.maps.event.addListener(site1Marker, 'click', function () {
                site1infowindow.open(site1Marker.get('map'), site1Marker);
            });
        }
        
        </script>

      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="align">CONTACT INFORMATION</div><br />
<br />
<br />
<div class="info">
<b>Tushar Hotels and Resorts</b><br />
440 Huntington Avenue<br />
Boston, MA 02115<br />
Phone# : +1 (123) 456 7890 <br />
Email : xyz1abc23@gmail.com<br /><br />
<input type="button" onclick="initialize()" value="Click to reach us on Google Maps" class="btn" /><br /><br /><br />
</div>
<div class="feed"> You can also send us a feedback about our hotel...<br /><br /> <a href="feedback.aspx" target="_blank">Send feedback</a>
<br /><br />You can also get directions by google maps...<br /><br /><a href="directions.aspx" target="_blank">Get Directions</a></div>
<div id="map_canvas"></div>
</asp:Content>

