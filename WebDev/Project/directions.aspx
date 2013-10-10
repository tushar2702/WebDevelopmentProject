<%@ Page Title="Get Directions" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<!-- Google Widget for getting directions to my hotel. It has been taken from www.gmodules.com -->
<script src="//www.gmodules.com/ig/ifr?url=http://hosting.gmodules.com/ig/gadgets/file/114281111391296844949/driving-directions.xml&amp;up_fromLocation=&amp;up_myLocations=440%20Huntington%20Avenue%20Boston%20MA%2002115&amp;up_defaultDirectionsType=&amp;up_autoExpand=&amp;synd=open&amp;w=416&amp;h=64&amp;title=Directions+by+Google+Maps&amp;lang=en&amp;country=US&amp;border=http%3A%2F%2Fwww.gmodules.com%2Fig%2Fimages%2F&amp;output=js"></script>    
<br />
<br />
</asp:Content>

