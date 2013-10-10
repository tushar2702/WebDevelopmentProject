<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title> Validators in ASP.NET </title>
    <link rel="Stylesheet" href="../../css/experiments.css" />
    </head>
    
    <body>
    <form id="form1" runat="server">
    
    <!-- Header of the page -->
    <h2>
        Validators in ASP.NET </h2>

    <!-- The purpose section -->
    <p class="topic"> Purpose: </p>
    <p class="content">
        To demonstrate validators in ASP.NET </p>
    <hr />

    <!-- The references section -->
    <p class="topic"> References: </p>
    <p class="content">
        <a href="http://www.w3schools.com/aspnet/aspnet_refvalidationcontrols.asp" target="_blank">
        http://www.w3schools.com/aspnet/aspnet_refvalidationcontrols.asp</a>&nbsp;
    </p>
    
    <hr />
    
    <!-- The Documentation section -->
    <p class="topic"> Documentation: </p>
    <p class="content">
        </p>
    <p class="content">
        Validation of form controls using Javascript required writing of entire code for each and every field. ASP.NET
        provides an validators to serve this purpose and it's so simple - Just drag and drop.
        </p>
    

    <p class="content">
        In this experiment, I demonstrated various validators such as RangeValidator, RequiredFieldValidator,  RegularExpressionValidator, etc.
        For demonstrating RangeValidator control, I have used a calendar and for selecting the correct date, you need to choose a date
        within the current week starting from today. It would check this week range. The "Name" in my form is a required field and for 
        that I have used a RequiredField Validator.  </p>

    <p class="content">
        Now, a little complicated was to use the regular expression validator.
        For regular expression validator, I used two fields phone number and email address.
        The number should be in (xxx)-xxx-xxxx format. The expression is a regex written in the "ValidationExpression"
        attribute of the RegularExpressionValidator. </p>


    <hr />

    <!-- The Source Code Section -->
    <div>
    <p class="topic"> VIEW SOURCE: Validator Demo </p>
    <a href="../../../fileview/Default.aspx?~/experiments/ASP.NET/validatordemo.aspx" target="_blank"> Click here! </a></p>
    </div>
    <hr />

    <!-- The experiments section -->
    <p class="topic"> EXPERIMENTS:</p>
    <div>
    <a href="../validatordemo.aspx" target="_blank">
    CLICK HERE TO SEE DEMO    
   </a>
    </div>
    
    </form>
</body>
</html>
