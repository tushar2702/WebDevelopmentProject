<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    
// this method is basically changing the source of the image dynamically
protected void ticker(object sender, EventArgs e)
{   
    Image1.Src = getRandomImageSource();
}

// This uses Random to generate random numbers between 0 and 4 which is then used in the switch case
// to decide which image is to be rendered. here, i return the image path.
protected string getRandomImageSource()
{

    Random rand = new Random();
    int random = rand.Next(0, 4);

    switch (random)
    {
        case 0: return "~/images/experiment/boston1.jpg"; 
        case 1: return "~/images/experiment/boston2.jpg"; 
        case 2: return "~/images/experiment/boston3.jpg"; 
        case 3: return "~/images/experiment/boston4.jpg";
        default: return "~/images/experiment/boston5.jpg";   
    }

}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Image slideshow using AJAX </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    
 .size
    {
     width:600px;
     height:400px;
     border: 4px solid;
    }
    </style>

    </head>
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Image slideshow using AJAX </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To create a slideshow of images using AJAX. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://weblogs.asp.net/dmiyamasu/archive/2008/02/15/asp-net-ajax-slideshow-using-updatepanel-and-timer.aspx" target="_blank">
        http://weblogs.asp.net/dmiyamasu/archive/2008/02/15/asp-net-ajax-slideshow-using-updatepanel-and-timer.aspx</a>&nbsp;

    </p>

    <p class="content">
        <a href="http://net4.ccs.neu.edu/home/chawanpr/experiments/AJAX/ajax1.aspx" target="_blank">
        http://net4.ccs.neu.edu/home/chawanpr/experiments/AJAX/ajax1.aspx</a>&nbsp;

    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        I have already performed this experiment using JQuery. I wanted to try how AJAX works when I try to implement this.
        It's much easier and you can use asp:AsyncPostBackTrigger so that after every tick only the update panel
        is refreshed. The entire page need not be refreshed. This is what is the most important thing for
        websites now.</p>
    <p class="content">
        I used the update panel to hold the images(one image at a time). The asp:Timer is used to 
        make an event occur every tick. The tick can be set to occur every n seconds. For my example,
        it occurs every two seconds. Finally I had to use the asp:AsyncPostBackTrigger so that the
        update panel will do its task asynchronously. </p>
    

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/Ajax/slide.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENTS:</p>
    <div>
    
    <asp:ScriptManager runat="server" ID="ScriptManager">
    </asp:ScriptManager>

    <!-- The timer takes care of the tick event that will be triggered every 2000 ms. -->
    <asp:Timer runat="server" Interval="2000" ID="AjaxTimer" OnTick="ticker" />
    <br />
    <!-- Only the update panel is updated. This is called partial page updates -->
    <!--  The trigger is used so that the update panel will do the task asynchronously -->
    <asp:UpdatePanel runat="server" ID="SlideShow" UpdateMode="Always">
    <ContentTemplate>
        <!-- This is the First image that is displayed -->
        <img runat="server" id="Image1" alt="" src="~/images/experiment/boston1.jpg" class="size" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="AjaxTimer" EventName="Tick" />
    </Triggers>    
    </asp:UpdatePanel>
    </div>
    <br />
    <br />
    
    </form>
</body>
</html>
