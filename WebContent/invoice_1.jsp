<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="customerBean"
	class="com.billingsoftware.beans.CustomerBean" scope="request" />
<jsp:useBean id="invoiceBean"
	class="com.billingsoftware.beans.InvoiceBean" scope="request" />
<jsp:useBean id="finalInvoiceBean"
	class="com.billingsoftware.beans.FinalInvoiceBean" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>
	<%out.print(finalInvoiceBean.getInvoiceNumber()); %>
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
  function print_invoice() {
	  $("#print_hide").hide();
      window.print();
      $("#print_hide").show();
  }
  </script>

      <script src="resources/jquery/js/jquery-1.9.1.js"></script>
  <script src="resources/bootstrap/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
  
  
  <!-- css reference -->
 	   
 	  <spring:url value="resources/bootstrap/bootstrap-3.3.7/dist/css/bootstrap.min.css" var="bootstrapCSS" />
	  <link rel="stylesheet" href="${bootstrapCSS}">
	  
<style>

	

table {
    border-collapse: collapse;
    cellpadding : 10;
    width : 100%;
}

table, td, th, tr {
    border: 1px solid black;
}

.footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: #efefef;
  text-align: center;
}

.no-border {
     border: 0px;
}
</style>
</head>
<body>
    <a id = "print_hide" onclick = "print_invoice();"><span class="glyphicon glyphicon-print"><font face="Courier New, Courier, monospace"> Print</font></span></a>
    <p align="right"><font face="Courier New, Courier, monospace"></font></p>
    
	<table>
	    <tr align="center"><td colspan="2"><b>TAX INVOICE </b><p align = "right">Original/Duplicate/Triplicate</p></tr>
		<tr>
			<td width="70%">Name of Supplier - <b>PURVI AUTOMATION AND CONTROL</b> <br/> 
			    Gala No I-04, T-80 Block, Mangalmurti Industrial Complex, MIDC Bhosari, Pune-411 026, Maharashtra  <br/>			                           		                                          
			  	Email ID : purviautomation@rediffmail.com                     <br/>
				Mobile : +91 9850221106</td>
			<td width="30%" align="right">
		       
			
			
		</tr>
		<tr>
		  <td colspan="2">GSTIN - 27AMLPP2813K1ZQ</td>
		</tr>
	</table>
	<br />
	<table cellpadding="20">
	   <tr align="right">
		  <td>Invoice No.</td><td> <%out.print(finalInvoiceBean.getInvoiceNumber()); %></td>
		  <td>Date</td><td><%out.print(finalInvoiceBean.getOrderDate()); %></td>
		</tr>
	</table>
	<br />
		<table cellpadding="20">
	   <tr align="right">
		  <td>Challan No.</td><td> <%out.print(finalInvoiceBean.getChallanNumber()); %></td>
		  <td>Purchase Order (PO)</td><td><%out.print(finalInvoiceBean.getPurchaseOrder()); %></td>
		</tr>
	</table>
	<br />
	<table>	
		<tr>
		  <td colspan="2" align="center"><b>Details of Recepient</b></td>
		</tr>
		<tr>
			<td colspan="2"> 
			<b>Billing Address - </b>
			<%        			   
        			    customerBean = finalInvoiceBean.getCustomerBean();
        			   if(customerBean.getCustomerName()!=null) {
        				   %> <b> <% out.println(customerBean.getCustomerName());  %> </b>  <br> <%} %>
    				
    				  <%if(customerBean.getCustomerAddress()!=null) {
    				  out.println(customerBean.getCustomerAddress()); %> <br> <%} %>
    				  
    				  <%if(customerBean.getCustomerEmailId()!=null) {
    				  out.println(customerBean.getCustomerEmailId()); %> <br> <%} %>
			
			      <b>GST No: </b> <%out.print(customerBean.getcustomerGstIn()); %>
			</td>		
		</tr>		
	</table>
	<br /> <br /> <br />
	
	<table cellpadding="10">
	  <tr><td colspan="11"> <b>Order Summary</b></td></tr>
	<tr>
	   
	   <td><strong>Sl No.</strong></td>
        							<td><strong>Product</strong></td>
        							<td><strong>HSN/BAC</strong></td>
        							<td class="text-center"><strong>Rate (Rs)</strong></td>
        							<td class="text-right"><strong>Qty</strong></td>
        							<td class="text-right"><strong>Total Price (Rs)</strong></td>
        							<td class="text-right"><strong>CGST (%)</strong></td>
        							<td class="text-right"><strong>CGST (Rs)</strong></td>
        							<td class="text-right"><strong>SGST (%)</strong></td>
        							<td class="text-right"><strong>SGST (Rs)</strong></td>       							
        							<td class="text-right"><strong>Net Price (Rs)</strong></td>
       </tr>
       
       			<tbody>
    						
    						<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							 <c:forEach items="${invoiceBeans}" var="list" varStatus="counter">
    							  <tr>
    							  <td>${counter.count}</td>
    							   <td>${list.productName}</td>
         							<td>${list.hsnBac}</td>
         							<td class="text-center">${list.productPrice}</td>
         							<td class="text-right">${list.productQuantity}</td>
         							<td class="text-right">${list.totalPrice}</td>
         							<td class="text-right">${list.productCGST}</td>
         							<td class="text-right">${list.priceAfterCGST}</td>
         							<td class="text-right">${list.productSGST}</td>
         							<td class="text-right">${list.priceAfterSGST}</td>         							
         							<td class="text-right">${list.productRate}</td>   
         						
         						</tr>						
    							 </c:forEach>
    							 
    							 
    							 <tr>
                                     <td colspan = "5"><strong></strong></td>
        							
        							<td class="text-right"><strong>Total-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalPrice()); %></td>
        							<td class="text-right"><strong></strong></td>
        							<td class="text-right"><strong>SGST-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalSGST()); %></td>
        							<td class="text-right"><strong></strong></td>
        							<td class="text-right"><strong>CGST-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalCGST()); %></td>
        							
        							<td class="text-right"><strong>Net-&nbsp;</strong><% out.print(finalInvoiceBean.getNetPrice()); %></td>
                                </tr>
    							 
    							 
    							 </tbody>	 
    							 <tfoot>
    							 
    							 
	</table>
	<br />
	   							 <strong>Amount in words:</strong>
    							   <% out.print(finalInvoiceBean.getAmountInWords()); %>
    							
    						<div class = "footer">
    						
    						    						
    						   <table width = "100%">
    							     <tr ><td align="left" colspan="4"><b>Remarks:</b></td></tr>
    							    
    							     <tr><td align="left" colspan="2">Company's PAN &nbsp;:&nbsp;<b>AMLPP2813K</b></td></tr>
    							      <tr><td colspan="2">&nbsp;</td></tr>
    							      <tr>
    							          <td align="left"><p>
    							                 <b>Declaration:</b> <br />
    							                 We declare that this invoice shows actual price of goods <br /> 
    							                 and/or services described & that all particulars are true and <br />
    							                 correct. <br />
    							              </p>
    							          </td>
    							          <td align="left"><p>
    							                 <b>Company's Bank Details:</b>  <br />
    							                 Bank Name              : TJSB SAHAKARI BANK LTD <br />
    							                 A/C No.                : 034120100004045        <br />
    							                 IFSC code              : TJSB0000034 <br />
    							          </p>
    							                 
    							          </td>
    							      </tr>
    							       
    							          
    					              
    							        </table>
    							     
    							     <table width="100%">
    							        <tr>
    							         <td align = "left">        <br /><br /><br /><br />
    							         <p>---------------------------------------------------- </p>      
    							            <font face="Courier New, Courier, monospace">Receiver's Signature</font> 
    							             </td>
    							          <td align = "right">    <br /><br /><br /><br />
    							           <p>------------------------------------------ </p>
    							       <font face="Courier New, Courier, monospace">Authorised Signatory</font> 
    							      </td>
    							        </tr>
    							     </table>
    						    							  
    						</div>	   
    							   
    							 
         							 

</body>
</html>