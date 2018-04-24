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
			    	<li class="active"><a href="index.jsp">Home</a></li>
			    	<li><a href="viewProducts_.jsp">Artikel</a></li>
			    	<li><a href="http://stores.ebay.de/MyComShop24">Ebay-Shop</a></li>
			    	
			    	<div class="clear"></div>
     			</ul>
	     	</div>
    
            <div class="grid_6" id="top">
               
            </div>
        </div>

    

        <%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
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
	
                                  
                             					 
	<div class="slider" style=" height: 770px; margin-left: 0; width: 90%">					     
            <div id="slider" style="height: 770px;">     
                      <div class="content" style=" margin-top: 2%;">
        <div class="section group" style="width:80%; ">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2>Kontaktieren Sie uns</h2>
					    <form method="post" action="contact-post.jsp">
					    	<div>
						    	<span><label>Name</label></span>
						    	<span><input name="userName" type="text" class="textbox" ></span>
						    </div>
						    <div>
						    	<span><label>E-Mail</label></span>
						    	<span><input name="userEmail" type="text" class="textbox"></span>
						    </div>
						
						    <div>
						    	<span><label>Anliegen</label></span>
						    	<span><textarea name="userMsg"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Senden"  class="myButton"></span>
						  </div>
					    </form>
				  </div>
  				</div>
				<div class="col span_1_of_3">
					<div class="contact_info">
    	 				<h3>Hier finden Sie uns: </h3>
					    	  <div class="map"><iframe width="500" height="350" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2559.465498776378!2d8.5936413152575!3d50.09629342070166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47bd0a39eefae361%3A0xaf107e131980e252!2sL%C3%A4rchenstra%C3%9Fe+99%2C+65933+Frankfurt+am+Main!5e0!3m2!1sde!2sde!4v1502745539972"  frameborder="0" style="border:0" allowfullscreen></iframe><br /><span style="font-size: 9px;"></span></div>
      			<div class="company_address">
				     	<h3>Adresse:</h3>
						    	<p>Inhaber: Farahnaz Tukhy,</p>
						   		<p>Lärchen Str.99,</p>
                                                                <p>65933 Frankfurt,</p>
						   		<p>Deutschland / Germany</p>
				   		<p>Phone:(+49) 69 93 99 80 60</p>
				   		
				 	 	<p>Email: <span>info@mycomshop24.de</span></p>
				   		
				   </div>
				 </div>

    </div>			  		
            </div>          
                   </div>               
   </div></div></div>
   
         <div class="container_16">
        <div id="contents">
 
            <!-- LeftSide -->

        <!-- Middle -->
        <div id="middle" class="grid_13" style="max-width: 100%; margin-top: 30px">
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        </div>
        <!--The Middle Content Div Closing -->
    
    <!--The Center Content Div Closing -->
        </div></div>

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
						
							
   	 					</div>
				</div>
			</div>			


    </div>
</div>

</body>
</html>



