<%-- 
    Document   : topnavbars
    Created on : 05.12.2017, 19:58:39
    Author     : Root
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>YUKADO.de</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>
        </head>

<body style="max-width:100%; margin-left: auto; margin-right: auto;">
   

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
 
            

     
                <div class="slider1">
                <a href="index.jsp"><img src="images/icon.png" alt="" style="float: left; margin-left: 2%; margin-top: -1%" /></a>
<div class="header_bottom" style="float:left; max-height: 6%; max-width: 70%; margin-left: 3%">
	     	<div class="menu" style="max-width: 100%; " >
                    
                    <ul>
                                <li><a href="index.jsp">Home</a></li>
			    	<li><a href="viewProducts_.jsp">Shop</a></li>
			    	<li><a href="http://stores.ebay.de/MyComShop24">Service</a></li>
                         
	</ul>
                </div>
    
    </div>
                
                <input type="text" id="search" class="search_box" style=" background:url(images/search.png)no-repeat; background-position-x: 100%; background-position-y: 50%; background-size: 12%; max-width: 100%; max-height: 23px; margin-top: 1%; margin-left: 2%" placeholder="Suchen ..."/>
<a  href="login.jsp"  id="greenBtn" style="font-size: 17px; float: right; margin: 1%;">Anmelden</a>
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
                                       
                                      
          </div>
    

                     
                                      
                                      
                
           



          
   </body>
</html>              