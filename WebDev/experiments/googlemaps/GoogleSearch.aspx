<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> Embedding Google Search using Google Search API </title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="Stylesheet" href="../../css/experiments.css" />
    
    </head>
    
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Embedding Google Search using Google Search API </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate the use of Google Search API </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="https://developers.google.com/web-search/docs/" target="_blank">
        https://developers.google.com/web-search/docs/</a>&nbsp;
    </p>

    <p class="content">
        <a href="http://net4.ccs.neu.edu/home/bhaktina/experiments/API/Experiment15.aspx" target="_blank">
        http://net4.ccs.neu.edu/home/bhaktina/experiments/API/Experiment15.aspx</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        I was curious to know how to embed Google Search using Google API. I came across this experiment in
        Bhakti Achlerkar's website and I wanted to learn the basic things to use a Google Search API.
        So, I went on to read the documentation by Google and it was pretty straight forward to understand
        everything. Just an experiment out of curiosity!!
        </p>
    

    <p class="content">
        In this experiment, first load the script from https://www.google.com/jsapi. Then load the web search
        api using google.load method. The API and version number are passed as arguments. 
        <br />
        <code> google.load("search", "1");</code>
        </p>
        
    <p class="content">
        Then, create a search control and add search controls to it e.g. web,local,etc.
        You can also optionally set the draw options by creating a drawOptions object and setting the draw mode
        to either DRAW_MODE_LINEAR (default) where all search results including web,local,etc are lined up together
        or set the draw mode to DRAW_MODE_TABBED where all search result options (web,local,etc) are tabbed and you
        can view by selecting one of those. Finally, tell the search control to draw itself.
        <br />
        <code>searchControl.draw(element, drawOptions)</code>
        </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/googlemaps/GoogleSearch.aspx" target="_blank"> GoogleSearch.aspx </a>
    <br />
    <a href="../../../fileview/Default.aspx?~/experiments/googlemaps/GoogleSearchDemo.aspx" target="_blank"> GoogleSearchDemo.aspx </a>
    
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
    <div>
    <a href="../GoogleSearchDemo.aspx" target="_blank">Click Here to View Demo!</a>
    </div>
    </form>
</body>
</html>
