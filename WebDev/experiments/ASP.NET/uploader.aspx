<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    // The method that is called on the Button btnsave is clicked.
    protected void btnsave_Click(object sender, EventArgs e)
    {
        String path = MapPath("~/UploadedFiles/");   // the path where to store file on server
        if (FileUpload1.HasFile)
        {
            try
            {
                
                FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName); // save the file at the specified path
                lblmessage.Text = "File Uploaded Successfully!" + "<br /> <br />";
                
                lblmessage.Text += "File Name : " + FileUpload1.PostedFile.FileName + "<br />" // print filename
                + "Type of File : " + FileUpload1.PostedFile.ContentType + "<br />" // print file content type
                + "Size : " + FileUpload1.PostedFile.ContentLength + " bytes."; // print file content length

                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                lblmessage.Text = "Error uploading the file. Please try again! ";
            }
        }
        else
        {
            lblmessage.Text = "Please choose a file first!"; // if no file is chosen.
        }
    }
</script>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> File Uploading using ASP.NET </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    </head>
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        File Uploading using ASP.NET </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate a file uploader using ASP.NET </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://geekswithblogs.net/PointsToShare/archive/2011/12/06/asp.net-file-upload-limitations.aspx" target="_blank">
        http://geekswithblogs.net/PointsToShare/archive/2011/12/06/asp.net-file-upload-limitations.aspx</a>&nbsp;
    </p>
    <p class="content">
        <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.fileupload.aspx" target="_blank">
        http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.fileupload.aspx</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        ASP.NET has a file uploader control which lets you upload a file. </p>
    

    <p class="content">
        In this experiment, I used a file uploader control along with an ASP Button called "Upload" which when clicked,
        calls a function. I used this function to print the various attributes of the file such as the file name,
        its size and type. Finally, I used a label to print these values. </p>

    <p class="content">
        For file name, FileName property of the PostedFile was used. Similarly, for file type and size,
        ContentLength and ContentType properties are used. </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/uploader.aspx" target="_blank"> Click here! </a>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENTS:</p>
   <div>
    <h3> File Upload:</h3>
    <br />
    <!-- File Upload control -->
       <asp:FileUpload ID="FileUpload1" runat="server" BackColor="teal" /> 
       <br /><br />
       <asp:Button ID="btnsave" runat="server" 
                   onclick="btnsave_Click" Text="Upload" 
                   Width="85px" />
       <br /><br />
       <!-- Label to show all the details of the file -->
       <asp:Label ID="lblmessage" runat="server" Font-Bold="true" ForeColor="red" /> 

    
    </div>
    
    
    </form>
</body>
</html>
