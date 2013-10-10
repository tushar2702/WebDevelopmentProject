<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title> HTML5 Webstorage </title>

<link rel="Stylesheet" href="../../css/experiments.css" />

    <script type="text/javascript">
        
        // This function is called when the window loads
        function window_onload() {

        /* When the page is loaded, check first whether it supports html5 web storage */
            if (typeof (localStorage) == 'undefined') {
                alert('Your browser does not support HTML5 Web Storage!');
            }
            else {
                // if localStorage hits is present increment it by one otherwise set it to one
                if (localStorage.hits) {
                    localStorage.hits = Number(localStorage.hits) + 1;
                }
                else {
                    localStorage.hits = 1;
                }
                // set the label to the local storage number of hits.
                document.getElementById('local').innerHTML = "Total Hits(Local Storage) :" + localStorage.hits + "<br/>";

                // do the same for session storage hits
                if (sessionStorage.hits) {
                    sessionStorage.hits = Number(sessionStorage.hits) + 1;
                }
                else {
                    sessionStorage.hits = 1;
                }
                // display it on label "session".
                document.getElementById('session').innerHTML = "Total Hits(Session Storage) :" + sessionStorage.hits + "<br/>";
            }
            
        }

    </script>

    </head>
    
    <body onload="return window_onload()">
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        HTML 5 WEB STORAGE </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate HTML 5 Web Storage - Local and Session Storage </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/html5/html5_webstorage.asp" target="_blank">
        http://www.w3schools.com/html5/html5_webstorage.asp</a>&nbsp;
    </p>

    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        This experiment demonstrates HTML5 Web Storage-Local Storage and Session Storage.
        </p>
    
    <p class="content">
        In this experiment, I have shown that there are two types of storages. Session storage maintains a session and I store 
        the number of hits for a page. This sessionStorage will forget the count of hits once the page is closed. As opposed
        to the Session Storage, there is another type of storage called LocalStorage which stores the number of hits on your
        current local browser. Hence, if you close the page and then reopen it again, it will still remember the count 
        and display to you the number of hits to the page. I use javascript to write the code when the window is loaded
        and I make use of sessionStorage.hits and localStorage.hits to get the number of hits. I increment it by one 
        everytime the page is loaded.
        </p>

    
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/HTML5/webstorage.aspx" target="_blank"> Click Here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
    <div class="content">
    <label id="local"></label>
    <label id="session"></label>
    <p>Refresh the page to increase number of hits.</p>
    <p>Close the window and open it again and check the result.</p>
    </div>
    </form>
</body>
</html>
