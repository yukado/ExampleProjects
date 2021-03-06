<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.util.ArrayList"%>
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
                <div class="clear"></div>
            <!-- Middle -->
            <div id="middle" class="grid_13" style="display: inline; width: 95%; float: right;">
                <div class="grid_13" id="whiteBox">
                
                                
                    <div class="grid_12 productListing">
                        
                        <div class="clear"></div>
  <style type="text/css">
            .prodGrid {
                margin: 10px;
               
            }
        </style>
        <div class="grid_13" id="productStrip"> 
                    
                       <div class="clear"></div>
<%
 String sqlTopMostProds = "SELECT * "
+" FROM  `products` p"
+" INNER JOIN  `images` i"
+" USING (  `product-name` ) "
 + "WHERE `product_qty` > 0 "
+" GROUP BY  `product-name` "
+" ORDER BY  `price` DESC "
 + " LIMIT 0,16 ";
 
 
 ArrayList<String> topMost = new ArrayList<String>();
 topMost.clear();
 Connection c = new DB_Conn().getConnection();
 Statement st = c.createStatement();
 ResultSet rs = st.executeQuery(sqlTopMostProds);
 String name, productId, subCategory, company, imageName, category, price;
 int i= 1;
 
 while (rs.next()){ 
     
      price = rs.getString("price");
      imageName = rs.getString("image-name");
      productId = rs.getString("product_id");
      name = rs.getString("product-name");
      subCategory = rs.getString("sub-category-name");
      category = rs.getString("category-name");
      company = rs.getString("company-name");
      %>
                 <div id="productList" class="grid_3 prodGrid"> 
          <a href="product.jsp?id=<%= productId %>"><img src="<%= imageName %>" style="width: 300px" /></a>
                    <p id="info">
                        <a href="product.jsp?id="><span class="blue"></span></a><br/>
                        <strong><%= name %></strong> <br/>
                        <strong><span class="red">Euro <%= price %></span></strong>
                    </p>            
                </div>
                       <%
    if (i%4 == 0){
        %>
                <div class="clear"></div>
                       <%
    }
      i++;
 }
 
 if (i == 0){
%>
                <div class="clear"></div><div id="productList" class="grid_3 prodGrid"> 
                    <a href="product.jsp"><img src="images/textures/linen.png" /></a>
                    <p id="info">
                        <a href="product.jsp?id="><span class="blue">Keine Artikel zur Datenbank hinzugefügt!</span></a><br/>
                        <br/>
                        <span class="red">Euro 0</span>
                    </p>            
                </div>
                       <%
}
%>
            </div>
             </div>
 </div> 
            </div> 
<div class="clear"></div>					       
		         </div>
		      </div>
                                  
		   
		
    <div class="container_16">
        <div id="contents">
 
            <!-- LeftSide -->

        <!-- Middle -->
        <div id="middle" class="grid_13" style="max-width: 100%;  margin-left: 30px; margin-right: 30px">
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        </div>
        <!--The Middle Content Div Closing -->
    </div>
    <!--The Center Content Div Closing -->
        </div>

    <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="#">Inh. Farahnaz Tukhy</a></li>
						<li><a href="#">Lärchenstraße 99</a></li>
						<li><a href="#">65933 Frankfurt</a></li>
						<li><a href="#l">Amtsgericht Frankfurt, 987654321</a></li>
						<li><a href="#">Ust-IdNr: DE279364096</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Kaufabwicklung</h4>
						<ul>
						
						<li><a href="#">Keine Versandkosten & Lieferung in 3 Werktagen</a></li>
						<li><a href="#">Zahlngsarten: PayPal und Überweisung</a></li>
						
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
                                    
					<h4>Follow Us</h4>
                                        <div class="social-icons">
					   		  <ul>
							      <li><a href="https://www.facebook.com/profile.php?id=100009067451689" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="http://stores.ebay.de/MyComShop24" target="_blank"><img src="images/logo/ebay-button.png" alt="" /></a></li>
							      
							      
						     </ul>
				</div>
                                    </div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Kontakt</h4>
						<ul>
							<li><span> 069 / 93 99 80 60</span></li>
							<li><span>info@mycomshop24.de </span></li>
                                                        <li><a href="contact-support.jsp">Kontakt</a></li>
						</ul>
						<div class="social-icons">
							
   	 					</div>
				</div>
			</div>			


  

</div>
        </div>
</body>
</html>


