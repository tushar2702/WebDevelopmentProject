<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> CSS3 ANIMATION </title>
     
    <script type="text/javascript">
    </script>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        MAZE USING CSS3 ANIMATIONS </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To use the -webkit-animation property of CSS3 and a maze!! </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://css-tricks.com/snippets/css/webkit-keyframe-animation-syntax/" target="_blank">
        http://css-tricks.com/snippets/css/webkit-keyframe-animation-syntax/</a>&nbsp;

    </p>
    <p class="content">
        <a href="http://www.w3schools.com/css3/css3_animations.asp" target="_blank">
        http://www.w3schools.com/css3/css3_animations.asp</a>&nbsp;

    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        I wanted to experiment on CSS3 Animation property. I had something else in mind. Probably, I was going to show
        a ball and its motion around a path.
        But, then I thought of a maze. And this experiment was very simple. It demonstrates the basic -webkit-animation and
        @-webkit-keyframes property. </p>
    <p class="content">
        The -webkit-animation has the following separate properties: </p>
        <p class="content">
         -webkit-animation-name
         -webkit-animation-duration
         -webkit-animation-iteration-count
         -webkit-animation-direction
         -webkit-animation-timing-function
         -webkit-animation-fill-mode
         -webkit-animation-delay: 2s
        </p>
    <p class="content">
        The @-webkit-keyframe syntax is as follows:   </p>
        <p class="content">
        
        @-webkit-keyframes NAME-YOUR-ANIMATION {
	        0%   { ...//CSS property } 
	        100% { ...//CSS property }
        }
        
        </p>
    <p class="content">
        These properties are amazing and CSS3 may start ruling the animation world!! 
        In a similar way we can also use @-moz-keyframes for Mozilla Firefox. However,
        this is not supported by IE and Opera. </p>
    
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/css3/maze.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
   <div>
   <a href="../maze.aspx" target="_blank">
    Click Here to See Demo
   </a>
    </div>
    
    
    </form>
</body>
</html>
