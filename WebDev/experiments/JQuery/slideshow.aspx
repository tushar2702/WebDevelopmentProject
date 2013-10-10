<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Image slideshow using JQuery </title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    <script type="text/javascript">

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
            $active.slideToggle(2000, function () {
                $active.removeClass("active");
                $next.slideToggle(1000).addClass("active");

            });
        }

</script>

    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
   /* set the width and height of the div which has id slideshow. */
    #slideshow {
      position:relative;
      margin: 0 auto;
      width: 760px;
      height:350px;
    }
    
    /* set the position and dimensions of the image */
    #slideshow img {
      position:absolute;
      top:25px;
      left:25px;
      display: none;
      width:600px;
      height:350px;
    }
    
    /* set the display to be block for the image which is active */
    #slideshow img.active {
      display:block;
      border: 1px solid;
    }

    </style>

    </head>
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Image slideshow using JQuery </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To create a slideshow of images using JQuery and CSS. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://api.jquery.com/category/effects/" target="_blank">
        http://api.jquery.com/category/effects/</a>&nbsp;

    </p>

    <p class="content">
        <a href="http://jonraasch.com/blog/a-simple-jquery-slideshow" target="_blank">
        http://jonraasch.com/blog/a-simple-jquery-slideshow</a>&nbsp;

    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        The idea behind performing this experiment was to demonstrate a JQuery slideshow in my project.
        I was just thinking about the look of my project website. And I thought of implementing this first
        and then use it in my project.</p>
    <p class="content">
        First, I set the first image to be active. This was done in the HTML code.
        Then I set all the CSS for the slideshow div and the images within that div.</p>
    

    <p class="content">
        Finally I wrote the JQuery behind it where I call the slideshow function every 5 seconds. This renders
        the next image every 5 seconds. Now the only work left was to set the next image every 5 secs.
        So, for that I used to the active and the next variables. 
        For the next image, I checked the number of images. Set the next image in the queue. But
        if the image is the last one, start from the 1st image again. </p>
        
    <p class="content">
        Finally I gave the slideToggle() effect of JQuery for image transitions. I tried various effects but I loved this one.
        </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/JQuery/slideshow.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENTS:</p>
   <div id="slideshow">
   <!-- Set the first image to be active -->
    <img src="../../../images/experiment/boston1.jpg" alt="" class="active" />
    <img src="../../../images/experiment/boston2.jpg" alt="" />
    <img src="../../../images/experiment/boston3.jpg" alt="" />
    <img src="../../../images/experiment/boston4.jpg" alt="" />
    <img src="../../../images/experiment/boston5.jpg" alt="" />
    </div>
    <br />
    <br />
    
    </form>
</body>
</html>
