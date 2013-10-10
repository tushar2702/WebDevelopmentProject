<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google Search Demo</title>
    
    <style type="text/css">
    
    body
    {
        background-color:#944;
    }
    
    /* To change the background color and fore colors of all spans */
    span
    {
        background-color:#242424;
        color:#944 !important;
    }
    
    /* All links and bolds within the links get the color white
    and it is set to important to override any other CSS given by Google API */
    div a b,div a
    {
        color:white !important;
    }
    
    /* setting the width of the search tab at the top */
    #searchForm
    {
        width:300px;
    }
    
    
    #searchcontrol, #searchForm
    {
        display:inline-block;
        padding:10px;
        border:0px solid;
        border-radius:10px;
        -webkit-border-radius:10px;
        -moz-border-radius:10px;   
    }
    
    
    </style>


    <script src="https://www.google.com/jsapi"
        type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
        //<!
        google.load("search", "1");

        function OnLoad() {

            // Create a search control
            var searchControl = new google.search.SearchControl();

            // Add in all the searchers
            searchControl.addSearcher(new google.search.WebSearch());
            var localSearch = new google.search.LocalSearch();
            searchControl.addSearcher(localSearch);
            searchControl.addSearcher(new google.search.VideoSearch());
            searchControl.addSearcher(new google.search.BlogSearch());
            searchControl.addSearcher(new google.search.NewsSearch());
            searchControl.addSearcher(new google.search.ImageSearch());
            searchControl.addSearcher(new google.search.BookSearch());
            searchControl.addSearcher(new google.search.PatentSearch());

            // Sets the localSearch center point to Boston
            // So now when you click on the local search tab, you will get the local information only!
            localSearch.setCenterPoint("Boston, MA");

            // create a draw option and setSearchFormRoot where you want the search tab to occur
            // this actually separates the search tab at the top with the searched info...
            var drawOptions = new google.search.DrawOptions();
            drawOptions.setSearchFormRoot(document.getElementById("searchForm"));

            //  set the draw mode to tabbed. Otherwise the default is linear 
            // and it will appear all together which looks bad
            drawOptions.setDrawMode(google.search.SearchControl.DRAW_MODE_TABBED);

            // tell the search control to draw itself where it finds the id searchcontrol
            searchControl.draw(document.getElementById("searchcontrol"), drawOptions);

            // execute an inital search. I have fixed this to Northeastern University
            searchControl.execute("Northeastern University");
        }
        google.setOnLoadCallback(OnLoad);

        //]]>
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <span id="searchForm"></span><br />
    <br />
    <span id="searchcontrol"></span>
    </form>
</body>
</html>
