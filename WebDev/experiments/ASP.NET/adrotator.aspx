<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> ASP.NET Ad Rotator </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    </head>
    
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        ASP.NET Ad Rotator </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate Ad Rotator control in ASP.NET </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://support.microsoft.com/kb/305035" target="_blank">
        http://support.microsoft.com/kb/305035</a>&nbsp;
    </p>

    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.adrotator.aspx" target="_blank">
        http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.adrotator.aspx</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        This experiment demonstrates the use of asp:AdRotator control. How to implement this?
        It's simple! Just create an xml file having the "Ad" tags inside "advertisements" tags.
        The image to be shown as an advertisement should be inside the "ImageUrl" tag.

        </p>
    

    <p class="content">
        In this experiment, I have used 5 images as ads and correspondingly I have five "Ad" tags in my xml file under
        the "Advertisements" tag. The next step is to just add a XmlDataSource and link it to the xml file using DataFile attribute.
        </p>

    <p class="content">
        You can observe that the image of projector doesn't appear as often as the others. This is done by setting the "Impressions"
        tag in the xml file.    
         </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/ads.xml" target="_blank"> XML FILE </a>
    <br />
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/adrotator.aspx" target="_blank"> AD Rotator </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>
    <div>
    <!-- This is the ad rotator asp.net control. The data source id is set to the id of the asp:XmlDataSource tag -->
    <!-- Alternatively, we can also use AdvertisementFile attribute to the ads.xml file" -->
    <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlDataSource1" Target="_blank" />
    
    <!-- This is the XmlDataSource control which takes the xml file ads.xml and links it to the adrotator. -->
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="ads.xml"></asp:XmlDataSource>

    </div>
    </form>
</body>
</html>
