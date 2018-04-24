<%-- 
    Document   : userinfo
    Created on : 18 Nov, 2016, 1:02:49 PM
    Author     : yukado
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page import="cart.cart"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyCom24</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
    
<%@page import="java.sql.*, database.*" %>
        <!-- Default Stylesheets -->
<%@include file="includesPage/_stylesheets.jsp" %>
     
    </head>
    <body style="max-width:100%; margin-left: auto; margin-right: auto;">
        
 <div><jsp:include page="topnavbars.jsp"></jsp:include></div>
 
          <%
    Connection c3 = new DB_Conn().getConnection();
    Statement st3 = c3.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
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
                         <script type="text/javascript">
            $(document).ready(function (){
                var MyOrders = $('#MyOrders');
                var MyAccount = $('#Account');
                var MySettings = $('#Settings');
                var MyUserInfo = $('#userInfo');
                
                var Orders = $('.MyOrders');
                var Account = $('.Account');
                var Settings = $('.Settings');
                
                MyOrders.click(function (){
                    Orders.slideDown(700);
                    Account.slideUp(700);
                    Settings.slideUp(700);
                });
                MyAccount.click(function (){
                    Orders.slideUp(700);
                    Account.slideDown(700);
                    Settings.slideUp(700);
                });
                MySettings.click(function (){
                    Orders.slideUp(700);
                    Account.slideUp(700);
                    Settings.slideDown(700);
                });
                MyUserInfo.click(function (){
                    Orders.slideDown(700);
                    Account.slideDown(700);
                    Settings.slideDown(700);
                });
                
            });
        </script>
      
        <%
            user User;
            String printName = null;
            if ((session.getAttribute("user") == null)) {
                response.sendRedirect("index.jsp");
            } else {
                User = (user) session.getAttribute("user");
                String email = User.getUserEmail();
                String userName = User.getUsername();
                int uid = User.getUserId();

                if (userName == null){
                    printName = email;
                }
                else {
                    printName = userName;
                }
           
        %>


	


     
	  	     

          <div class="container_16" style="max-width:80%; margin-top: 20px">
            <div id="leftside" class="grid_3">
               
                </div>
            <div class="grid_13 " id="whiteBox">
                <div  class="grid_13">
                    <h1  style ="text-align: center; padding: 10px 0px 0px 0px;">Hallo <%= printName %><br/><br/>
                Bitte Zahlungsart wählen!</h1> 
                    <p  style ="text-align: center; color: black"> 
                       BESTELL NR. und Zahlbetrag merken, weil es gleich bei Paypal angegeben werden muss!!!
                       Bei Überweisungen erhält man eine Email mit den nötigen Daten!
                    </p>
                </div>   
               
                   
                 <div  style ="text-align: center; border-top: 20px #444 solid;   margin-left: 120px" class="grid_12 MyOrders">
                        
          
                    
                        <div id="CartTable" style="padding:10px 00px; margin-left: 0" class="grid_12">
                                    
                                    
                                    <%
                                        /*
SELECT  `sales_id` ,  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` 
FROM  `order` o
INNER JOIN  `sales` s
USING (  `order_id` ) 
WHERE o.`user_id` =4
                                    */
      
  
        
             String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on`, `total_order_price` "
                +" FROM  `order` o "
                +" INNER JOIN  `sales` s "
                +" USING (  `order_id` ) "
                +" WHERE o.`user_id` = "+uid+" "
                + " ORDER BY `ordered_On` DESC LIMIT 1";
                                    
                                    Connection c = new DB_Conn().getConnection();
                                    
                                    PreparedStatement psmt = 
                                            c.prepareStatement(sql);
                                    
                                    ResultSet rs = psmt.executeQuery();
                                    
                                    int oldOrder = 0;
                                    int newOrder;
                                    
                                    String product_name;
                                    
                                    double product_price;
                                    double total;
                                    int product_quantity;
                                    Date sold_on_date;
                                    Time sold_on_time;
                                    

                                    
                                    while (rs.next()){
                                        newOrder = rs.getInt("order_id");
                                        product_name = rs.getString("product_name");
                                        product_price = rs.getDouble("product_price");
                                        product_quantity = rs.getInt("product_quantity");
                                        sold_on_time = rs.getTime("sold_on");
                                        sold_on_date = rs.getDate("sold_on");
                                        String orderDateArr [] = sold_on_date.toString().split("-");
                                        total = rs.getDouble("total_order_price");
                                       
                                        String billNo = "";
                                        
                                        
                                        for (int i= orderDateArr.length-1; i>= 1; i--){
                                            billNo += orderDateArr[i];
                                        }
                                        billNo+= newOrder;
                                        if (oldOrder == newOrder){
                                            // Dont Draw border Type II order Div
                                            
                                            %>

                                            <!-- Type II Order -->
                                            <div class="grid_12">
                                                <div class="push_1">
                                                    <div class="grid_7">
                                                            <div class="grid_4 ">
                                                                <a href="product.jsp?id="></a>
                                                             
                                                            </div>
                                                            <div class="grid_2">
                                                                Euro:  <%= total %>
                                                            </div>
                                                    </div>
                                                 
                                            </div>
                                                     </div>          
                                            <%
                                        }else {
                                            // Draw New Order Type I order Div
                                                 User = (user) session.getAttribute("user");
 %>

                                            <!-- Type I Order -->
                                           
                                                <div  class="grid_1" style="margin-left: 15px">
                                                    <a style="font-size: 22px; " class="blue" href="showMyBill.jsp?oid=<%= billNo %>">Bestellnummer:<br/> <%= billNo %></a><br/><br/><br/>
                                                    <a style="font-size: 22px; " class="blue">Gesamtbetrag:<br/>  <%= total %>0 Euro</a>
                                                </div><br/>
                                                
                                                
                                                 <form method = post action="kaufServlet">
                                                     <input type=text name="betrag" hidden value="<%= total %>">
                                                     <input type=text name="order" hidden value="<%= billNo %>">
                                              <input  style=" font-size: 18px; color: black" id=greenBtn type="submit" value="Überweisung">
                                                </form><br/> 
                                                
                                               
                                                
                                                <form class="form" action="ExpressCheckout" method="POST" style="float: right; margin-right: 27%">
                            
                        <table >
                        
                        <tr><img src="" width="0" height="0"/></tr>
                        <tr><td><input type="hidden" name="L_PAYMENTREQUEST_0_NAME0" value="<%= product_name %>"></input></td></tr>
                        <tr><td><input type="hidden" name="L_PAYMENTREQUEST_0_NUMBER0" value="<%= billNo %>"></input></td></tr>
                        <tr><td><input type="hidden" name="L_PAYMENTREQUEST_0_DESC0" value="<%= product_name %>"></input></td></tr>
                        <tr><td><input type="hidden" name="L_PAYMENTREQUEST_0_QTY0" value="<%= product_quantity %>" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_ITEMAMT" value="<%= product_price %>" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_TAXAMT" value="0" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_SHIPPINGAMT" value="0" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_HANDLINGAMT" value="0" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_SHIPDISCAMT" value="0" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_INSURANCEAMT" value="0" readonly></input></td></tr>
                        <tr><td><input type="hidden" name="PAYMENTREQUEST_0_AMT" value="<%= total %>" readonly></input></td></tr>
                        <tr><td><%
						String path = request.getContextPath();
						String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
						%>
                        <input type="hidden" name="LOGOIMG" value="<%=basePath %>img/logo.jpg"></input></td></tr>
						<tr><td><input type="hidden" name="currencyCodeType" value="EUR" readonly></input></td><td>
						   
						<br></td></tr>
                        <tr><td><input type="hidden" name="paymentType" value="Sale">
                                  
                                  </input><br></td></tr>
                        <tr><td colspan='2' align=right><input type='image'src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/ppcredit-logo-large.png" alt="PayPal Credit"  /></td></tr>
                        </form>
                        </table>
                                         <%
                                        }
                                        oldOrder = newOrder;
                                    }
                                    
                                    %>
                                    
                                   </div> 
                        </div>
                                    </div>
           <div  style ="text-align: center; border-top: 20px #444 solid; margin-left: 120px; margin-top: 20%" class="grid_12 MyOrders"></div>                         
           </div>
              
                   
                 <div class="clear"></div>
                 </div>
                                     </div>
     
        <%
        //This is else closing of the top if checking of User Logged In...
        }        
        %></div>
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

