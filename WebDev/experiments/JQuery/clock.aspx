<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> DIGITAL CLOCK USING JQUERY </title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
        /* An array holding all the days and months */
            var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]


            var dateObj = new Date();
            dateObj.setDate(dateObj.getDate()); //get the current date and set it in the dateObj

            / The day, date, month and year is printed */

            $('.Date').html(days[dateObj.getDay()] + " " + dateObj.getDate() + " " + months[(dateObj.getMonth())] + " " + dateObj.getFullYear());


            /* The setInterval is a standard Javascript function. using this you can call the function specified in it periodically */
            /* These three functions gets the seconds, minutes and hours and sets it using selector.html */

            setInterval(function () {

                var seconds = new Date().getSeconds();
                // Add a leading zero to seconds value
                $(".sec").html((seconds < 10 ? "0" : "") + seconds);
            }, 1000);

            setInterval(function () {

                var min = new Date().getMinutes();
                // Add a leading zero to seconds value
                $(".min").html((min < 10 ? "0" : "") + min);
            }, 1000);

            setInterval(function () {

                var hours = new Date().getHours();

                $(".hours").html((hours < 10 ? "0" : "") + hours);
            }, 1000);

        });


    </script>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    /* CSS for the clock div. This gives a border to the clock */    
    .clock 
    {
    width:500px;  
    padding:20px;
    color:black;
    border:3px solid;
    border-radius: 20px; 
    margin: 0 auto;
    }

    /* This is the CSS for the entire date thus giving shadow effect and desirable font */
    .Date 
    { 
    font-family:'Trebuchet MS', Arial, sans-serif; 
    font-size:36px; 
    text-align:center; 
    text-shadow:0px 5px 5px gray; 
    }

    /* css for date ul */
    .Date1
    { 
    width:500px; 
    margin: 0 auto;
    list-style:none; 
    text-align:center; 
    padding:0;
    }

    /* The hours, min, sec is shown as a list which is displayed inline */
    .Date1 li 
    { 
    display:inline; 
    font-size:22px; 
    text-align:center; 
    font-family:'Trebuchet MS', Arial, sans-serif; 
    text-shadow:0px 3px 3px gray; 
    }



    .colon
    {
    padding:6px;
    }

      
    </style>
    </head>
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Digital Clock using JQuery </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To implement a digital clock using JQuery Library and Javascript functions. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://forum.jquery.com/topic/jquery-setinterval-function" target="_blank">
        http://forum.jquery.com/topic/jquery-setinterval-function</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://www.w3schools.com/jsref/jsref_obj_date.asp" target="_blank">
        http://www.w3schools.com/jsref/jsref_obj_date.asp</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        The day,date, month and year are retrieved using the Javascript built-in functions such as
        getDay(), getDate(),getMonth() and getFullYear().</p>
    <p class="content">
        The getDay() returns the number of the day and getMonth returns the number of the month starting from 0.
        Therefore, an array is maintained for both of these to display the dayName and the monthName respectively.</p>
    

    <p class="content">
        The time is displayed using Javascript built-in functions such as getMinutes(), getHours() and getSeconds().</p>

    <p class="content">
        The setInterval() Javascript function is used to make a call periodically to show time. </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/JQuery/clock.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENTS:</p>
   <div class="clock">
   <!-- The day date month year -->
   <div class="Date"></div>
   <!-- The hours, mins and seconds -->
      <ul class="Date1">
          <li class="hours"></li>
          <li class="colon">:</li>
          <li class="min"></li>
          <li class="colon">:</li>
          <li class="sec"></li>
      </ul>
    </div>
   
    
    
    </form>
</body>
</html>
