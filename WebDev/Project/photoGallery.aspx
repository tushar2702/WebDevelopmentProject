<%@ Page Title="Tushar Hotels Gallery" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var currentPosition = 0;
            var slideWidth = 650;
            var slides = $('.slide');
            var numberOfSlides = slides.length;

            // Remove scrollbar
            $('#slidesContainer').css('overflow', 'hidden');

            // Wrap all .slides with #slideInner div
            slides
    .wrapAll('<div id="slideInner"></div>')
            // Float left to display horizontally, readjust .slides width
	.css({
	    'float': 'left',
	    'width': slideWidth
	});

            // Set #slideInner width equal to total width of all slides
            $('#slideInner').css('width', slideWidth * numberOfSlides);

            // Insert controls in the DOM
            $('#slideshow')
    .prepend('<span class="control" id="leftControl"></span>')
    .append('<span class="control" id="rightControl"></span>');

            // Hide left arrow control on first load
            manageControls(currentPosition);

            // Create event listeners for .controls clicks
            $('.control')
    .bind('click', function () {
        // Determine new position
        currentPosition = ($(this).attr('id') == 'rightControl') ? currentPosition + 1 : currentPosition - 1;

        // Hide or show controls
        manageControls(currentPosition);
        // Move slideInner using margin-left
        $('#slideInner').animate({
            'marginLeft': slideWidth * (-currentPosition)
        });
    });

            // manageControls: Hides and Shows controls depending on currentPosition
            function manageControls(position) {
                // Hide left arrow if position is first slide
                if (position == 0) { $('#leftControl').hide() } else { $('#leftControl').show() }
                // Hide right arrow if position is last slide
                if (position == numberOfSlides - 1) { $('#rightControl').hide() } else { $('#rightControl').show() }
            }
        });
    </script>
    <script type="text/javascript">

        // this is to view the photo gallery by fading the background
        function view() {

            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
        }

        // this is to close the photo gallery and unfade the background back to normal
        function closeGallery() {

            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
        }
    </script>
    <link rel="Stylesheet" href="css/photoGallery.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="align">
        PHOTO GALLERY</div>
    <br />
    <div class="description">
        Tushar Hotels and Resorts is one of the leading hotels of the world! It is not only
        famous for its cultural significance and world-class amenities but also for the
        beauty and elegant style.
        <br />
        <br />
        Nestled within the tranquillity of lush landscaped gardens and cascading waterfalls,
        Tushar Hotels and Resorts is a shimmering beacon amongst Boston hotels. The moment
        you arrive here, you will be spellbound by the grand architecture and elegant décor.
        <br />
        <br />
        <span class="italic">You would love to see the photo gallery of Tushar Hotels and Resorts!</span>
        <br />
        <a href="javascript:void(0)" onclick="view()">View Photo Gallery</a>
    </div>
    <div id="light" class="photoWindow">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td height="10px">
                    <a href="javascript:void(0)" onclick="closeGallery()">
                        <img src="images/closebutton.png" class="closeImageButton" width="13px" align="right"
                            height="13px" />
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="slideshow">
                        <div id="slidesContainer">
                            <div class="slide">
                                <img src="images/deluxe.jpg" /></div>
                            <div class="slide">
                                <img src="images/executive.jpg" /></div>
                            <div class="slide">
                                <img src="images/gym.jpg" /></div>
                            <div class="slide">
                                <img src="images/hotel.jpg" /></div>
                            <div class="slide">
                                <img src="images/mumbai.jpg" /></div>
                            <div class="slide">
                                <img src="images/pool.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine1.jpg" /></div>
                            <div class="slide">
                                <img src="images/presidential.jpg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine2.jpg" /></div>
                            <div class="slide">
                                <img src="images/room.jpeg" /></div>
                            <div class="slide">
                                <img src="images/top.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine3.jpg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine4.jpg" /></div>
                            <div class="slide">
                                <img src="images/spa.jpg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine5.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine6.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine7.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine8.jpeg" /></div>
                            <div class="slide">
                                <img src="images/dining/dine9.jpeg" /></div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="20px">
                </td>
            </tr>
        </table>
    </div>
    <div id="fade" class="black_overlay">
    </div>
</asp:Content>
