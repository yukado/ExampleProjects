<%-- 
    Document   : addToCart
    Created on : 16 Nov, 2016, 1:42:23 AM
    Author     : yukado
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>
</head>
    <body style="max-width:100%; margin-left: auto; margin-right: auto;">
        <jsp:useBean id="cart" scope="session" class="cart.cart"></jsp:useBean>
       
<div><jsp:include page="topnavbars.jsp"></jsp:include></div> 
 
                <%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
                <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->           
<div id="leftside">
                <div>
                    <ul id="leftsideNav" style="float: left; margin-left: 3%;">
                        <li><a href="#"><strong>Kategorien</strong></a></li>
                        
                        <%
                        while (rs.next()){
                            String category = rs.getString ("category_name");
                            %>
                            <li><a href="viewProducts_.jsp"><%= category %></a></li>
                        <%
                        }
                        %>
                      
                    </ul>
        </div>
               <div class="header_bottom_right">					 
		<div class="slider">					     
		<div id="slider">
            <div class="grid_16" id="whiteBox">
                <div class="grid_8 push_1" >
                    <h1 class="push_1" style="padding:10px 00px; font-weight: bold; font-size: 20px">Warenkorb</h1>

                    <%
                        user User = new user();
                        session.getAttribute("user");
                        //out.println(session.getAttribute("user"));
                        User = (user) session.getAttribute("user");
                        if (session.getAttribute("user") == null) {
                    %>
                    <h3 class="showForm" id="loginBtn" style="padding:10px 00px">Bitte zuerst Anmelden...</h3>

                    <%                } else {
                        //out.println("login by " + User.getUserEmail());

                    %>



                    <%
                        String sid = request.getParameter("id");
                        int id;
                        if (request.getParameter("id") == null) {
                            response.sendRedirect("viewProduct_.jsp");
                        } else {
                            id = Integer.parseInt(sid);

                            boolean b = cart.addProduct(id);

                            if (b == true) {
                                out.println("Zuletzt " + " " + cart.getProductName(id) + " im Wert von " + cart.getProductPrice(id)+"0 in den Warenkorb getan!");
                            } else {
                                out.println("Nicht dazu getan !!");
                            }

                           // out.println("<br/>Gesamtbetrag: " + Math.ceil(100*cart.getTotalPriceOfCart())/100);
                          
                            ArrayList<String> productNames = new ArrayList();
                            ArrayList<Double> productPrices = new ArrayList();
                          
                            ArrayList<Integer> Qty = new ArrayList();
                            ArrayList<Integer> ids = new ArrayList();
                           
                            productNames = cart.getProductNames();
                            productPrices = cart.getPrices();
                            Qty = cart.getQty();
                            ids = cart.getId();
                    %>


                    <div id="CartTable" style="padding:10px 00px;" class="grid_14" >
                        <div class="grid_2" style="max-width: 125px">
                            <h2 style="font-weight: bold;">Artikel ID </h2> 
                        </div>
                        <div class="grid_4" style="">
                            <h2 style="font-weight: bold;">Artikelname </h2> 
                        </div>
                        <div class="grid_4">
                            <h2 style="font-weight: bold;">Preis x Menge</h2>
                        </div><br/>
                        <div class="line"></div>
                    
                        

                        <%
                            for (int i = 0; i < productNames.size(); i++) {
                        %>
                        <div class="grid_2">
                            <%=ids.get(i)%>
                        </div>
                        <div class="grid_4" style="margin-left: 15%; width: 125px">
                            <%=productNames.get(i)%>
                        </div>
                        <div class="grid_4" style="margin-left: 5%;">
                            <%=productPrices.get(i)%>0  Euro x<%=Qty.get(i)%>
                        </div>
                        
                        <div class="grid_2" style="float:right; width: 100%">
                            <br/><h2 style="font-weight: bold;">Gesamtbetrag inklusive MwSt:</h2><h3 style="font-weight: bold"> <%=Math.ceil(100*Qty.get(i) * productPrices.get(i))/100%>0 Euro</h3><div class="line"></div>
                        </div><br/><br/><br/>

                        <%
                            }
                            productNames.clear();
                            productPrices.clear();

                        %>
                        <br/>

                       
                        <a href="buyItems.jsp">
                            <div class="grid_3" id="greenBtn" style="margin-top: 10px;  margin-left: 150px; color:white; border-radius:7px; text-shadow: 0 -1px 0 white; text-align:center; padding:10px; background: -webkit-linear-gradient(top, #0d0d0d,#0d0d0d); background: -moz-linear-gradient(top, #0d0d0d,#0d0d0d); box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4);">
                                Zur Kasse
                            </div>
                        </a>
                        <a href="viewProducts_.jsp">
                            <div class="grid_3" id="greenBtn" style="margin-top: 10px; margin-left: 50px;  color:white; border-radius:7px; text-shadow: 0 -1px 0 white; text-align:center; padding:10px; background: -webkit-linear-gradient(top, #0d0d0d,#0d0d0d); background: -moz-linear-gradient(top, #0d0d0d,#0d0d0d); box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4);">
                                Weiter Shoppen
                            </div>
                        </a>
                    </div>

                    <br/>
                    <br/>
                    
                    
                    <br/>
                    <%
                            }
                        }
                    %>
                    </div>
                    <div class="clear"></div>
                    
                </div>

            </div>
</div>
                    </div>
<div class="clear"></div>
</div>
                    </div>
        <div style="border: solid 5px white; max-width: 70%; margin: auto"> 
     
     
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        <jsp:include page="includesPage/mainHeaders/index_latestAddedProducts.jsp"></jsp:include>
           
        <!--The Middle Content Div Closing -->
    </div>
         <div class="clear"></div>
                 <div><jsp:include page="includesPage/footer.jsp"></jsp:include></div>
    </div>
    </body>
</html>
