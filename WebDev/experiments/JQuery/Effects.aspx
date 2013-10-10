<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> JQUERY EFFECTS </title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">

    /* This is for the hide and show effects */

    $(document).ready(function () {   /* This will be loaded as soon as the document is ready */
        /* flag is initially set to 1, it means the child-elements are visible */
        /* flag is 0 means child-elements are hidden */
        var flag = 1;
        $(".HideOrShow").click(function () {
        /* If child-elements are visible, and the parent is clicked, they need to be hidden */
        /* Also the flag now needs to be reset */
            if (flag == 1) {
                $(".sub1").hide(); 
                flag = 0;
            }
         /* If child-elements are hidden, and the parent is clicked, they need to be made visible */
         /* Also the flag now needs to be set */
            else {

                $(".sub1").show();
                flag = 1;
            }
        }
);
    });


    /* This is for the sliding effects */
    $(document).ready(function () {
        var flag = 1;
        $(".Slide").click(function () {
        /* If child-elements are visible, and the parent is clicked, they are slided up */
        /* Also the flag now needs to be reset */
            if (flag == 1) {

                $(".sub2").slideUp(1000);   /* The slide up takes 1000ms */
                flag = 0;
            }
        /* If child-elements are hidden, and the parent is clicked, they are slided down */
        /* Also the flag now needs to be set */
            else {

                $(".sub2").slideDown(1000);  /* The sliding down takes 1000ms */
                flag = 1;
            }
        }
);
    });


</script>
<link rel="Stylesheet" href="../../css/experiments.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Expand Or Collapse using JQuery Effects</h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To expand or collapse list-items using JQuery hide(), show(), slideUp() and 
        slideDown() effects.</p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/jquery/default.asp" target="_blank">
        http://www.w3schools.com/jquery/default.asp</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        After reading about basic JQuery from W3Schools, I wanted to try expand or 
        collapse of list-items with different JQuery Effects.</p>
    <p class="content">
        The $document.ready() function starts executing once the document is ready . I 
        have used a flag to determine whether to hide or show ( or in the other case 
        slideUp or slideDown) the child-elements.</p>
    

    <p class="content">
        Now, initially the list-items are shown. So, by clicking on it, all its child 
        list-items will be hidden. If the list-item is clicked once again, all its 
        child-elements will be shown. The same thing happens with the other list item. 
        But here, instead of hiding and showing child-elements, they will be slided up 
        or down.</p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/JQuery/Effects.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENTS:</p>
   <div>
   <ul>

    <li class="HideOrShow"> I will show/hide myself if you click on me!
        <ul>
        <li class="sub1"> I am X </li>
        <li class="sub1"> I am Y </li>
        <li class="sub1"> I am Z </li>
        </ul>
    </li>

    <li class="Slide"> I will slide if you click on me!
        <ul>
        <li class="sub2"> I am A </li>
        <li class="sub2"> I am B </li>
        <li class="sub2"> I am C </li>
        <li class="sub2"> I am D </li>
        <li class="sub2"> I am E </li>
        </ul>
    </li>


    </ul>
    </div>
    
    
    </form>
</body>
</html>
