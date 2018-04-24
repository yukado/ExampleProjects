<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.util.ArrayList"%>
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
 
            
   
     
                
                <a href="index.jsp"><img src="images/icon.png" alt="" style="float: left;" /></a>
<div class="header_bottom" style="float:left; max-height: 6%; margin-top: 2%; max-width: 70%">
	     	<div class="menu" style="max-width: 100%; " >
                    
                    <ul>
                                <li class="active"><a href="index.jsp">Home</a></li>
			    	<li><a href="viewProducts_.jsp">Artikel</a></li>
			    	<li><a href="http://stores.ebay.de/MyComShop24">Ebay-Shop</a></li>
	</ul>
                </div>
    
    </div>
                <input type="text" id="search" class="search_box" style=" background:url(images/search.png)no-repeat; background-position-x: 100%; background-position-y: 50%; background-size: 12%; max-width: 100%; height: 25px; margin-top: 2%" placeholder="Suchen ..."/>
   
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
 <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
                        

    
    <div class="slider-wrapper">
    <div id="slider" class="nivoSlider" style=" ">
                <img src="images/toystory.jpg" data-thumb="images/toystory.jpg" alt="" />
                <img src="images/up.jpg" data-thumb="images/up.jpg" alt="" />
                <img src="images/walle.jpg" data-thumb="images/walle.jpg" alt="" />
                <img src="images/nemo.jpg" data-thumb="images/nemo.jpg" alt=""/>
            
    </div>
        </div>
                

<div class="navigation" style="position: absolut; max-width: 300px; float: left">
            
           <ul class="mainmenu">
               <li></li>
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
                                  <h3 style="font-weight: bold; font-size: 16px; margin-left: 2%; margin-top: 15px; max-width: 250px">Angebot der Woche!</h3>
                                  <a href="index.jsp"><img src="images/artikel_neu/single_neu.jpg" style="max-width: 250px; margin-left: 2%; margin-top: 10px"/></a>
				</div>