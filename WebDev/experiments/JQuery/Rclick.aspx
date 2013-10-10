<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> DISABLE RIGHT CLICK USING JQUERY </title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function () {
            $("a.disable").bind("contextmenu", function (e) {
                return false;
            });
        });

    </script>
    <link rel="Stylesheet" href="../../css/experiments.css" />

    <style type="text/css">
    
    a.disable
    {
    text-decoration:none;
    color:Blue;
    background-color:yellow;
    }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Disable Right Click using JQUERY </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To disable right mouse click using JQUERY library. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://old.nabble.com/How-to-change-contextmenu-plugin-to-trigger-on-left-click-td14688817s27240.html" target="_blank">
        http://old.nabble.com/How-to-change-contextmenu-plugin-to-trigger-on-left-click-td14688817s27240.html</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        This experiment shows how to disable right mouse clicks.  </p>
    <p class="content">
        It uses the bind() property of JQuery and the "contextmenu" which actually binds the content to the right click. Setting
        it to false disables the right click.</p>
    
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/JQuery/Rclick.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
   Right click on the link below to win $100,000
    <p>
    <a class="disable" href="#"> MONEY MONEY MONEY !!!!! </a>
    </p>
    
    </form>
</body>
</html>
