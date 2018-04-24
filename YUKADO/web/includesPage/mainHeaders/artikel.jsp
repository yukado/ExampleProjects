<%-- 
    Document   : artikel
    Created on : 18.08.2017, 12:18:53
    Author     : Root
--%>

<%@page import="product.product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                         
                                 <%
                        String category, subcategory;
                        StringBuffer sql = new StringBuffer();
                        sql.append("SELECT * FROM  `products` p "
                                        + "INNER JOIN  `images` i "
                                        + "USING (  `product-name` ) ");
                        
                        category = "";
                        subcategory = "";
                        if(session.getAttribute("cat") != null ){
                            category = (String) session.getAttribute("cat");
                            ArrayList scat = product.getSubcategory(category);
                                
                                 
                            %>
                        <%
                            if (session.getAttribute("cat") != null){
                                category = (String)session.getAttribute("cat");
                                /*
WHERE  `category-name` =  'Games'
AND  `sub-category-name` =  'Action-Adventure-Game'
GROUP BY  `product-name` */
                                
                                sql.append(" WHERE  `category-name` =  '"+category+"' ");
                                %>
                                    <div class="grid_4 " style="margin-top:15px">
                                        <a id="greenBtn" href="removeProductFilter.jsp?cat=<%= category %>">Kategorie : <%= category %> / <%= subcategory %> [x]</a>
                                    </div>
                                    
                                <%
                                
                                %>

                                    <%
                                        if (session.getAttribute("scat") != null){
                                            subcategory = (String)session.getAttribute("scat");
                                            sql.append(" AND  `sub-category-name` =  '"+subcategory+"' ");
                                            %>
                                                <div class="grid_4 ">
                                                    <a id="greenBtn" href="removeProductFilter.jsp?scat=<%= subcategory %>">Sub-Kategorie : <%= subcategory %> [x]</a>
                                                </div>
                                                
                                            <%
                                        }
                                    %>
                                <%
                            }
                        %>
                        
                        <%
                            //String sql = "SELECT * FROM  `products` p "
                             //           + "INNER JOIN  `images` i "
                             //           + "USING (  `product-name` ) 
                             //             +`product_qty` > 0
                              //          + "GROUP BY  `product-name` ";

                        DB_Conn con = new DB_Conn();
                        Connection c = con.getConnection();
                        Statement st = c.createStatement();
                        ResultSet rs ;
                         if (sql.toString().equalsIgnoreCase("SELECT * FROM  `products` p "
                                                            + "INNER JOIN  `images` i "
                                                            + "USING (  `product-name` ) "
                                                            )){
                            
                            String newSQL  = "SELECT * FROM  `products` p "
                                            + "INNER JOIN  `images` i "
                                           + "USING (  `product-name` ) "
                                            + " WHERE `product_qty` > 0 "
                                          +" GROUP BY  `product-name` "
                                         + " ORDER BY  `hits` DESC  ";
                            //out.print("Equals "+sql.toString() +" "+newSQL);
                         rs= st.executeQuery(newSQL);
                         }else { 
                            
                        sql.append(" AND `product_qty` > 0  "
                                + " GROUP BY  `product-name` "
                                + " ORDER BY  `hits` DESC  ");
                            //out.print("Not Equals "+sql.toString());
                            rs= st.executeQuery(sql.toString());                        
                         }
                        

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

                              
     
          <div id="productList"  style="float: left; margin-top: 10px;">
                            <ul1><li1><a href="product.jsp?id=<%=product_id%>"><img src="<%= image_name %>" style=" max-width: 50%; margin-left: 0" /></a><br/>
                            <p id="info" style="float: left; margin-left: 0"><a href="product.jsp?id=<%=product_id%>"><h3 style="font-weight: bold; width: 200px"><span class="blue"><%=product_name %><br/><br/></span><span class="red"><%= price %> Euro</span></h3><br/></a><a href="addToCart.jsp?id=<%= product_id %>" id="greenBtn"  style="color:#ffffff; text-shadow: 0 1px 0 white; border-radius:5px; background: -webkit-linear-gradient(top, #808080, #333333); background: -moz-linear-gradient(top, #808080, #333333); text-align:center;">In den Warenkorb</a></a></p></li2></ul1>
                        
                            
              </div>
                       </div>
 <div class="clear"></div>
                      
                         
                            
                        
                        
                        
                        <%
                                }
                            rs.close();
                            st.close();
                            c.close();
                        %>

              
