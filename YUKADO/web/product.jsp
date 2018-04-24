
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*, database.*" %>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>
     </head>
     
    <body style="max-width:100%; margin-left: auto; margin-right: auto;">
 <%
            String id = request.getParameter("id");
            if (request.getParameter("id") == null) {
                response.sendRedirect("viewProducts_.jsp");
            }else {

            DB_Conn c = new DB_Conn();
            Connection con = c.getConnection();

            Statement st = con.createStatement();

    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs1 = st.executeQuery(getCategory);
            String getProductQuery = "SELECT * FROM  `products` p INNER JOIN  `images` i USING (  `product-name` ) WHERE  `product_id` ="+id+" GROUP BY  `product-name` ";
            ResultSet rs = st.executeQuery(getProductQuery);

            rs.next();
            //out.println(""+rs.getString("product-name"));

            String product_id = rs.getString("product_id");
            
            int product_hits = rs.getInt("hits");

            String product_name = rs.getString("product-name");

            String sub_category_name = rs.getString("sub-category-name");

            String category_name = rs.getString("category-name");

            String company_name = rs.getString("company-name");

            String price = rs.getString("price");

            String summary = rs.getString("summary");

            String image_name = rs.getString("image-name");

        %>
 
    
             <div><jsp:include page="topnavbars.jsp"></jsp:include></div> 
  
        <%
    Connection c3 = new DB_Conn().getConnection();
    Statement st3 = c3.createStatement();
    String getCategory3 = "SELECT * FROM  `category`  ";
    
    ResultSet rs3 = st3.executeQuery(getCategory);
    
%>

            <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->           
<div id="leftside">
                <div>
                    <ul id="leftsideNav" style="float: left; margin-left: 3%;">
                        <li><a href="#"><strong>Kategorien</strong></a></li>
                        
                        <%
                        while (rs3.next()){
                            String category = rs3.getString ("category_name");
                            %>
                            <li><a href="viewProducts_.jsp"><%= category %></a></li>
                        <%
                        }
                        %>
                      
                    </ul>
        </div>
                      
         <div class="header_bottom_right">					 
					 	 

            <div class="grid_16" id="productStrip" style="float: left; margin-top: 5%; margin-right: 3%">
                <div class="ProductHeading">
                    <div class="grid_16" style="">
                        <h2 class="heading" style=" font-weight: bold; margin-left: 5%"><%= product_name%></h2><br/>
                        <img class="BigProductBox" style="width: 40%; float: left;" alt="<%= product_name %>" src="<%= image_name%>" /> 
  <h5 style="font-weight: bold; font-size: 20px">Preis: <span class="BigRed"><%= price%> Euro</span></h5>
                        <a href="addToCart.jsp?id=<%= product_id %>">
                            
                             <input  type="submit" id="greenBtn"  value="in den Warenkorb"/>
                            
                            
                        <br/></a>
                         <br/>


                        <br/>
                        <br/>
                       
                        <br/>
                        <p><h1 style="font-weight: bold">Artikelbeschreibung: </h1><br/><h1> <%= product_name%></h1><br/>
                            <p><h1>Hersteller: <%= company_name%></h1><br/>
                            <%= summary%>
   
                        <div class="clear"></div>
                  
                    </div>
                </div>
</div>
              
                        <%
                            if (session.getAttribute("admin") != null){
                            %>
                         <a href="admin_manageProduct.jsp?pid=<%= product_id %>">
                            <div class="grid_1" id="buy">
                                Bearbeiten
                            </div>
                        </a>
                        <%
                            }
                        %>

       
                       
                </div>
</div>
                        
                
                        
                        <%
                            String getImages = "SELECT  `image-name` FROM  `products` INNER JOIN  `images` USING (  `product-name` ) WHERE  `product_id` =" + product_id + "";
                            
                            rs.close();

                            rs = st.executeQuery(getImages);
                            int img_number = 1;
                            rs.next();
                            // GET THE REST OF THE PRODUCT IMAGES
                            while (rs.next()) {

                                 image_name = rs.getString("image-name");

                        %>
 
                           
                        <a href="<%= image_name %>" rel="lightbox[product]" title="Click on the right side of the image to move forward.">
                            <img class="SmallProductBox" alt="<%= image_name %> 1 of 8 thumb" src="<%= image_name %>" />
                        </a>
                        
                        <%                            
                            }
                            st.execute("UPDATE  `products` "
+" SET  `hits` =  '"+(product_hits+1)+"' "
+" WHERE  `products`.`product_id` ="+product_id+" ");
                            st.close();
                        }
                        %>
<!--
                        <a href="images/productImages/q1.jpeg" rel="lightbox[product]" title="Click on the right side of the image to move forward.">
                            <img class="SmallProductBox" alt="Assassins Creed 1 of 8 thumb" src="images/productImages/t1.jpeg" />
                        </a>
-->
                    </div>
                    <div class="clear"></div>
                    
                </div>

           
</div>
<div class="clear"></div>
        <div style="border: solid 5px white; max-width: 70%; margin: auto"> 
     
     
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        <jsp:include page="includesPage/mainHeaders/index_latestAddedProducts.jsp"></jsp:include>
           
        <!--The Middle Content Div Closing -->
    </div>
        <div class="clear"></div>

                       <div><jsp:include page="footer.jsp"></jsp:include></div>
				



    </body>
</html>
