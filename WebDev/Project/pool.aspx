<%@ Page Title="Tushar Hotels Swimming Pool" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="Stylesheet" type="text/css" href="css/serviceType.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<img class="serviceImage" src="images/pool.jpeg" alt="" />
<br />
<!-- These are the details about my services. I have given CSS to the first letter. -->
<div class="details">

    <p><span class="firstLetter">T</span>he Hotel's outdoor swimming pool, set amidst lush green landscaping
     offers a calm respite from the city. Sun loungers beside the pool allow you to relax under the
     shade of the trees in the calm of a flower-decorated yard. The poolside bar is the ideal
     place to unwind after a swim.  The refreshing Aqua menu features a variety of cocktails and
     other beverages in addition to a delectable snack menu.
     </p>
     
     <p>This service can only be used by in-house guests.The hotel features two outdoor 
     swimming pools, including a children’s pool with a sun deck. </p>

     
     <p><span class="furtherDetails">Operating Hours:</span> 10am to 10pm </p>
     <p><span class="furtherDetails">Location:</span> Outdoor </p>

</div>
</asp:Content>

