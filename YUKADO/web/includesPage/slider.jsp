<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<head>
           <link rel="stylesheet" type="text/css" href="css/window.slider.css"/>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
      <script src="js/window.slider.js"></script>
      <script type="text/javascript">
          $(document).ready(function() {
            $('#slider-1').windowSlider();
          }); 
      </script>
</head>
 <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->


<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
            
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
        

       
 

                        <div id="slider-1" class="window-slider">
        
          <div class="tl-window">
            <img src="https://www.zhakaash.com/media/wysiwyg/zhakaash-ultimate-electronics-sale-banner.jpg">
            <img src="https://static.giga.de/wp-content/uploads/2016/11/samsung-logo-rcm992x500.jpg">
          </div>
          
          <!-- TOP RIGHT SLIDER -->
          <div class="tr-window">
            <img src="https://media1.tenor.com/images/79889041444ea362f782fd340310dc92/tenor.gif?itemid=3400962">
            <img src="https://media.giphy.com/media/CzlBj3oer8xKE/giphy.gif">
          </div>
          
          <!-- BOTTOM LEFT SLIDER -->
          <div class="bl-window">
            <img src="http://www.cellunlocker.net/blog/wp-content/uploads/2017/08/ezgif.com-optimize-1.gif">
            <img src="http://hdwallpaper2013.com/wp-content/uploads/2013/02/Logo-Apple-HD-Wallpaper.jpg">
          </div>
          
          <!-- BOTTOM RIGHT SLIDER -->
          <div class="br-window">
            <img src="https://media.giphy.com/media/26n79t82lmj989iAE/source.gif">
            <img src="https://pre00.deviantart.net/1b2a/th/pre/f/2016/050/1/5/huawei_logo_wallpaper_06_by_leg_amk_end-d9sbclm.jpg">
          </div>
      </div>
                         </div>
                        </div>
<div class="clear"></div>