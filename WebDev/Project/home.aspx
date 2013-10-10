<%@ Page Title="Tushar Hotels Home" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Home</title>
    <link rel="Stylesheet" href="css/home.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">
        /*This entire thing is for the image slider and I have taken this from the experiment I had performed. */
        $(document).ready(function () {
            //add class active for the first image of slideshow
            $("#slideshow img:first").addClass("active");
            //call the slideshow for every 5 seconds
            setInterval("slideshow()", 5000);
        });

        function slideshow() {
            // set the active and next variable. For the next image, check the number of images. Set the next image in the queue. But
            // if the image is the last one, start from the 1st image again. 
            var $active = $("#slideshow .active");
            var $next = ($("#slideshow .active").next().length > 0) ? $("#slideshow .active").next() : $("#slideshow img:first");

            // Here I slide the image and this toggling keeps on occuring as per the time constraints that I have set.
            // I also keep setting the next image to be active and the current active image to become inactive.
            $active.fadeOut(500, function () {
                $active.removeClass("active");
                $next.fadeIn(500).addClass("active");
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="middle">
            <!-- This is the div for the slideshow -->
            <div id="slideshow">
                <!-- Set the first image to be active -->
                <img src="images/hotel.jpg" alt="" class="active" />
                <img src="images/top.jpeg" alt="" />
                <img src="images/mumbai.jpg" alt="" />
                <img src="images/pool.jpeg" alt="" />
                <img src="images/room.jpeg" alt="" />
            </div>
            <br />
            <!-- This is the div for the content about my hotel below the image -->
            <div class="content1">
                <span class="firstLetter">W</span>elcome to Tushar Hotels and Resorts, the leading
                hotels of the world!<br />
                <br />
                Renowned for its cultural significance, world class amenities and elegant style,
                the hotel is located in the heart of Boston, Massachusetts. Nestled within the tranquillity
                of lush landscaped gardens and cascading waterfalls, Tushar Hotels and Resorts is
                a shimmering beacon amongst Boston hotels. The moment you arrive here, you will
                be spellbound by the grand architecture , elegant décor, excellent services including
                enormous Suites and 5 Restaurants and Lounges inside the hotel.<br />
                <br />
                Tushar Hotels and Resorts claims to be in one of the best locations with nearby
                areas including Logan International Airport five miles away, Americas oldest public
                park Boston Common and close to Fenway Park, the Theatre & Financial Districts,
                and many inspirational Boston Landmarks and Monuments.<br />
                <br />
                You can reserve your room according to your budget. We offer wide ranges of rooms
                from deluxe to executive rooms to presidential suites. We also provide extraordinary
                services which include swimming pool, fitness centre, in-hotel shops, airport pickup
                services in chauffeur driven limousines and the best spa facilities in Boston. We
                also provide world-class dining facilities with great restaurants with great food!
                <br />
                <br />
                So why wait?? Come Ready to savor the experience!
                <br />
            </div>
        </div>
        <div class="right">
            <div class="info">
                INFORMATION</div>
            <br />
            <div>
                <b>Check In/Out</b></div>
            <div>
                Check-In Time<br />
                02:00 PM</div>
            <div>
                Check-Out Time<br />
                12:00 PM</div>
            <div>
                Late Check-Out Available</div>
            <br />
            <div>
                <b>Location</b></div>
            <div>
                Hotel is located Huntington Ave</div>
            <div>
                City: Boston</div>
            <br />
            <div>
                <b>Pet Policy</b></div>
            <div>
                No pets allowed inside the hotel</div>
            <br />
            <div>
                <b>Parking</b></div>
            <div>
                Valet parking available</div>
            <br />
            <div>
                <b>Other locations</b></div>
            <div>
                <ul class="city">
                    <li>Mumbai</li>
                    <li>Shanghai</li>
                    <li>London</li>
                    <li>New York</li>
                    <li>Malaysia</li>
                </ul>
                Coming soon:<br />
                Las Vegas
            </div>
        </div>
    </div>
</asp:Content>
