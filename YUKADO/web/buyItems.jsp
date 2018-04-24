<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.user"%>
<%-- 
    Document   : buyItems
    Created on : 5 Nov, 2016, 12:23:58 PM
    Author     : yukado
--%>


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
		<div class="slider" style="margin-right: 50px; maxheight:300px;">					     
			<div id="slider">
        <div class="container_16" style="max-width: 100%;">
               <%
            user User;
            String email=null;
           if ((session.getAttribute("user")==null)){
               //response.sendRedirect("index.jsp");
           }else {
               User = (user)session.getAttribute("user");
               email = User.getUserEmail();
        %>
            
            <div class="grid_16" id="whiteBox" style="padding: 10px; ">
                <h2 style="font-weight: bold; font-size: 20px">Ist die Empfängeradresse richtig?</h2><br/>
                     <%
               if (User.getAddress() != null && User.getMobileNum() != null && User.getUserEmail() != null && User.getUsername() != null){
                   %>
                   <div class="grid_7 shippingAddress" id="useInfo" style="width: 100%">
                    
                        <div class="grid_1" >
                            
                        </div>
                        <div class="grid_5">
                            <span id ="userName">Name: <%= User.getUsername() %></span>
                        </div>
                        <div class="clear"></div>
                        <div class="grid_1" style="width: 100%">
                            
                        </div><br/>
                        <div class="grid_5">
                            <span id ="mobile">Telefon Nr.: <%= User.getMobileNum() %></span>
                        </div>
                        <div class="grid_1">
                            
                        </div>
                        <div class="grid_5">
                            <span style="width: 100%" id ="useAddress">Adresse: <%= User.getAddress() %></span> 
                        </div>
                        <div class="clear"></div>
                    </div>       
                <div class="grid_8" style=" width: 100%">
                    <br/>
                    <form method="post" action="buyItems">
                        <div class="grid_2">
                         
                        </div>
                        <div class="grid_5">
                            <input type="text" class="name"  name="name" required hidden value=<%= User.getUsername() %>/>
                        </div>
                        <div class="clear"></div><br/>
                        <div class="grid_2">
                            
                        </div>
                        <div class="grid_5">
                            <input type="text" class="mobile" maxlength="14" name="mobile" hidden value=<%=User.getMobileNum()%> />
                        </div>
                        <div class="grid_2">
                           
                        </div>
                        <div class="grid_5">
                            <input type="text" class="address"  name="address" hidden required value=<%=User.getAddress()%>/>    
                        </div>
                       
                        <div class="clear"></div><br/>
                        <div class="grid_5" >

                            <input  type="submit" id="greenBtn" style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;" value="Richtig"/>
                            <div class="clear"></div><br/>
                            <div class="clear"></div><br/>

                        </div>
                    </form>
                        <form action="userinfo.jsp">
                            <input  type="submit" id="greenBtn" value="Ändern" style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;"/>
                        </form>
                                                    
                </div>
               
                   <script type="text/javascript" src="js/jquery.js"></script>
                   <script type="text/javascript">
                       $(document).ready(function (){
                           $('#useInfo').click(function (){
                           var userName = $('#userName').text();
                           var mobile = $('#mobile').text();
                           var address = $('#useAddress').text();
                           
                            //alert (userName +" "+mobile+" "+address);
                               $('.name').attr('value', userName);
                               $('.address').attr('value', address);
                               $('.mobile').attr('value', mobile);
                           });
                       });
                   </script>
        <%
               }else {
               %>
                    <a href="userinfo.jsp">
                        <div class="grid_7 shippingAddress">
                            <h1> <strong></strong>Bitte persönliche Informationen angeben!</h1>
                        </div>
                    </a>
                <%
               }
          }
         %>
            </div>
        </div>
            </div> 
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
</div>
</div>
</body>
</html>
