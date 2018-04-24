<%-- 
    Document   : addToCart
    Created on : 16 Nov, 2016, 1:42:23 AM
    Author     : yukado
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24 -Einkaufskorb</title>
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>
        <jsp:useBean id="cart" scope="session" class="cart.cart"/>

        <%
        if (session.getAttribute("user") == null ){// THen new user, show join now
            %>
            <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        %>

  

   

    <div class="container_16">
        <div class="grid_16" id="whiteBox">
            <div class="grid_8 push_4" >
                <h1 class="push_2" style="padding:10px 00px">Artikel im Warenkorb</h1>
                
                
              <!--  <p>
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                </p> -->
              

        
        <div id="CartTable" style="padding:10px 00px" class="grid_11">
                    <div class="grid_5">
                        <h2>Name Of Product</h2> 
                    </div>
                    <div class="grid_2">
                        <h2>Price</h2>
                    </div>
                    <div class="grid_2">
                         <h2>Quantity</h2>
                    </div>
            
                    <div class="grid_5">
                        Assassins Creed III
                    </div>
                    <div class="grid_2">
                        Euro 999
                    </div>
                    <div class="grid_1">
                         x1
                    </div>
                    <div class="grid_2">
                         Euro. 2098
                    </div>
            
                    <div class="grid_5">
                        Dell Monitors
                    </div>
            
                    <div class="grid_2">
                        Euro 1024
                    </div>
                    <div class="grid_1">
                         x2
                    </div>
                    <div class="grid_2">
                         Euro 67890
                    </div>
            
                    <div class="grid_5">
                        Sherlock holmes
                    </div>
                    <div class="grid_2">
                        Euro 104
                    </div>
                    <div class="grid_1">
                         x1
                    </div>
                    <div class="grid_2">
                         Euro 6789
                    </div>
                    <br/>
                    
                    <div class="grid_5">
                        <strong>Gesamtpreis Eikaufskorb</strong>
                    </div>
            
                    <div class="grid_3 push_3">
                        Euro 20345
                    </div>
                    <div class="clear"></div>
                    
                    <br/>
                    <br/>
                    <a href="viewProducts_.jsp">
                    <div class="grid_3" id="greenBtn">
                        Artikel Kaufen
                    </div>
                    </a>
                    <a href="index.jsp">
                        <div class="grid_3" id="greenBtn">
                        Weiter Shoppen
                    </div>
                    </a>
                </div>
                
            </div>
            
        </div>
    </div>
    </body>
</html>