<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Vertical Navigation using CSS </title>
     
    
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    /* CSS for ul having class vertical */
    ul.vertical 
    {
    background-color:white;
    text-align:left;
    width:180px;
    padding-top:6px;
    padding-bottom:6px;
    margin:0;
    padding-left:0;
    border-left:5px solid green;
    }

    /* For li under ul whose class is vertical */
    ul.vertical li 
    {
    list-style-type:none;
    padding-top:10px;
    padding-bottom:10px;
    }

    /* For all the a tags inside the li under ul with class vertical */
    ul.vertical li a
    {
    background: rgb(127, 201, 68);
    text-decoration:none;
    color:black;
    padding:6px;
    position: relative;
    font: bold 20px 'Serif';
    -webkit-box-shadow: 3px 0px 5px rgb(127, 201, 68) inset; /* box shadow property for Chrome and Safari */
    -moz-box-shadow: 3px 0px 5px rgb(127, 201, 68) inset; /* box shadow property for Firefox */
    box-shadow: 3px 0px 5px rgb(127, 201, 68) inset;
    -webkit-transition: all 0.2s linear; /* Safari and Google chrome */
    -o-transition:  all 0.2s linear; /*Opera*/
    -moz-transition: all 0.2s linear; /* Firefox */
    transition: all 0.2s linear;
    border-top-right-radius:5px;
    border-bottom-right-radius:5px;

    }

    
    /* If there is a hover on the a tag add left and right padding and change background color */
    ul.vertical li a:hover
    {
    padding-left: 30px; 
    padding-right:30px;
    background-color: rgb(153,249,75);
    
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Vertical Navigation using CSS </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To create a nice looking vertical navigation using CSS and CSS3 properties. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/cssref/" target="_blank">
        http://www.w3schools.com/cssref/</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        This is a very simple experiment showing a vertical navigation bar using CSS properties.  </p>
    <p class="content">
        I have used basic CSS properties and additional CSS3 properties such as box-shadow, border-radius and transition. 
        These properties help in giving a good look and feel to the various HTML elements specifically transition!!! 
        However, the transition property is not yet supported by IE. Other browsers such as Google Chrome
        and Firefox support it.</p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/css3/vertical-nav.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
   <div>
    <ul class="vertical">
    <li><a href="#">Home</a></li>
    <li><a href="#" >Source</a></li>
    <li><a href="#">Statistics</a></li>
    <li><a href="#">Experiments</a></li>
    <li><a href="#">Blog</a></li>
    <li><a href="#">Search</a></li>		
    </ul>

    </div>
    <hr />
    
    </form>
</body>
</html>
