<%-- 
    Document   : userinfo
    Created on : 18 Nov, 2016, 1:02:49 PM
    Author     : yukado
--%>

<%@page import="cart.cart"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24</title>
        <jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

        <%@page import="java.sql.*, database.*" %>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script src="js/myScript.js"></script>
        
        <style type="text/css">
            
            #leftside {
                cursor: pointer;
                position: fixed;
            }
        </style>
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
        
    </head>
    <body>
        
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

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <div class="container_16" style="max-width:70%">
            <div id="leftside" class="grid_3">
                
                </div>
            <div class="grid_13 push_3" id="whiteBox">
                <div  class="grid_13">
                    <h1  style ="text-align: center; padding: 10px 0px 0px 0px;">Hello <%= printName %></h1>  
                    <p  style ="text-align: center;"> 
                       Bitte ALLES richtig ausfüllen! 
                    </p>
                </div>
            </div>
                
            
                <div id="whiteBox" class="grid_13 push_3">
                    
                
                
                 <div class="clear"></div>
                    <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px; float: left; margin-left: -7%;" class="grid_9 push_1 Account">
                        <h1 style ="padding: 10px 0px 10px 0px;">Benutzer Profil</h1>  
                    
                       
                        <form method="post" action="addUserDetalsServlet1">
                            <div class="grid_3">
                                Name
                            </div>
                            <div class="grid_5">
                                <input type="text" name="username" maxlength="30" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Anrede
                            </div>
                            <div class="grid_5">
                                <select name="gender" required>
                                    <option value="male">Herr</option>
                                    <option value="female">Frau</option>
                                </select>
                            </div>
                             <div class="clear"></div><br/>
                            <div class="grid_3">
                                E-Mailadresse                               
                            </div>
                            <div class="grid_5">
                                <input type="text" name="email" value="<%= User.getUserEmail()%>" maxlength="25" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Telefon Nr.
                            </div>
                            <div class="grid_5">
                                <input type="text" name="mobileNum" maxlength="30" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Straße und Haus Nr.
                            </div>                                                      
                            <div class="grid_5">
                             <input type="text" name="strasse" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Postleitzahl und Ort
                            </div>                                                      
                            <div class="grid_5">
                             <input type="text" name="plz" required/>
                            </div>
                            <div class="clear"></div><br/>
                            
                            
                            <input type="submit" id="greenBtn" value="Speichern"/>
                            
                            
                        </form>
                      
 
                                
     
                    
                        
                    </div>
                 <div class="clear"></div>
        
                    </div>
              </div>
                       

        
        <%
        //This is else closing of the top if checking of User Logged In...
        }        
%>
        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
    </body>
</html>
