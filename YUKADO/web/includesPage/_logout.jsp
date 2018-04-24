
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<style type="text/css">
    .backRed {
        background: #CC0000;
        padding: 3px 7px;
        margin-right: 3px;
    }
</style>
<jsp:useBean id="cart" scope="session" class="cart.cart"  ></jsp:useBean>
<%
    ArrayList<Integer> Qty = new ArrayList();
    Qty = cart.getQty();
    int totalQty = 0;
    for (int i=0; i<Qty.size(); i++){
        totalQty += Qty.get(i);
    }
    
        
    
    user User = (user) session.getAttribute("user");
    String email = User.getUserEmail();
    String userName = User.getUsername();
    int uid = User.getUserId();
    
    String printName;
    if (userName == null){
        printName = email;
    }
    else {
        printName = userName;
    }
%>
 
<div>

                    
                            <ul>
                                
                                <li id="greenBtn" class ="Btn showForm"  style="float: right; margin-top: 5px"><a href="_logoutServlet" style="font-weight: bold;">Abmelden</a></li>
                                
                                <li class ="Btn showForm" style="float: right; margin-right: 20px; margin-top: 5px"><a href="userinfo.jsp?uid=<%= uid %>" style="font-weight: bold;"><%= printName %></a></li>
                                                                <li class ="Btn showForm" style="float: right; margin-left: 100px;"><a href="addToCart_view.jsp"><span class="backRed" style="background:transparent; font-weight:  bold; font-size: 20px; float:right"><%= totalQty %></span><img src="images/cart.png" alt="" style="max-width: 20%;  float:right" /></a></li></br>

                                <%
                                    if (session.getAttribute("admin") != null){
                                %>
                                <li class ="Btn showForm"><a href="admin_Performance.jsp">Administrator: </a></li>
                                <%
                                    }
                                %>
                            </ul>
                       
                                                   
     
</div>