<%@ Page Title="Masterpage Demo" Language="C#" MasterPageFile="~/experiments/Master1.master" %>

<script runat="server">

</script>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">

    /* The header of the document */
    h2
    {
    text-align:center;
    text-decoration:underline;
    }
        
    /* CSS for all topics like Purpose, References,etc. in my document */
    .topic
    {
            
    text-decoration:underline;
    text-transform:uppercase;
    font-size:20px;
    font-style:italic;
    font-family:'Trebuchet MS', Arial, Sans-serif;
    
    }

    /* CSS for all the content after the topics */
    .content
    {
    font-size:14px;
    font-family:'Trebuchet MS', Arial, Sans-serif;    
    }
        
    /* For all the links in my document */    
    a,a:visited
    {
     text-decoration:none;    
     color:blue;
    }
      

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <!-- Header of the page -->
    <h2>
        Demonstration of Master Page </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To learn how to implement master pages and deal with static and dynamic content. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://24x7aspnet.blogspot.com/2009/05/master-page-in-aspnet.html" target="_blank">
        http://24x7aspnet.blogspot.com/2009/05/master-page-in-aspnet.html</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://net4.ccs.neu.edu/home/salokhea/Experiments/Experiment2/Experiment2Home.aspx" target="_blank">
        http://net4.ccs.neu.edu/home/salokhea/Experiments/Experiment2/Experiment2Home.aspx</a>&nbsp;
    </p>

    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/ie/ehszf8ax.aspx" target="_blank">
        http://msdn.microsoft.com/en-us/library/ie/ehszf8ax.aspx</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
    This is an experiment to demonstrate the use of master pages. I have used my homepage header, footer and navigation
    as the static content to my master page. 
    </p>

    <p class="content">
    It is a great idea to use master pages. It helps in creating a consistent layout for all the pages in the application.
    </p>

    <p class="content">
    We can then create individual content pages which may differ from page to page in the entire website.
    This can be done by including the dynamic content within the asp.net ContentPlaceHolder tags.
    </p>

    <p class="content">
    As you can see this experiment unlike others, is enclosed in a master page.
    </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../fileview/Default.aspx?~/experiments/masterExp.aspx" target="_blank"> Click here to view the content page! </a>
    <br />
     <a href="../../fileview/Default.aspx?~/experiments/master1.master" target="_blank"> Click here to view Master page! </a>
    </div>
    <br />
    <br />

    <!-- The experiments section -->

   

</asp:Content>

