<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>YUKADO.de</title>
        <!-- Default Stylesheets -->
         <%@include file="includesPage/_stylesheets.jsp" %>
    </head>

<body style="max-width:100%; margin-left: auto; margin-right: auto;">
   
<div><jsp:include page="topnavbars.jsp"></jsp:include></div> 
<div><jsp:include page="includesPage/slider.jsp"></jsp:include></div>      
                     
                   
                <div class="clear"></div>
        <div style="border: solid 5px white; max-width: 70%; margin: auto"> 
     
     
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        <jsp:include page="includesPage/mainHeaders/index_latestAddedProducts.jsp"></jsp:include>
           
        <!--The Middle Content Div Closing -->
    </div>
        <div class="clear"></div>
 <div><jsp:include page="includesPage/footer.jsp"></jsp:include></div>  	


</body>
</html>



