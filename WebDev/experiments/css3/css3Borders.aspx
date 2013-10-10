<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>EXPERIMENTS ON CSS3 </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
        h3
        {
            margin-left: 20px;
        }
        
        /* This is to show the rounded corners behavior in CSS3 */
        .round
        {
            border: 3px solid blue;
            border-radius: 20px;
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            padding: 15px;
            background-color: gray;
        }
        
        /* Making the list numbered */
        .border ul li
        {
            list-style-type: decimal;
        }
        
        /* Setting the image border properties */
        .borderimg
        {
            width: 200px;
            border-width: 40px;
            -webkit-border-image: url('../border.jpg') 30 30 round;
            -moz-border-image: url('../border.jpg') 30 30 round;
            -o-border-image: url('../border.jpg') 30 30 round;
            border-image: url('../border.jpg') 30 30 round;
            padding: 10px;
        }
        
        /* This will add shadow to the element */
        .shadow
        {
            box-shadow: 10px 5px 5px gray; /* Here I have omitted the spread and inset properties */
            -webkit-box-shadow: 10px 5px 5px gray; /* For Chrome */
            -moz-box-shadow: 10px 5px 5px gray; /* For Mozilla Firefox */
        }
        
        /* This will add shadow to the element with inset */
        .inset_shadow
        {
            box-shadow: 5px 5px 10px black inset; /* Here I have omitted the spread and inset properties */
            -webkit-box-shadow: 5px 5px 10px black inset;
            -moz-box-shadow: 5px 5px 10px black inset;
        }
        
        /* This will add linear gradient */
        .linear
        {
            border: 2px solid black;
            background: -webkit-gradient(linear, 0 0, 100% 100%, from(white), to(black));
            background: -moz-linear-gradient(to right, white, black);
            background: -o-linear-gradient(top,white,black);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='white', endColorstr='black');
            width: 300px;
            height: 100px;
            color: Blue;
            padding: 15px;
            border-radius: 15px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
        }
        
        /* This is used for the top element in 2nd part of experiment */
        .top
        {
            border: 2px solid #a1a1a1;
            padding: 10px 40px;
            background: #dddddd;
            width: 300px;
            border-top-left-radius: 80px;
            border-top-right-radius: 80px;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        
        /* This is used for the middle element in 2nd part of experiment */
        .middle
        {
            border: 2px solid #a1a1a1;
            padding: 0px 0px;
            background: #dddddd;
            width: 380px;
        }
        
        
        /* This is used for the bottom element in 2nd part of experiment */
        .bottom
        {
            border: 2px solid #a1a1a1;
            padding: 10px 40px;
            background: #dddddd;
            width: 300px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 80px;
            border-bottom-left-radius: 80px;
        }
        
        .center
        {
            text-align: center;
        }
        
        /* This is to add radial gradient from maroon to red to pink */
        .radial
        {
            background: -webkit-gradient(
    radial, 50% 50%, 10, 50% 50%, 80, from(maroon), color-stop(0.2, red), to(pink));
            background: -moz-radial-gradient(50% 50%, cover, maroon 10%, red 30%, pink 100%);
            background: -o-radial-gradient(50% 50%, cover, maroon 10%, red 30%, pink 100%);
        }
        
        
        
        /* horizontal and vertical offset 20px, blur distance 5px, shadow color is green */
        .green_shadow
        {
            box-shadow: 20px 20px 5px green;
            -moz-box-shadow: 20px 20px 5px green;
            -webkit-box-shadow: 20px 20px 5px green;
            -o-box-shadow: 20px 20px 5px green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Header of the page -->
    <h2>
        CSS3 BORDERS, SHADOWS, GRADIENT
    </h2>
    <!-- The purpose section -->
    <p class="topic">
        Purpose:
    </p>
    <p class="content">
        To make use of new CSS3 properties such as border-radius, border-image, box-shadow
        and -webkit-gradient which helps in adding a great look to web pages.
    </p>
    <hr />
    <!-- The references section -->
    <p class="topic">
        References:
    </p>
    <p class="content">
        <a href="http://www.w3schools.com/css3/css3_borders.asp" target="_blank">http://www.w3schools.com/css3/css3_borders.asp</a>
        <br />
        <a href="http://css-tricks.com/css3-gradients/" target="_blank">http://css-tricks.com/css3-gradients/</a>
    </p>
    <hr />
    <!-- The Documentation section -->
    <p class="topic">
        Documentation:
    </p>
    <p class="content">
        The CSS3 border-radius property gives a rounded corner effect to various elements.
        It has the following syntax:
        <br />
        "border-radius: 1-4 length|% / 1-4 length|%;"<br />
        This is the shorthand border-radius property which sets equal radius at all the
        four corners.
    </p>
    <p class="content">
        There is a box-shadow property in CSS3 which gives the shadow effect. The syntax
        is as follows:
        <br />
        <br />
        "box-shadow: h-shadow v-shadow blur spread color inset;"
    </p>
    <p class="content">
        The border-image property is used to put an image as a border for an element. This
        property does not work with IE. Syntax:
        <br />
        <br />
        "border-image: source slice width outset repeat;"<br />
        " -moz-border-image:source slice width outset repeat;"/* Firefox */
        <br />
        " -webkit-border-image:source slice width outset repeat;"/* Safari and Chrome */
        <br />
        " -o-border-image:source slice width outset repeat;"/* Opera */
        <br />
    </p>
    <p class="content">
        The -webkit-gradient(Google Chrome) property in CSS3 is used to add linear as well
        as radial gradient. Syntax:<br />
        "-webkit-gradient(type, point,radius, point , stop)"
        <br />
        This is added to the background as<br />
        "background: -webkit-gradient(type, point,radius, point , stop)"
    </p>
    <hr />
    <!-- The Source Code Section -->
    <div>
        <p class="topic">
            VIEW SOURCE:
        </p>
        <a href="../../../fileview/Default.aspx?~/experiments/css3/css3Borders.aspx" target="_blank">
            Click here! </a>
    </div>
    <hr />
    <!-- The experiments section -->
    <p class="topic">
        EXPERIMENTS:</p>
    <div class="border">
        <ul>
            <!-- This is the first part implementing border-radius -->
            <li>Using the border-radius property, we can create rounded corners in CSS3. This is
                what I have used on my homepage.
                <br />
                <br />
                <br />
                <span class="round">This box has blue rounded corners of width 3 pixels !!!! </span>
            </li>
            <br />
            <br />
            <hr />
            <!-- This is the second part implementing different border-radius at different corners -->
            <li>Here the shorthand border-radius property has been replaced by separate border-radius
                CSS properties. The box-shadow property has also been used to add the shadow effect.
                <br />
                <br />
                <div class="top shadow center">
                    This is the top element with rounded corners!
                </div>
                <div class="middle shadow center">
                    This is the middle element with NO rounded corners!
                </div>
                <div class="bottom shadow center">
                    This is the bottom element with rounded corners!
                </div>
            </li>
            <br />
            <hr />
            <!-- This is the third part implementing border-image -->
            <li>Using the border-image property, we can place an image to create a border. But we
                can see here that the image is indeed rectangle and therefore, the shadow is also
                rectangle.
                <br />
                <br />
                <br />
                <div class="borderimg green_shadow">
                    This box has an image as border !!!! This is done by using the border-image property!
                </div>
            </li>
            <br />
            <br />
            <hr />
            <!-- This is the fourth part implementing the linear gradient property of CSS3 -->
            <li>Using the gradient property of CSS3, we can give a linear gradient effect:
                <br />
                <br />
                <div class="linear inset_shadow">
                    This is a rounded cornered box with linear gradient! Starts with white at 0,0(top
                    left corner) and ends with black at 300,100 (bottom right corner).
                </div>
            </li>
            <hr />
            <!-- This is the last part implementing the radial gradient property of CSS3 -->
            <li>Using the gradient property of CSS3, we can give a radial gradient effect:
                <br />
                <br />
                <br />
                <span class="radial round">This is a rounded cornered box with radial gradient! Here
                    the gradient changes from maroon to red to pink. </span></li>
            <br />
            <br />
            <hr />
        </ul>
    </div>
    </form>
</body>
</html>

