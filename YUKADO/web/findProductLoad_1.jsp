<%-- 
    Document   : findProductLoad
    Created on : 26 Nov, 2016, 12:09:12 AM
    Author     : yukado
--%>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%
            String sqlSearch = "";
            if (request.getParameter("searchbar") != null){
                String searchText = request.getParameter("searchbar");
                String searches [] = searchText.split(" ");
                
                if (searchText.length() >= 0){
                    
                sqlSearch = "SELECT * FROM  `products` p "
                            + "INNER JOIN  `images` i "
                            + "USING (  `product-name` ) WHERE ";
                //out.println (""+sqlSearch);
                for (int i=0; i<searches.length; i++){
                    if (searches[i].trim().length() > 2){
                        sqlSearch+=" `tags` LIKE '%"+searches[i]+"%' ";
                        //out.println (" `tags` LIKE '%"+searches[i]+"%' ");
                        if (i != searches.length-1){
                            sqlSearch+=" AND ";
                            //out.println (" AND ");
                        }
                    }
                }
                //out.println (" GROUP BY  `product-name` ");
                sqlSearch+=" AND `product_qty` > 5 ";
                
                sqlSearch+=" GROUP BY  `product-name` ";
                
                sqlSearch+=" ORDER BY  `hits` DESC ";
                
                %>
        
            <!-- Middle -->
            <div class="container_16">
            <div class="grid_15 push_1">
                <div class="grid_14" id="whiteBox">
                    
                        <%
                        
                            //String sql = "SELECT * FROM  `products` p "
                             //           + "INNER JOIN  `images` i "
                             //           + "USING (  `product-name` ) "
                              //          + "GROUP BY  `product-name` ";

                                DB_Conn con = new DB_Conn();
                                Connection c = con.getConnection();

                                Statement st = c.createStatement();
                                ResultSet rs = st.executeQuery(sqlSearch.toString());

                                while (rs.next()) {
                                    /*
product-name	product_id	sub-category-name	category-name	company-name	price	summary	image-id	image-name*/
                                    String product_id = rs.getString("product_id");

                                    String product_name = rs.getString("product-name");

                                    String sub_category_name = rs.getString("sub-category-name");

                                    String category_name = rs.getString("category-name");

                                    String company_name = rs.getString("company-name");

                                    String price = rs.getString("price");

                                    String summary = rs.getString("summary");
                                    
                                    String image_name = rs.getString("image-name");
/*
                                    out.println("<br/>"+product_id+
                                            "<br/>"+product_name+
                                            "<br/>"+sub_category_name+
                                            "<br/>"+category_name+
                                            "<br/>"+company_name+
                                            "<br/>"+price+
                                            "<br/>"+summary+
                                            "<br/>"+image_name);
                                    */
                        %>
                        <div class="clear"></div>
                        <div class="grid_2">
                            
                        </div>
                        <div class="grid_14" style="margin-left: 30%">
                            <div class="grid_10">
                                <p id="info"><a href="product.jsp?id=<%=product_id%>"><h3 style="font-weight: bold; font-size: 18px"><span class="blue"><%=product_name %></h3>Von: <%= company_name%></span></br></a><span class="red" style="font-weight: bold; font-size: 20px"><%= price %> Euro<a href="addToCart.jsp?id=<%= product_id %>" id="greenBtn" style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;"> in den Warenkorb</a></span></p>
                                <p style="float:  right; margin-top: 10px"></p><p>Lieferung in 3 Werktagen</p>
                            </div>
                            
                        </div>
                        <div class="clear"></div>

                        <%
                                }
                            rs.close();
                            st.close();
                            c.close();
                            
                        %>


                        <div class="clear"></div>
                </div></div>
            </div>
<%
            }
        %><%

        
                }
                %>