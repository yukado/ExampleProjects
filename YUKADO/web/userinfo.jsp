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
         <%@include file="includesPage/_stylesheets.jsp" %>
        <link rel="shortcut icon" href="images/logo/ico.png"/>
        
         <link rel="stylesheet" href="css/styles.css"/>
 <link rel="stylesheet" href="css/960_16.css"/>
        <link rel="stylesheet" href="css/slider.css"  />
<link rel="shortcut icon" href="../favicon.ico"> 
        
        <script type="text/javascript" src="js/jquery.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/startstop-slider.js"></script>
<script type="text/javascript" src="js/myScript.js"></script>
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>

</head>

<body style="max-width:100%; margin-left: auto; margin-right: auto;">

<%
    if (session.getAttribute("admin") != null){
        %>
        <script type="text/javascript">
    $(document).ready(function (){
        //alert ("fdvgf");
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                //$('#loadSearches').load('findProductLoad.jsp', {searchbar:searchbar});
                            
                $('#loadSearches').css('display');
                $.get('findProductLoad.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    } else {
        %>
<script type="text/javascript">
    $(document).ready(function (){
        //alert ("fdvgf");
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                //$('#loadSearches').load('findProductLoad.jsp', {searchbar:searchbar});
                            
                $('#loadSearches').css('display');
                $.get('findProductLoad_1.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    }
%>
<div class="wrap" style="width: 95%;" >
		<div class="header_top">
			<div class="logo" style="margin-right: 2%; margin-top: 5px; width: 400px">
				<a href="index.jsp"><img src="images/icon.png" alt="" /></a>
			</div>
<input type="text" id="search" class="search_box" style="margin-top: 35px; background:url(images/search.png)no-repeat; background-position-x: 100%; background-position-y: 50%; background-size: 12%; width: 300px; height: 25px;" placeholder="Suchen ..."/>
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
            </div>            
            </div> 
            
    <div class="container_16" id="loadSearches" ></div>
			  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>

                
<div class="header_bottom" style="width: 100%; float:left;  margin-top:0; margin-right: 0px">
	     	<div class="menu" style=" width: 100%" >
                    
                    <ul>
                        <li><div class="categories" style="float: left">
                        <h3 style="float: left;	font-size:1.4em; color: -webkit-linear-gradient(#ff3399, #b30056); -webkit-background-clip: text; -webkit-text-fill-color: #ff66b3; font-weight: bold; height: 23px; padding:0 10px; background:  #293133; text-align: center; width: 220px; padding-top: 13px; text-transform:uppercase; margin-left: 30px; font-family: 'ambleregular';">Kategorien</h3>
                    </div></li>
			    	<li class="active"><a href="index.jsp">Home</a></li>
			    	<li><a href="viewProducts_.jsp">Artikel</a></li>
			    	<li><a href="http://stores.ebay.de/MyComShop24">Ebay-Shop</a></li>
			    	
			    	<div class="clear"></div>
     			</ul>
	     	</div>
    
    
            <div class="grid_6" id="top">
               
            </div>
    </div>

<div class="header_slide">
			<div class="header_bottom_left">				
                            <div class="navigation" style="position: relative; margin: -36px 0 0 27px;">
                                    <ul class="mainmenu">
                                        <li><h3 style="float: left; font-size:1.7em;
	 color: -webkit-linear-gradient(#ff3399, #b30056);
  -webkit-background-clip: text;
  -webkit-text-fill-color: #ff66b3;
         font-weight: bold;
         height: 23px;
	padding: 10px 20px  0 10px;
	  background:  #293133;
          text-align: center;
        
            width: 172px;
   
	text-transform:uppercase;
        
       
  
  font-family: 'ambleregular';">Kategorien</h3></li>
                                        
     <li2><a1 href="addProductFilters.jsp?cat=Handys, Smartwatches, Kommunikation & Zubehör">hallo</a1></li2>
     <li><a href="addProductFilters.jsp?cat=Handys, Smartwatches, Kommunikation & Zubehör">Handys, Smartwatches, Kommunikation & Zubehör</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat=Handy-Taschen & -Schutzhüllen">Handy-Taschen & -Schutzhüllen</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy-Ladegeräte & -Dockingstationen">Handy-Ersatzteile</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy-Akkus">Handy-Akkus</a></li>
        <li><a href="addProductFilters.jsp?scat=Handys ohne Vertrag">Handys ohne Vertrag</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy-Displayschutzfolien">Handy-Displayschutzfolien</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy-Lautsprecher & -Soundsysteme">Handy-Lautsprecher & -Soundsysteme</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy- & PDA- Zubehör">Handy- & PDA- Zubehör</a></li>
        <li><a href="addProductFilters.jsp?scat=Handy-Ladegeräte & -Dockingstationen">Handy-Ladegeräte & -Dockingstationen</a></li>
    </ul>
                                    </li>
        <li><a href="addProductFilters.jsp?cat=">Computer, Tablets & Netzwerk</a>
      <ul class="submenu">
        
        <li><a href="addProductFilters.jsp?scat=Tonerkassetten für Computer-Drucker">Tonerkassetten für Computer-Drucker</a></li>
        <li><a href="addProductFilters.jsp?scat=Sonstige Computer-Komponenten & -Teile">Sonstige Computer-Komponenten & -Teile</a></li>
        <li><a href="addProductFilters.jsp?scat=Ethernetkabel (RJ-45/8P8C)">Ethernetkabel (RJ-45/8P8C)</a></li>
        <li><a href="addProductFilters.jsp?scat=USB-Kabel, -Hubs & -Adapter">USB-Kabel, -Hubs & -Adapter</a></li>
        <li><a href="addProductFilters.jsp?scat=Computer-Monitor- & AV-Kabel & -adapter">Computer-Monitor- & AV-Kabel & -adapter</a></li>
        <li><a href="addProductFilters.jsp?scat=USB-WLAN-Adapter & -Dongles">USB-WLAN-Adapter & -Dongles</a></li>
        <li><a href="addProductFilters.jsp?scat=Sonstige Computer-Netzwerkkabel & -Adapter">Sonstige Computer-Netzwerkkabel & -Adapter</a></li>
        <li><a href="addProductFilters.jsp?scat=Tintenpatronen für Computer-Drucke">Tintenpatronen für Computer-Drucker</a></li>
      </ul>
          </li>
       <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Uhren & Schmuck</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat=Sonstige Halsketten & Anhänger aus Echtschmuck">Sonstige Halsketten & Anhänger aus Echtschmuck</a></li>
        <li><a href="addProductFilters.jsp?scat=Sonstige Ringe aus Echtschmuck">Sonstige Ringe aus Echtschmuck</a></li>
        <li><a href="addProductFilters.jsp?scat=Sonstige Armbänder aus Echtschmuck">Sonstige Armbänder aus Echtschmuck</a></li>
        <li><a href="addProductFilters.jsp?scat=Ringe mit echten Edelsteinen">Ringe mit echten Edelsteinen</a></li>
        <li><a href="addProductFilters.jsp?scat=Armbanduhren">Armbanduhren</a></li>
        <li><a href="addProductFilters.jsp?scat=Echtschmuck">Echtschmuck</a></li>
    
        
      </ul>
            </li>
        <li><a href="addProductFilters.jsp?cat=Kleidung & Accessoires">Kleidung & Accessoires</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat=Damen-Sonnenbrillen">Damen-Sonnenbrillen</a></li>
        <li><a href="addProductFilters.jsp?scat=Damen-Halbschuhe & -Ballerinas">Damen-Halbschuhe & -Ballerinas</a></li>
        <li><a href="addProductFilters.jsp?scat=Herren-Turnschuhe & -Sneakers">Herren-Turnschuhe & -Sneakers</a></li>
        <li><a href="addProductFilters.jsp?scat=Damen-Pumps">Damen-Pumps</a></li>
        <li><a href="addProductFilters.jsp?scat=Herren-Sonnenbrillen">Herren-Sonnenbrillen</a></li>
        <li><a href="addProductFilters.jsp?scat=Herrenstiefel & -Boots">Herrenstiefel & -Boots</a></li>
        <li><a href="addProductFilters.jsp?scat=Damen-Turnschuhe & -Sneakers">Damen-Turnschuhe & -Sneakers</a></li>
</ul>
     </li>
     <li><a href="addProductFilters.jsp?cat=Büro & Schreibwaren">Büro & Schreibwaren</a></li>
</ul>
                                  <h3 style="font-weight: bold; font-size: 16px; margin-left: 2%; margin-top: 15px">Angebot der Woche!</h3>
                                  <a href="index.jsp"><img src="images/artikel_neu/single_neu.jpg" style="width: 250px; margin-left: 2%; margin-top: 10px"/></a>
				</div>
                                  
	  	     </div>
    <div class="header_bottom_right">					 
	<div class="slider" style="margin-right: 50px; margin-left: -75px;">					     
		<div id="slider" style="height: 500px">
            <div class="grid_13 push_3" id="whiteBox" style="width: 100%">
                <div  class="grid_13" style="width: 100%">
                    <h1  style ="text-align: center; padding: 10px 0px 0px 0px;">Hallo <%= printName %></h1>  
                    <p  style ="text-align: center;"> 
                       Bitte ALLES richtig ausfüllen! 
                    </p>
                </div>
            </div>
                
            
                <div id="whiteBox" class="grid_13" style="width: 100%;">
                    
                 <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px; width: 100%" class="grid_12 MyOrders">
                        
                     <h1 style ="padding: 10px 0px 10px 0px;">Meine Bestellungen</h1>  
                    
                        <div id="CartTable" style=" width:100%" class="grid_12">
                            <div class="grid_1">
                                         <h3>Bestell Nr.</h3>
                                    </div> 
                                    <div class="grid_4" style="margin-left: 25%">
                                                Artikelbezeichnung 
                                            </div>
                            <div class="grid_4" style="margin-left: 15%">
                                            <div class="grid_2">
                                                Preis x Menge
                                            </div>
                                      
                                   
                            </div>
                     </div>
                    </div>
                                    <div class="clear"></div>
                                    
                                    <%
                                        /*
SELECT  `sales_id` ,  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` 
FROM  `order` o
INNER JOIN  `sales` s
USING (  `order_id` ) 
WHERE o.`user_id` =4
                                    */
                                    String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` "
                                                +" FROM  `order` o "
                                                +" INNER JOIN  `sales` s "
                                                +" USING (  `order_id` ) "
                                                +" WHERE o.`user_id` = "+uid+" "
                                                + " ORDER BY `order_id` DESC ";
                                    
                                    Connection c = new DB_Conn().getConnection();
                                    
                                    PreparedStatement psmt = 
                                            c.prepareStatement(sql);
                                    
                                    ResultSet rs = psmt.executeQuery();
                                    
                                    int oldOrder = 0;
                                    int newOrder;
                                    
                                    String product_name;
                                    double product_price;
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
                                                                <%= product_name %>
                                                            </div>
                                                            <div class="grid_2">
                                                                Euro:  <%= product_price %> x<%= product_quantity %>
                                                            </div>
                                                    </div>
                                                  
                                                </div>
                                            </div>

                                            <%
                                        }else {
                                            // Draw New Order Type I order Div
                                            %>

                                            <!-- Type I Order -->
                                            <div class="grid_12"  style="border-top: 2px #444 solid;">
                                                <div  class="grid_1">
                                                    <a class="blue" href="showMyBill.jsp?oid=<%= newOrder %>"><%= billNo %></a>
                                                </div>
                                                <div class="grid_7" style="margin-left: 25%; height: 80px; width: 250px">
                                                        <div class="grid_4">
                                                            <%= product_name %> 
                                                        </div>
                                                        
                                                </div>
                                               <div class="grid_2" style="margin-left: 7%;">
                                                            <%= product_price %>0 Euro x<%= product_quantity %>
                                                        </div>
                                            </div>
                                            <div class="clear"></div>

                                            <%
                                        }
                                        oldOrder = newOrder;
                                    }
                                    
                                    %>
                                    
                                    
                                    <!-- Type I Order -->
                                  <!--   <div class="grid_12"  style="border-top: 2px #444 solid;">
                                        <div  class="grid_1">
                                             124
                                        </div>  
                                        <div class="grid_7">
                                                <div class="grid_4 ">
                                                    Assassins Creed II 
                                                </div>
                                                <div class="grid_2">
                                                    Rs. 98205689 x5
                                                </div>
                                        </div>
                                        <div class="grid_3">
                                            12-15-2003 : 15:06
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                    -->
                                    
                                    <!-- Type II Order -->
                                  <!--   <div class="grid_12">
                                        <div class="push_1">
                                            <div class="grid_7">
                                                    <div class="grid_4 ">
                                                        Assassins Creed II 
                                                    </div>
                                                    <div class="grid_2">
                                                        Rs. 999 x1
                                                    </div>
                                            </div>
                                            <div class="grid_3">
                                                12-15-2003 : 15:06
                                            </div>
                                        </div>
                                    </div>
                                     -->
                           </div>          
                                    
                        </div>
                 </div>
                 <div class="clear"></div>
                    <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px; width: 100%; float: left; margin-left: -60px" class="grid_9 push_1 Account">
                        <h1 style ="padding: 10px 0px 10px 0px;">Benutzer Profil</h1>  
                    
                        <%
                            if (User.getUsername() == null) {
                                %>
                        <form method="post" action="addUserDetalsServlet">
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
                                Adresse
                            </div>                                                      
                            <div class="grid_5">
                             <textarea name="address" required></textarea>
                            </div>
                            <div class="clear"></div><br/>
                            
                            
                            <input type="submit" id="greenBtn" value="Speichern"  style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;"/>
                            </div>
                            
                        </form>
                            <%
                            }else {
                                       %>
                      <form method="post" action="addUserDetalsServlet">
                            <div class="grid_3">
                                Name
                            </div>
                            <div class="grid_5">
                                <input type="text" name="username" value="<%= User.getUsername()%>" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Anrede
                            </div>
                            <div class="grid_5">
                                <select name="gender" required>

                                    <%
                                        if (User.getGender().equals("male")) {
                                    %>
                                    <option value="male" selected>Herr</option>
                                    <option value="female">Frau</option>
                                    <%        } else {
                                    %>
                                    <option value="male">Herr</option>
                                    <option value="female" selected >Frau</option>

                                    <%                            }
                                    %>
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
                                <input type="text" name="mobileNum"  value="<%= User.getMobileNum()%>" required/>
                            </div>
                            <div class="clear"></div><br/>
                           
                            <div class="grid_3">
                                Adresse
                            </div>                                                      
                            <div class="grid_5">
                                  <textarea name="address" required><%= User.getAddress()%></textarea>
                                <div class="clear"></div><br/>
                                <input type="submit" id="greenBtn" value="Speichern" style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;"/>
                                <div class="clear"></div><br/>       
                                                           
                            </div>   
                            <div class="clear"></div><br/>
                        </form>
                                
     
                        <% 
                            }
                        %>
                        
                    </div>
                 <div class="clear"></div>
                 
                 
                 
                 
                 
                 <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;  margin-left: -7%; width: 100%" class="grid_9 push_1 Settings">
                        
                     <h1 style ="padding: 10px 0px 10px 0px;">Einstellungen</h1>  
                    
                        <form method="post" action="changeMyPass">
                            <div class="grid_3">
                                Email 
                            </div>
                            <div class="grid_5">
                                <input type="text" name="email" value="<%= User.getUserEmail() %>" disabled/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Passwort
                            </div>
                            <div class="grid_5">
                                <input type="password" name="pass" /><br/><br/> 
                                <input id="greenBtn" type="submit" value="Passwort ändern" style="background: #b30056; margin-left: 20px; border-radius: 7px; color: white; font-size: 22px; border: 3px solid #b30056;"/>
                            </div>
                            <div class="clear"></div><br/>
                        </form>
                    </div>
                 <div class="clear"></div>
                </div>
        </div>
        </div>
        <%
        //This is else closing of the top if checking of User Logged In...
        }        
%>

         <div class="clear"></div>
		
    <div class="container_16">
        <div id="contents">
 
      <div id="middle" class="grid_13" style="max-width: 100%;">
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
							      
							      <div class="clear"></div>
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
    </body>
</html>
