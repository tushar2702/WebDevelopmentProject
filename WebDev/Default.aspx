<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8' />
    <title>Tushar's Homepage</title>
    <link rel="Stylesheet" href="css/homepage.css" />
    <style type="text/css" media="screen">
        body
        {
            margin: 0;
            padding: 0;
            background-color: #6facb8;
        }
        
        .pad
        {
            padding: 10px;
        }
        
        .fb-like
        {
            padding: 7px;
            clear: both;
            width: 300px;
        }
    </style>
</head>
<body>
    <!-- This is the JS plugin for the facebook like button -->
    <div id="fb-root">
    </div>
    <script>        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
    <div class="pad">
        <form id="form1" runat="server">
        <div class="container ">
            <div class="Header">
                <h1 class="name">
                    <a href="Default.aspx">Tushar Bhandari</a>
                </h1>
                <h3 class="subtitle">
                    CS 5610 Web Development
                </h3>
            </div>
            <div class="nav">
                <ul>
                    <li><a href="source/" target="_blank">Source</a></li>
                    <li><a href="statistics/" target="_blank">Statistics</a></li>
                    <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                    <li><a href="search/" target="_blank">Search</a></li>
                    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
                    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
                    <li><a href="blog/" target="_blank">Blog</a></li>
                    <li><a href="story/index.htm?../experiments/story.txt" target="_blank">Experiments</a></li>
                </ul>
            </div>
            <!-- End of nav div -->
            <div class="Body">
                <div class="myImage">
                    <div class="abc">
                        <img alt="Tushar" class="myphoto" src="images/homepage/me.jpg" /></div>
                    <div class="fb-like" data-href="http://net4.ccs.neu.edu/home/tushar27/" data-send="false"
                        data-width="100" data-show-faces="false">
                    </div>
                    <br />
                    <div class="contact">
                        <p class="contactme">
                            Contact Me:</p>
                        <br />
                        <a href="https://www.facebook.com/profile.php?id=507892653" target="_blank">
                            <img src="images/homepage/fb-icon.png" alt="Facebook Logo" /></a> <a href="http://www.linkedin.com/in/bhandaritushar"
                                target="_blank">
                                <img src="images/homepage/linkedin-icon.png" alt="LinkedIn Logo" /></a>
                        <a href="mailto:bhandari.tu@husky.neu.edu" target="_blank">
                            <img src="images/homepage/g-mail.jpg" class="gmailContactPic" alt="GMail Logo" /></a>
                    </div>
                    <!-- End of contact div -->
                </div>
                <!-- End of myImage div -->
                <div class="content">
                    <br />
                    <p>
                        Hello! Welcome to my website.</p>
                    <p>
                        I am a Graduate student from the College of Computer and Information Science at
                        Northeastern University, Boston.</p>
                    <p>
                        I am creating this website for my CS 5610 Web Development Course under the guidance
                        of <a href="http://www.ccs.neu.edu/home/rasala/" target="_blank">Prof. Richard Rasala</a>
                        and <a href="http://www.ccs.neu.edu/home/fell/" target="_blank">Prof. Harriet Fell.</a>
                        It has been so far the most interesting course for me!
                    </p>
                    <p>
                        During the course, I learnt wonderful web technologies like HTML, CSS, Javascript,
                        JQuery, ASP.NET, C#, AJAX, LINQ, etc.
                    </p>
                    <p>
                        I have also developed a project as part of the course. To view it click here <a href="Project/ProjectIdea/aboutProject.aspx"
                            target="_blank" class="project">PROJECT</a></p>
                    <p>
                        My Website is best viewed in Google Chrome or Safari.
                    </p>
                    <p>
                        You may also wish to explore the awesome <a href="story/index.htm" target="_blank">Story
                            Utility</a> tool by Prof. Rasala! I have used this tool as a way to demonstrate
                        my Experiments and also my Project Documentation.
                    </p>
                    <p class="ref">
                        References:</p>
                    <div>
                        <ul class="references">
                            <li><a href="http://www.ccs.neu.edu/home/rasala/" target="_blank">Prof. Rasala's Website</a></li>
                            <li><a href="http://www.ccs.neu.edu/teaching/web/" target="_blank">CS 5610 Home</a></li>
                            <li><a href="http://www.jquery.com/" target="_blank">JQuery</a></li>
                            <li><a href="http://www.w3schools.com/" target="_blank">W3Schools</a></li>
                            <li><a href="http://msdn.microsoft.com/en-us/library/default.aspx" target="_blank">MSDN
                                Library</a></li>
                            <li><a href="http://www.asp.net/" target="_blank">ASP.NET</a></li>
                        </ul>
                    </div>
                    <br />
                    <blockquote>
                        Thank you Prof. Rasala to give us this opportunity to learn Web Development as a
                        beautiful story lecture by lecture and directing us towards success! I would also
                        like to thank the Teaching Assistants to help us when we needed them. A special
                        thanks to Prasad Chawan for guiding me throughout the course.</blockquote>
                    <br />
                    <br />
                    <br />
                </div>
                <!-- End of content div -->
            </div>
            <!-- End of Body div -->
        </div>
        <!-- End of container div -->
        <div class="footer">
            &copy; 2012 Tushar Bhandari. All rights reserved.
        </div>
        </form>
    </div>
</body>
<!-- End of body -->
</html>
