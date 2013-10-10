<%@ Page Language="C#" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<%@ Import Namespace="edu.neu.ccis.tushar27.Northwind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    // This is for selecting only employee id, her first name and last name and title of courtesy from the 
    // entire employees table of Northwind Database. I have also made use of the where clause 
    // which allows only Ms. title of courtesy. that means, only female employees have been displayed.
    DataClassesDataContext dc = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        NorthwindGrid2.DataSource = from data in dc.Employees
                                    where data.TitleOfCourtesy == "Ms."
                                    select new { data.EmployeeID, data.FirstName, data.LastName, data.TitleOfCourtesy };
        NorthwindGrid2.DataBind();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Basic LINQ</title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Basic LINQ connection and queries </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To start with LINQ connection and basic queries to view data as a table. </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/bb907622.aspx" target="_blank">
        MSDN - Using LINQ with ASP.NET </a>&nbsp;
    </p>
    <p class="content">
        <a href="http://www.ccs.neu.edu/teaching/web/linq.htm" target="_blank">
        Prof. Rasala's LINQ Notes</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
          In this experiment, I have learnt how to establish connection with LINQ and 
          create LINQ-to-SQL file. &nbsp;The following are the steps:</p>
    <p class="content">
        <ol>
        <li>Create a connection with the Northwind database and make sure the connection 
        strings are in place as we saw in the previous experiments.</li>
        <li>Refresh the Northwind database to ensure that it is there.</li>    
        <li>Now, create Northwind.dbml file (by selecting Linq-to-sql classes option under add new item.) in the
        ~/app_code directory.</li>
        
        <li>In the properties window, add the context and entity namespace as edu.neu.ccis.username.Northwind
        and then choose the Northwind connection in the connection menu.</li>
        <li>Then drag the tables, then the views into the Northwind.dbml.layout file.</li>
        <li> Once this is done, create a new aspx file and add gridview control to it. </li>
        <li>Now bind this to the data source which is the LinqDataSource. This can be done in two ways:</li> 
        <li>Either by having a linqdatasource control or by creating a object of the class declared in 'designer.cs'
        and then writing the linq query to access the tables.</li>  </ol></p>
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/LINQ/basicLinq.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENTS:</p>
   <div>
    <!-- This is the gridview which is connected to the linq Data source1 and the linq query returns all the rows
    in shippers table -->
   <p class="content">This displays the details of the Shipper table of Northwind database.
    You can sort the rows based on each column!</p>
    <asp:GridView ID="NorthwindGrid" runat="server" AllowSorting="true" DataSourceID="LinqDataSource1" AllowPaging="true" 
    RowStyle-BackColor="Red" RowStyle-ForeColor="White" 
    HeaderStyle-BackColor="Maroon" HeaderStyle-ForeColor="White"
    CellPadding="5" />
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="edu.neu.ccis.tushar27.Northwind.DataClassesDataContext" 
        EntityTypeName="" OrderBy="ShipperID" TableName="Shippers" >
    </asp:LinqDataSource>
    <br />
    <br />
    <!-- This is the gridview which is displaying female employees id, firstname, lastname and title of courtesy -->
    <p class="content">This displays only few details of the female employees in the Northwind database Employees table!</p>
    <asp:GridView ID="NorthwindGrid2" runat="server" RowStyle-BackColor="Red" RowStyle-ForeColor="White" 
    HeaderStyle-BackColor="Maroon" HeaderStyle-ForeColor="White"
    CellPadding="5" />
    <br />
    </div>
    
    </form>
</body>
</html>
