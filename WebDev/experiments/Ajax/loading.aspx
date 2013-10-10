<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    
    // When you click the button, it will make the thread sleep for 2 seconds. (2000 ms) and then display the current time
    // every time the page is refreshed.
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
        Label1.Text = "Page refreshed at " + DateTime.Now.ToString();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Progress control AJAX </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    <style type="text/css">
        .update
        {
            padding-left: 65px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Header of the page -->
    <h2>
        UpdateProgress control in AJAX
    </h2>
    <!-- The purpose section -->
    <p class="topic">
        Purpose:
    </p>
    <p class="content">
        To demonstrate the use of update progress control in AJAX
    </p>
    <hr />
    <!-- The references section -->
    <p class="topic">
        References:
    </p>
    <p class="content">
        <a href="http://www.asp.net/AJAX/Documentation/Live/overview/UpdateProgressOverview.aspx"
            target="_blank">http://www.asp.net/AJAX/Documentation/Live/overview/UpdateProgressOverview.aspx</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://net4.ccs.neu.edu/home/mamoko/experiments/Default.aspx" target="_blank">
            http://net4.ccs.neu.edu/home/mamoko/experiments/Default.aspx</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://ajaxload.info/" target="_blank">http://ajaxload.info/</a>&nbsp;
    </p>
    <hr />
    <!-- The Documentation section -->
    <p class="topic">
        Documentation:
    </p>
    <p class="content">
        In this experiment, I have demonstrated the use of UpdateProgress control in AJAX.
        I am thinking of using this in my project. It will be used when the person/user
        is trying to login to a particular page. I always wanted to perform this experiment
        but I thought of it as being a difficult experiment but when I got to know about
        AJAX controls such as UpdatePanel and UpdateProgress, my thoughts were proved wrong.
    </p>
    <p class="content">
        Here, I have used the UpdatePanel control which holds the button "Click to view
        updated time" which is associated with the UpdateProgress control of AJAX. This
        control has a ProgressTemplate which includes what should appear when the aynchronous
        call is being made. In this I have included the image which I got from this website
        http://ajaxload.info/. When the page is refreshed I make the system sleep for 2
        seconds so that you can see the image animation and then you can view the updated
        time.
    </p>
    <hr />
    <!-- The Source Code Section -->
    <div>
        <p class="topic">
            VIEW SOURCE:
        </p>
        <a href="../../../fileview/Default.aspx?~/experiments/Ajax/loading.aspx" target="_blank">
            Click here! </a>
    </div>
    <hr />
    <!-- The experiments section -->
    <p class="topic">
        EXPERIMENTS:</p>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- UpdateProgress control which has an image in the progress template which says loading. -->
        <div class="update">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div>
                        <img alt="" src="../ajax-loader.gif" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click to view updated time" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <br />
    </form>
</body>
</html>
