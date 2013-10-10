<%@ Page Title="Tushar Hotels Upload Resume" Language="C#" MasterPageFile="~/Project/ProjMaster.master" %>

<script runat="server">

    // The method that is called on the Button btnsave is clicked.
    protected void btnsave_Click(object sender, EventArgs e)
    {
        String path = Server.MapPath("~/UploadedFiles/");   // the path where to store file on server
        if (FileUpload1.HasFile)
        {
            try
            {
                FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName); // save the file at the specified path
                lblmessage.Text = "File " + FileUpload1.PostedFile.FileName + " Uploaded Successfully! <br/>" +
                "Thankyou. You will be contacted shortly!";
            
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

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<style type="text/css">
    
    /* The text content on this page at the top */
    .ResumeTitle
    {
        margin-right:30px;
        font-size:18px;
    }
    
    /* Button padding */
    .btn
    {
        padding:3px;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<br />
<br />
    <div class="ResumeTitle">You have successfully submitted your application. We will get back to you as soon as possible!
    Optionally, you can upload your resume which will help us evaluate your profile in a fair manner.<br /><br />
    <b>Upload your Resume</b></div>
    <br />
    <!-- File Upload control -->    
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#60b7b7" style="padding:5px;" />
       <br /><br />
       <asp:Button ID="btnsave" runat="server" 
                   onclick="btnsave_Click" Text="Upload" CssClass="btn"
                   Width="85px" />
       <br /><br />
       <!-- Label to show all the details of the file -->
       <asp:Label ID="lblmessage" runat="server" Font-Italic="true" Font-Size="18px" /> 

    
    </div>
</asp:Content>

