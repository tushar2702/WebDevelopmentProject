<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    /* This changes the view from view 1 to 2 to 3 etc. */
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int n;
        int.TryParse(DropDownList1.SelectedValue, out n); // taking the selected value of the drop down and storing it in n
        MultiView1.ActiveViewIndex = n; // setting the active view index
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> ASP.NET Multiview and AJAX Update Panel Control </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        ASP.NET Multiview and AJAX Update Panel Control </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate the use of multiviews and update panel control in ASP.NET/AJAX </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://ajax.asp.net/docs/overview/UpdatePanelOverview.aspx" target="_blank">
        http://ajax.asp.net/docs/overview/UpdatePanelOverview.aspx</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://stackoverflow.com/questions/5101246/i-need-to-change-multiview-or-place-holder-whenever-i-select-different-values-in" target="_blank">
        http://stackoverflow.com/questions/5101246/i-need-to-change-multiview-or-place-holder-whenever-i-select-different-values-in</a>&nbsp;
    </p>
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        While thinking about the design of the web pages in my project, I felt the need to use
        Multiviews. So I performed an experiment on ASP.NET multiview and used a drop down to 
        select the view. Initially, it was difficult to bind the drop down to the multiview.
        But, the question posted on Stack overflow helped me resolve that. </p>
    <p class="content">
        In this experiment, you need to choose one of the views listed in the drop-down menu.
        The selected item's respective view will be displayed. I listed 3 different views: A red,green and yellow
        calendar. There are also command button properties of multiview like NextView and prevView and they 
        help to navigate through the commands. </p>
    <p class="content">
        At the end of the experiment, I realised that when I select a new value from the drop down list,
        the page is refreshed all the time. So, I thought of using the Update Panel Control of ASP.NET - AJAX.
        This was really helpful and you can see that only the panel gets updated each time a new value from 
        the drop down is selected. This would be definitely used in the project!!!</p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/Multiview.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENT:</p>   
   
   <div>
   <!-- The ScriptManager control takes care of the client-side script for all the server side controls.-->
   <asp:ScriptManager ID="ScriptManager" 
                               runat="server" />
    <!-- With this, only the panel gets updated not the entire page...  -->
    <!-- It is the content template that defines what appears in the update panel when it is rendered. -->
    <!-- The fieldset specifies the boundary of the update panel -->
    <asp:UpdatePanel ID="UpdatePanel1" 
                             UpdateMode="Conditional"
                             runat="server">
    <ContentTemplate>
    <fieldset>
    <h2>This is an Update Panel!!</h2>
    <h3>Select a view to be displayed:</h3> 
    <!-- Drop down list that contains view 1, view 2 and view 3 -->
    <asp:DropDownList ID="DropDownList1" 
    runat="server" 
    onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"
    Width="150">
        <asp:ListItem Value="0">View1</asp:ListItem>
        <asp:ListItem Value="1">View2</asp:ListItem>
        <asp:ListItem Value="2">View3</asp:ListItem>
    </asp:DropDownList>
    <hr />
    <!-- Multiview tag where the active view index is 0 that means the 1st one is selected. -->
    <asp:MultiView ID="MultiView1" 
             runat="server" 
             ActiveViewIndex="0">
    <asp:View ID="View1" runat="server">

    <h3>This is view 1: Red Calendar</h3>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="Red">
        </asp:Calendar>
        <!-- This is for the next view to be rendered -->
    <asp:Button CommandName="NextView" ID="btnnext1" 
             runat="server" Text = "Go To Next" />
    <asp:Button CommandArgument="View3" 
             CommandName="SwitchViewByID" ID="btnlast" 
             runat="server" Text = "Go To Last" />
    </asp:View> 
    <asp:View ID="View2" runat="server">

    <h3>This is view 2: Green Calendar </h3>
        <asp:Calendar ID="Calendar2" runat="server" BackColor="Green">
        </asp:Calendar>
    <asp:Button CommandName="NextView" ID="btnnext2" 
             runat="server" Text = "Go To Next" />
             <!-- This is for the previous view to be rendered -->
    <asp:Button CommandName="PrevView" ID="btnprevious2" 
             runat="server" Text = "Go To Previous View" />
    </asp:View> 
    <asp:View ID="View3" runat="server">

    <h3> This is view 3: Yellow Calendar</h3>

        <asp:Calendar ID="Calendar3" runat="server" BackColor="Yellow">
        </asp:Calendar>
    <asp:Button  CommandArgument="0" 
              CommandName="SwitchViewByIndex" ID="btnfirst" 
              runat="server" Text = "Go To Next" />
    <asp:Button CommandName="PrevView" ID="btnprevious" 
    runat="server" Text = "Go To Previous View" />
    </asp:View> 
    </asp:MultiView>

    </fieldset>
    </ContentTemplate>
    </asp:UpdatePanel>
    </div> 

    
    </form>
</body>
</html>
