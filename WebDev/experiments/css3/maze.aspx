<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MAZE USING CSS3 ANIMATIONS </title>
    <style type="text/css">
    
    .maze 
    {
        background-image:url('maze.jpg');
        width:600px;
        height:600px;
        background-repeat:no-repeat;
        }
        
    .car 
    {
    width:30px;
    height:20px;
    background:red;
    position:relative;
     /* to set the animation property where name is car-maze, duration is 10s and iteration-count is 1*/
    animation:car-maze 10s 1;
    -moz-animation:car-maze 10s 1; /* Firefox */
    -webkit-animation:car-maze 10s 1; /* Safari and Chrome */
       
     }
    
    /*The sequence of events that will take place */
    @-webkit-keyframes car-maze
    {
    0%   {left:10px; top:404px;}
    10%  {left:460px; top:404px;}
    20%  {left:460px; top:320px;}
    30%  {left:35px; top:320px;}
    40% {left:35px; top:220px;}
    50% {left:490px; top:220px;}
    60% {left:490px; top:130px;}
    70% {left:35px; top:130px;}
    80% {left:35px; top:38px;}
    90% {left:490px; top:38px;}
    100%{left:490px; top:38px;}
    }
    
    @-moz-keyframes car-maze
    {
    0%   {left:10px; top:404px;}
    10%  {left:460px; top:404px;}
    20%  {left:460px; top:320px;}
    30%  {left:35px; top:320px;}
    40% {left:35px; top:220px;}
    50% {left:490px; top:220px;}
    60% {left:490px; top:130px;}
    70% {left:35px; top:130px;}
    80% {left:35px; top:38px;}
    90% {left:490px; top:38px;}
    100%{left:490px; top:38px;}
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="maze">
    <div class="car"></div>
    </div>
    </form>
</body>
</html>
