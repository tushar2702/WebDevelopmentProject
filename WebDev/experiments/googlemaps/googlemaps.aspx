<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> Embedding Google Map using Google MAP API </title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
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
            // you can also set title and image to the marker
            site1Marker.setTitle("Northeastern University");
            var site1infowindow = new google.maps.InfoWindow({
                content: '<img src="../../../images/experiment/northeasternuniversity.jpg" width= 180 height=80 /><p> Northeastern University </p>'
            });
            google.maps.event.addListener(site1Marker, 'click', function () {
                site1infowindow.open(site1Marker.get('map'), site1Marker);
            });
        }
        
    </script>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    #map_canvas
    {
        width: 600px; 
        height: 400px; 
        border:5px solid black;
     }
    
    </style>
    </head>
    
    <body onload="initialize()">
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Embedding Google Map using Google map API </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To use Google Map API to embed the google map into the web page.</p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://net4.ccs.neu.edu/home/harshg1/Experiments/GoogleAPI/GoogleMap.aspx" target="_blank">
        http://net4.ccs.neu.edu/home/harshg1/Experiments/GoogleAPI/GoogleMap.aspx</a>&nbsp;
    </p>

    <p class="content">
        <a href="https://developers.google.com/maps/documentation/javascript/tutorial" target="_blank">
        https://developers.google.com/maps/documentation/javascript/tutorial</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        This experiment is performed to learn how to use Google Map API to embed google maps into web pages.
        In this experiment I first got an API key as explained in the Google maps documentation/tutorial. Once that
        was done, I added the javascript file with the key that I received.
        </p>
    

    <p class="content">
        For embedding the map, I have a div with id "map_canvas". I have given it a width and height and border too.
        Now, in the body tag I have onLoad function which is called when the body is loaded. In that function,
        I set the options for the map. i.e. its center(latitude and longitude I want to display at the center of the map),
        its zoom level and mapTypeId. Once that is done, I created map variable and assigned all the options to it.
        The location(latitude and longitude) that I have set is 440 Huntington Avenue(Northeastern University) 02115.
        Also, I created a marker to point to this desired location. I also added content (text and image) to it.
        </p>
        
    <p class="content">
        I geocoded the address using geocoder.us and the image of Northeastern University was obtained from Google Images.
        </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/googlemaps/googlemaps.aspx" target="_blank"> Click Here </a>
    
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
    <!-- This is the div which holds the map -->
    <div id="map_canvas"></div>
    <br />
    </form>
</body>
</html>
