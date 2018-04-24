<%-- 
    Document   : _subCategoryList
    Created on : 15 Nov, 2016, 11:26:49 PM
    Author     : yukado
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
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
                            ArrayList subCat = product.getSubcategory(category);
                                
                            %>
                            <div>
                                <ul id="leftsideNav">
                                    <li><a href="#"><strong>Sub-Categories</strong></a></li>
                            <%
                            for (int i =0; i< subCat.size(); i++){
                                %>
                                <li><a href="addProductFilters.jsp?scat=<%= subCat.get(i) %>"><%= subCat.get(i) %></a></li>      
                                <%
                            } subCat.clear(); %>
                                </ul>
                            </div>
                       
                             <%
                            if (session.getAttribute("scat") != null){
                                subcategory = (String) session.getAttribute("scat");
                                
                            }
                        } else {
                            //Show Category
                            ArrayList Cat = product.getCategory();
                            %>
                            <div>
                                <ul id="leftsideNav">
                                    <li><a href="#"><strong>Categories</strong></a></li>
                            <%
                            for (int i =0; i< Cat.size(); i++){
                                %>
                                <li><a href="addProductFilters.jsp?cat=<%= Cat.get(i) %>"><%= Cat.get(i) %></a></li>      
                                <%
                            } Cat.clear();
                            %>
                                </ul>
                            </div>
                            <%
                        }
                    %>
                    <!--
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categories</strong></a></li>
                            <li><a href="#">Books</a></li>
                            <li><a href="#">Calculators</a></li>
                            <li><a href="#">Art Supplies</a></li>
                            <li><a href="#">Office Supplies</a></li>
                            <li><a href="#">School Supplies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Movies</a></li>
                        </ul>
                    </div>
                    
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Sub-Categories</strong></a></li>
                            <li><a href="#">Books</a></li>
                            <li><a href="#">Calculators</a></li>
                            <li><a href="#">Art Supplies</a></li>
                            <li><a href="#">Office Supplies</a></li>
                            <li><a href="#">School Supplies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Movies</a></li>
                        </ul>
                    </div>
                    
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Pricing</strong></a></li>
                            <li><a href="#">Low to High</a></li>
                            <li><a href="#">High to Low</a></li>
                        </ul>
                    </div>
                    -->

