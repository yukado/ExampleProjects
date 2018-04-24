<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="header.jsp" %> 

<% if(request.getAttribute("ack").equals("SUCCESS") || request.getAttribute("ack").equals("SUCCESSWITHWARNING")) { 
	HashMap result = (HashMap) request.getAttribute("result");
	
%>
			<span class="span4">
    		</span>
    		<span class="span5">
    			<div class="hero-unit">
    		<!-- Display the Transaction Details-->
    			<h4> <%=result.get("FIRSTNAME")%>
    				<%=result.get("LASTNAME")%> , Thank you for your Order </h4>
    			
    			<h4> Shipping Details: </h4>
    			<%=result.get("PAYMENTREQUEST_0_SHIPTONAME")%><br>
				<%=result.get("PAYMENTREQUEST_0_SHIPTOSTREET")%><br>
				<%=result.get("PAYMENTREQUEST_0_SHIPTOCITY")%><br>
				
				<%=result.get("PAYMENTREQUEST_0_SHIPTOSTATE")%>- <%=result.get("PAYMENTREQUEST_0_SHIPTOZIP")%></p>
    			<p>Transaction ID: <%=result.get("PAYMENTINFO_0_TRANSACTIONID")%> </p>
    			<p>Transaction Type: <%=result.get("PAYMENTINFO_0_TRANSACTIONTYPE")%> </p>
    			<p>Payment Total Amount: <%=result.get("PAYMENTINFO_0_AMT")%> </p>
    			<p>Currency Code: <%=result.get("PAYMENTINFO_0_CURRENCYCODE")%> </p>
    			<p>Payment Status: <%=result.get("PAYMENTINFO_0_PAYMENTSTATUS")%> </p>
    			<p>Payment Type: <%=result.get("PAYMENTINFO_0_PAYMENTTYPE")%> </p>
    			<h3> Click <a href='index.jsp'>here </a> to return to Home Page</h3>
    		
    			</div>
    		</span>
    		<span class="span3">
    		</span>

<% } else { %>

<div class="hero-unit">
    			<!-- Display the Transaction Details-->
    			<h4> There is a Funding Failure in your account. You can modify your funding sources to fix it and make purchase later. </h4>
    			Payment Status:
    			PAYMENTINFO_0_PAYMENTSTATUS
    			
    			<h3> Click <a href='https://www.sandbox.paypal.com/'>here </a> to go to PayPal site.</h3> <!--Change to live PayPal site for production-->
    			</div>

<% } %>		
		

			
<%@ include file="includesPage/footer.jsp" %> 