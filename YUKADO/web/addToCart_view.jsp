<%-- 
    Document   : addToCart
    Created on : 16 Nov, 2016, 1:42:23 AM
    Author     : yukado
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MyCom24</title>
        <!-- Default Stylesheets -->
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


		<script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>
		
		


</head>
    <body style="max-width:100%; margin-left: auto; margin-right: auto;">
        <jsp:useBean id="cart" scope="session" class="cart.cart"></jsp:useBean>

 
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
				<a href="index.html"><img src="images/icon.png" alt="" /></a>
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
                        <h3 style="float: left;	font-size:1.4em; color: -webkit-linear-gradient(#ff3399, #b30056); -webkit-background-clip: text; -webkit-text-fill-color: #ff66b3; font-weight: bold; height: 23px; padding:0 10px; background:  #293133; text-align: center; width: 176px; padding-top: 13px; text-transform:uppercase; margin-left: 30px; font-family: 'ambleregular';">Kategorien</h3>
                    </div></li>
			    	<li class="active"><a href="index.html">Home</a></li>
			    	<li><a href="viewProducts_.jsp">Artikel</a></li>
			    	<li><a href="delivery.html">Ebay-Shop</a></li>
			    	
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
                                    
    
     <li2><a1 href="addProductFilters.jsp?cat=Auto + Motorrad">hallo</a1></li2>
     <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Handys, Smartwatches, Kommunikation & Zubehör</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat=Handy-Taschen & -Schutzhüllen">Handy-Taschen & -Schutzhüllen</a></li>
        <li><a href="">Handy-Ersatzteile</a></li>
        <li><a href="">Handy-Akkus</a></li>
        <li><a href="">Handys ohne Vertrag</a></li>
        <li><a href="">Handy-Displayschutzfolien</a></li>
        <li><a href="">Handy-Lautsprecher & -Soundsysteme</a></li>
        <li><a href="">Handy- & PDA- Zubehör</a></li>
        <li><a href="">Handy-Ladegeräte & -Dockingstationen</a></li>
        <li><a href="">Handy-Ladegeräte & -Dockingstationenn</a></li>
      </ul>
                                    </li>
        <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Computer, Tablets & Netzwerk</a>
      <ul class="submenu">
        <li><a href="">Tonerkassetten für Computer-Drucker</a></li>
        <li><a href="">Sonstige Computer-Komponenten & -Teile</a></li>
        <li><a href="">Ethernetkabel (RJ-45/8P8C)</a></li>
        <li><a href="">USB-Kabel, -Hubs & -Adapter</a></li>
        <li><a href="">Computer-Monitor- & AV-Kabel & -adapter</a></li>
        <li><a href="">USB-WLAN-Adapter & -Dongles</a></li>
        <li><a href="">Sonstige Computer-Netzwerkkabel & -Adapter</a></li>
        <li><a href="">Tintenpatronen für Computer-Drucker</a></li>
      </ul>
          </li>
       <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Uhren & Schmuck</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat=">Sonstige Halsketten & Anhänger aus Echtschmuck</a></li>
        <li><a href="">Sonstige Ringe aus Echtschmuck</a></li>
        <li><a href="">Sonstige Armbänder aus Echtschmuck</a></li>
        <li><a href="">Ringe mit echten Edelsteinen</a></li>
        <li><a href="">Armbanduhren</a></li>
        <li><a href="">Echtschmuck</a></li>
        <li><a href="">Handy- & PDA- Zubehör</a></li>
        <li><a href="">Handy-Ladegeräte & -Dockingstationen</a></li>
        <li><a href="">Handy-Ladegeräte & -Dockingstationenn</a></li>
      </ul>
            </li>
        <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Kleidung & Accessoires</a>
      <ul class="submenu">
        <li><a href="addProductFilters.jsp?scat="> -Damen-Sonnenbrillen</a></li>
        <li><a href="">Damen-Halbschuhe & -Ballerinas</a></li>
        <li><a href="">Herren-Turnschuhe & -Sneakers</a></li>
        <li><a href="">Damen-Pumps</a></li>
        <li><a href="">Herren-Sonnenbrillen</a></li>
        <li><a href="">Herrenstiefel & -Boots</a></li>
        <li><a href="">Damen-Turnschuhe & -Sneakers</a></li>
</ul>
     </li>
     <li><a href="addProductFilters.jsp?cat=Handy + Kommunikation">Büro & Schreibwaren</a></li>
</ul>
        <h3 style="font-weight: bold; font-size: 16px; margin-left: 2%; margin-top: 15px">Angebot der Woche!</h3>
        <a href="index.jsp"><img src="images/artikel_neu/s4-l500.jpg" style="width: 250px; margin-left: 2%; margin-top: 10px"/></a>
				</div>
                                  
	  	     </div>
                                  
<div class="header_bottom_right">					 
		<div class="slider">					     
		<div id="slider">
        <div class="container_16">
            <div class="grid_16" id="whiteBox">
                <div class="grid_8 push_3" >
                    <h1 class="push_2" style="padding:10px 00px; font-weight: bold; font-size: 18px">Artikel im Warenkorb:</h1>

                    <%
                        user User = new user();
                        session.getAttribute("user");
                        //out.println(session.getAttribute("user"));
                        User = (user) session.getAttribute("user");
                        if (session.getAttribute("user") == null) {
                    %>
                    <h3 class="showForm" id="loginBtn" style="padding:10px 00px">Bitte zuerst anmelden...</h3>

                    <%                } else {
                        //out.println("login by " + User.getUserEmail());

                    %>
                   


                    <%
                    
                            //out.println("<br/>Total value price of the cart " + cart.getTotalPriceOfCart());
                            ArrayList<String> productNames = new ArrayList();
                            ArrayList<Double> productPrices = new ArrayList();
                            ArrayList<Integer> Qty = new ArrayList();
                            ArrayList<Integer> ids = new ArrayList();

                            productNames = cart.getProductNames();
                            productPrices = cart.getPrices();
                            Qty = cart.getQty();
                            ids = cart.getId();
                    %>


                    <div id="CartTable" style="padding:10px 00px" class="grid_11">
                        <div class="grid_5">
                            <h2>Artikelname</h2> 
                        </div>
                        <div class="grid_2">
                            <h2>Preis</h2>
                        </div>
                        <div class="grid_2">
                            <h2>Menge</h2>
                        </div>

                        <%
                            for (int i = 0; i < productNames.size(); i++) {
                        %>

                        <div class="grid_5">
                            <%=productNames.get(i)%>
                        </div>
                        <div class="grid_2">
                            Euro <%=productPrices.get(i)%>
                        </div>
                        <div class="grid_1">
                            x<%=Qty.get(i)%>
                        </div>
                        <div class="grid_2">
                            <strong>Gesamtpreis der Artikel im Korb: </strong>
                            <%= Math.ceil(Qty.get(i) * productPrices.get(i)) / 100 %> Euro 
                        </div>

                        <%
                            }
                            productNames.clear();
                            productPrices.clear();

                        %>
                        <br/>

                        
                        
                            <div class="grid_3" id="buy">
                                <a href="buyItems.jsp"><input type="button" value="Zahlen" style="color:#ffffff; text-shadow: 0 1px 0 white; padding:10px; border-radius:5px; background: -webkit-linear-gradient(top, #808080, #333333); background: -moz-linear-gradient(top, #808080, #333333); text-align:center; font-size: 18px; width: 120px"/></a>
                            </div>
                        
                        <a href="viewProducts_.jsp">
                            <div class="grid_3" id="greenBtn">
                               <input type="button" value="Shoppen" style="color:#ffffff; text-shadow: 0 1px 0 white; padding:10px; border-radius:5px; background: -webkit-linear-gradient(top, #808080, #333333); background: -moz-linear-gradient(top, #808080, #333333); text-align:center; font-size: 18px; width: 120px"/>
                            </div>
                        </a>
                    </div>
</div>
                    <br/>
                    <br/>
                    
                    
                    <br/>
                    <%
                            }
                    %>
                </div>
</div>
            </div>
     
                </div>
            </div>
     </div>
                 <div class="container_16">
        <div id="contents">
 
            <!-- LeftSide -->

        <!-- Middle -->
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
					<h4>Bankverbindung</h4>
						<ul>
							<li><a href="contact.jsp">IBAN: </a></li>
							
							<li><a href="contact.html">BIZ: </a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Kontakt</h4>
						<ul>
							<li><span> 069 / 93 99 80 60</span></li>
							<li><span>info@mycomshop24.de </span></li>
                                                        <li><a href="contact-support.jsp">Kontaktseite</a></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/logo/ebay-button.png" alt="" /></a></li>
							      
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>
              </div>
      </div>
    </body>
</html>
