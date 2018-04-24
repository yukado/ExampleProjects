<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>
        
        

</head>

<body style="max-width:100%; margin-left: auto; margin-right: auto;">



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
                
                                  
 <div class="header_bottom_right">					 
	<div class="slider">
            <div class="grid_6" id = "loginForm">
                <form method="POST" action="login"  name="loginForm">
                    <h3 style="font-weight: bold; font-size:20px; margin-top: 30px">Anmelden</h3>
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-weight:bold; text-align:left; padding:20px 0px; color:#FFF;">Anmelden...</strong></h1>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Anmelden" id="greenBtn" style="margin-top: 10px; color: black"  /><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_3" id = "RegisterForm">
                <form method="POST" action="register" name="registerForm">
                    <h3 style="font-weight: bold; font-size:20px; margin-top: 30px">Registrieren</h3>
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">Registrieren!!</strong></h1>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort wiederholen</label>
                            </td>
                            <td>
                                <input type="password" name="passAgain" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>

                            </td>
                            <td >
                                <input type="submit" value="Registrieren" id="greenBtn" style="margin-top: 10px; color: black" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
 </div>
	 </div>
<div class="clear"></div>
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




