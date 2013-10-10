<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        var myrepeater = new DataSet();
        myrepeater.ReadXml(MapPath("repeater.xml")); // this reads the repeater.xml file
        product.DataSource = myrepeater; // this makes the datasource of Repeater "product" to myrepeater
        product.DataBind(); // this binds the data!
    }
</script>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> ASP.NET Repeater </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
    
    .Button
    {
        padding:5px;
    }
    
    /* CSS for header template */
    .headerTemp
    {
        background-color:#434343;
        color:#60b7b7;
        font-weight:bold; 
        width:220px;
    }
    
    
    </style>
    </head>
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Read XML file and display it using ASP.NET repeater </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate how to read XML files and display it using ASP.NET Repeater </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/aspnet/aspnet_repeater.asp" target="_blank">
        http://www.w3schools.com/aspnet/aspnet_repeater.asp</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    
    <p class="content">
        I wanted to know how to read an XML file and display it using ASP.NET. I wanted to use this in 
        one of my pages in the project. So, I performed an experiment to try it out! </p>

    <p class="content">
        I came across a control called Repeater in ASP.NET which has certain tags such as 
        HeaderTemplate, ItemTemplate and FooterTemplate. Now first you need an XML file that you want to read.
        You need to create an instance of DataSet and read the xml file using this instance. Then, drag and drop 
        the asp.net repeater and bind that to the datasource i.e. the xml file.
         </p>
         
    <p class="content">
        Once this is in place, to bind data in the ItemTemplate,use this code: 
        <code>DataBinder.Eval(Container.DataItem, [name of the data item in xml file])</code> and you are done! Isn't this awesome! </p>

    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/repeater.aspx" target="_blank"> Repeater.aspx </a>
    <br />
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/repeater.xml" target="_blank"> Repeater.xml </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENTS:</p>
   <div>
    <asp:Button ID="Button1" runat="server" Text="Retrieve product details from XML file" OnClick="Button1_Click" class="Button" />
    <br /><br />
    <!-- The repeater has a header template which shows how the header will look including the various titles of the table,
    Also it has all the items that are bound from the xml file in the item template. I have given different colors
    to alternative rows by using alternating item template. -->
    <asp:Repeater id="product" runat="server">

    <HeaderTemplate>
    <table border="0" cellpadding="6" cellspacing="0">
    <tr class="headerTemp">
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Product Price</th>
    </tr>
    </HeaderTemplate>

    
    <ItemTemplate>
    <tr>
    <td><%# DataBinder.Eval(Container.DataItem, "id") %></td>
    <td><%# DataBinder.Eval(Container.DataItem, "name") %></td>
    <td><%# DataBinder.Eval(Container.DataItem, "price") %></td>
    </tr>
    </ItemTemplate>

    
    <AlternatingItemTemplate>
    <tr style="background-color:#e8e8e8;">
    <td><%# DataBinder.Eval(Container.DataItem, "id") %></td>
    <td><%# DataBinder.Eval(Container.DataItem, "name") %></td>
    <td><%# DataBinder.Eval(Container.DataItem, "price") %></td>
    </tr>
    </AlternatingItemTemplate>

    
    <FooterTemplate>
    </table>
    </FooterTemplate>

    </asp:Repeater>

    
    </div>
    
    </form>
</body>
</html>
