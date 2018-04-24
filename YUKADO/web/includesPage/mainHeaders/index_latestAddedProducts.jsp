<%-- 
    Document   : topMostViewedProducts
    Created on : 13 Dec, 2016, 6:45:53 PM
    Author     : yukado
--%>

        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="database.DB_Conn"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.util.ArrayList"%>

        <style type="text/css">
            .prodGrid {
                margin: 20px;
               
            }
        </style>
        <div class="grid_13" id="productStrip"> 
                       <a href="viewProducts_.jsp">
                           <div class="ProductHeading">
                               <div class="grid_12">
                                   <h1 class="heading" style="font-size:40px">Neu im Shop</h1>
                               </div>
                               <!--<div id="viewMore" class="grid_3">
                                   <h6 class="blue">View More</h6>
                               </div>-->
                           </div>
                       </a>
                       <div class="clear"></div>
<%
 String sqlTopMostProds = "SELECT * "
+" FROM  `products` p"
+" INNER JOIN  `images` i"
+" USING (  `product-name` ) "
 + "WHERE `product_qty` > 0 "
+" GROUP BY  `product-name` "
+" ORDER BY  `hits` DESC "
 + " LIMIT 0,04 ";
 
 
 ArrayList<String> topMost = new ArrayList<String>();
 topMost.clear();
 Connection c = new DB_Conn().getConnection();
 Statement st = c.createStatement();
 ResultSet rs = st.executeQuery(sqlTopMostProds);
 String name, productId, category, subCategory, company, imageName, price;
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
  <div id="productList" class="grid_3 prodGrid" style="box-shadow: 0 0 20px rgba(0,0,0,0.4); width: 200px; height: 280px; margin: 20px 0 0 20px"> 
          <a href="product.jsp?id=<%= productId %>"><img src="<%= imageName %>" style="width: 150px; height: 150px; margin-left: 20px; margin-top: 15px" /></a>
                    <p id="info"  style="width: 170px; height: 80px; margin: auto">
                        <a style="font-size: 20px;" href="product.jsp?id=" ><span class="blue" ></span></a><br/>
                        <strong style=""><%= name %></strong> <br/>
                        <strong style="color: blue; font-size: 25px; font-weight: bold;"><span class="red"><%= price %> <a style="font-size: 20px; color: black">Euro</a></span></strong>
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