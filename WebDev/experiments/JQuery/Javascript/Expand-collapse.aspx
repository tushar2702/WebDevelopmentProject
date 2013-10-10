<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Expand-Collapse in Javascript </title>
     
    <script type="text/javascript">

    /* This function is called with the object passed as the parameter */
        function display(obj) {
            if (obj) {
                var sClass = obj.getAttribute('class'); /* This will store the value of the class attribute of this object */
                var sID = obj.getAttribute('id');  /* This will store the value of the id attribute of this object */
                var arrSubObj = document.querySelectorAll("#" + sID + " .sub");  /*This will select all the elements with class sub having id sID*/
                for (iIndex = arrSubObj.length - 1; iIndex >= 0; iIndex--) {
                    if (arrSubObj[iIndex]) {
                    /* If the class is Expand we need to hide it. Therefore apply the hide property defined under CSS styles */
                        if (sClass === "Expand") {     
                            arrSubObj[iIndex].setAttribute('class', 'sub hide');
                        }

                    /* If the class is not Expand we need to show it. Therefore apply the show property defined under CSS styles above*/
                        else {
                            arrSubObj[iIndex].setAttribute('class', 'sub show');
                        }

                   /* If the class is Expand, also change the class name to Collapse. So next time it should show if clicked on it */
                        if (sClass === 'Expand') {
                            obj.setAttribute('class', 'Collapse');
                        }

                  /* If the class is Collapse, also change the class name to Expand. */
                        else {
                            obj.setAttribute('class', 'Expand');
                        }
                    }
                }
            }
        }

    </script>
    <link rel="Stylesheet" href="../../../css/experiments.css" />
    <style type="text/css">
    
    
    /* All the sub-items are displayed with list style circle */
    .sub
    {
     list-style-type: circle;
            
    }
    
    
    /*This is to hide element */
    .hide
    {
     display:none;
    }
    
    /*This is to show element */
    .show
    {
     display:list-item;
    }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Expand Or Collapse without using JQuery Library (Only Javascript)</h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To expand or collapse list-items without using JQuery Library. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/js/" target="_blank">
        http://www.w3schools.com/js/</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        As I mentioned in my blog, I wanted to try the previous experiment without using the JQuery Library.
        I wanted to see how difficult or easy it is without the library.  </p>
    <p class="content">
        What I conclude now is, it is easier to code when we use the JQuery Library. It took me a lot more time to figure out how 
        to deal with multiple lists.</p>
    <p class="content">
        Initially, I thought of reusing the entire code for my 1st list-item. But what if there are many list-items. </p>
        <p class="content">
        Then, I tried to think how to reuse the code with a minor difference between the two so that if i click on a list-item
        only the child-elements of that list-item hide or show. And then, the proper use of id's and classes helped me accomplish this. </p>

    <p class="content">
        Now, the experiment is same as the previous one. Initially the list-items are shown. So, by clicking on it, all its child 
        list-items will be hidden. If the list-item is clicked once again, all its 
        child-elements will be shown. </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../../fileview/Default.aspx?~/experiments/JQuery/Javascript/Expand-collapse.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENTS:</p>
   <div>
    <ul>
        <li class="Expand" id="ListItem1" onclick="display(this)">The 1st item
            <ul>
                <li class="sub">The 1st subitem</li>
                <li class="sub">The 2nd subitem</li>
                <li class="sub">The 3rd subitem</li>
            </ul>
        </li>
        <li class="Expand" id="ListItem2" onclick="display(this)">The 2nd item
            <ul>
                <li class="sub">The 4th subitem</li>
                <li class="sub">The 5th subitem</li>
                <li class="sub">The 6th subitem</li>
            </ul>            
        </li>
    </ul>
    </div>
    
    
    </form>
</body>
</html>
