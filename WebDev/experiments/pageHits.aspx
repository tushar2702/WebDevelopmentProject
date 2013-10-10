<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
     
    protected void Page_Load(Object sender, EventArgs e)
    {
        //call coutnMe method to increase value of counter
        this.countMe();

        // Get counter value from xml file
        System.Data.DataSet ds = new System.Data.DataSet();
        ds.ReadXml(Server.MapPath("~/experiments/counter.xml"));

        // Display counter value
        Counter.Text = ds.Tables[0].Rows[0]["hits"].ToString();
    }

    // This method increments the counter in the xml file 
    private void countMe()
    {
        // Get counter value from xml file
        System.Data.DataSet tempDataSet = new System.Data.DataSet();
        tempDataSet.ReadXml(Server.MapPath("~/experiments/counter.xml"));
        int hits = Int32.Parse(tempDataSet.Tables[0].Rows[0]["hits"].ToString());

        // Increment the count
        hits += 1;
        tempDataSet.Tables[0].Rows[0]["hits"] = hits.ToString();

        // Write counter value to the xml file.
        tempDataSet.WriteXml(Server.MapPath("~/experiments/counter.xml"));
    }
    
</script>
    

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Page Hits </title>

    <link rel="Stylesheet" href="../css/experiments.css" />
    <style type="text/css">
    
    .lbl
    {
        font-color:Black;
        font-size:20px;
        font-variant:small-caps;
    }
    
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Page Hit Counter </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate an experiment to count the number of page hits </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.codeshode.com/2011/07/hit-counter-for-aspnet-using-c-vbnet.html" target="_blank">
        http://www.codeshode.com/2011/07/hit-counter-for-aspnet-using-c-vbnet.html</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        Again, this experiment I performed out of curiosity to learn how to maintain the counter of 
        the number of hits a page has received. It was interesting to perform this experiment.
        What happens is, when a user visits this page, the counter increments by one displaying
        the number of page hits! </p>
    <p class="content">
        Basically, I used an XML file called counter.xml and initially set the count to zero. 
        Now, whenever there is a page load, I first retrieve the value from the xml file, increment it by one
        and then write it back to the xml file and then finally display it! Isn't this easy!! </p>
        <p class="content">
        REFRESH THE PAGE TO SEE THE COUNT INCREASE! </p>
    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../fileview/Default.aspx?~/experiments/pageHits.aspx" target="_blank"> PageHits.aspx </a>
    <br />
    <a href="../../fileview/Default.aspx?~/experiments/counter.xml" target="_blank"> Counter.xml </a>
    </div>
    <hr />

    <!-- The experiments section -->
<p class="topic"> EXPERIMENT:</p>
   <div>
        <asp:Label ID="Label1" runat="server" Text="Total Number of Page Hits: " CssClass="lbl"></asp:Label>
        <asp:Label ID="Counter" runat="server" CssClass="lbl"></asp:Label>    
    </div>
    </form>
</body>
</html>
