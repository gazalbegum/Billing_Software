<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ page import = "java.text.*" %>
    <jsp:useBean id="customerBean" class="com.billingsoftware.beans.CustomerBean" scope="request" />
    <jsp:useBean id="invoiceBean" class="com.billingsoftware.beans.InvoiceBean" scope="request" />
     <jsp:useBean id="finalInvoiceBean" class="com.billingsoftware.beans.FinalInvoiceBean" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title><%out.print(finalInvoiceBean.getInvoiceNumber()); %></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <!--  javascript reference -->

   
         <script src="resources/jsPDF-master/dist/jspdf.min.js"></script>
         
        <script src="resources/html2canvas/html2canvas.min.js"></script>
        <script src="resources/jquery/js/jquery-1.9.1.js"></script>
        <script src="resources/bootstrap/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
        <script src="resources/bootstrap/bootstrapvalidator-0.5.2/dist/js/bootstrapValidator.min.js"></script>
        
        <script type="text/javascript">
        
        /* Take screenshot of current page */
        

  function screenshot(){
    html2canvas(document.body).then(function(canvas) {
    document.body.appendChild(canvas);
   });
  }

  
        
        function print_invoice() {
        	
        	 
        		/* console.log("rsggtrherh");
        	      html2canvas($("#print_hide"), {
        	    	  
        	          onrendered: function(canvas) {  
        	        	 
        	        	    var imgData = canvas.toDataURL("image/svg+xml", 1.0);
        	                var dimensions = map.getSize();
        	                 
        	                var pdf = new jsPDF('l', 'pt', 'letter');
        	                pdf.addImage(imgData, 'PNG', 10, 10, dimensions.x * 0.5, dimensions.y * 0.5);
        	                 
        	                cover.className = '';
        	 
        	                pdf.save("download.pdf");
        	          }
        	      });*/
        	
        	
    
        	 $("#print_hide").hide();
            window.print();
            $("#print_hide").show();
        }
        </script>
   
 	<!-- css reference -->
 	   
 	  <spring:url value="resources/bootstrap/bootstrap-3.3.7/dist/css/bootstrap.min.css" var="bootstrapCSS" />
	  <link rel="stylesheet" href="${bootstrapCSS}">
  
  <style type="text/css">
    /*.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}

 @page {
      size: auto;
      margin: 3mm;
  }*/
  
  /* for footer */
  
  .footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;    
    color: white;
    text-align: center;
}

</style>

</head>
<body>
<div class="container">
    <div class="row">
   
        <div class="col-xs-12">
    		<div class="invoice-title">
    		
    		<table width = "100%" >
    		<!--  
    		     <tr><td width = "65%" align = "right"><h4>TAX INVOICE CUM DELIVERY CHALLAN</h4></td>
    		         <td><h5 class="pull-right"><font face="Courier New, Courier, monospace">(ORIGINAL FOR RECEIPIENT)</font></h5></td>
    		     </tr> 
    		     -->
    		          <tr><td>&nbsp;</td></tr>
    		          <tr><td>&nbsp;</td></tr>
    		             <tr><td>&nbsp;</td></tr>
    		          <tr><td>&nbsp;</td></tr>
    		      <tr><td></td><td align="right"><a id = "print_hide" onclick = "print_invoice();"><span class="glyphicon glyphicon-print"><font face="Courier New, Courier, monospace"> Print</font></span></a></td>    		        
    		     </tr> 
    		   
    		     <tr><td width = "65%" align = "left"><h4><strong>PURVI AUTOMATION AND CONTROL</strong></h4></td>
    		         <td><h5 class="pull-right"><font face="Courier New, Courier, monospace">(ORIGINAL FOR RECEIPIENT)</font></h5>
    		             
    		         </td>
    		     </tr> 
    		     
    		     <tr><td width = "65%" align = "left"><address>Gala No I-04, T-80 Block, Mangalmurti Industrial Complex, MIDC
    		     		Bhosari, Pune-411 026 <br />Maharashtra, Code : 27	<br />GST PIN - 27AMLPP2813K1ZQ <br />
    		     		Email ID - purviautomation@rediffmail.com <br /> Mobile - +91 9850221106</address></td>
    		         <td width = "65%" align = "right"></td>
    		     </tr>    		
    		</table>
    			
    		</div>
    		<hr>
    		<h5 class="pull-right"><b>Invoice # <%out.print(finalInvoiceBean.getInvoiceNumber()); %></b></h5> <br />
    		
    		<h5 class="pull-right"></h5>
    		<div class="row">
    			 <div class="col-xs-6">
    			 <!--  
    			<br />
    	    		<address>
    				<strong>Purvi Automation & Control</strong>	#10/2, First floor, Borawake Bldg Vikas Colony Landewadi, Bhosari, Pune-411039	Maharashtra, Code : 27
    					GSTIMUN27AMLPP2313K1ZQ
    				</address>
    				-->
    				<address>
        			<strong>Customer :</strong><br>
        			<%        			   
        			    customerBean = finalInvoiceBean.getCustomerBean();
        			   if(customerBean.getCustomerName()!=null) {
    				   out.println(customerBean.getCustomerName()); %> <br> <%} %>
    				
    				<%if(customerBean.getCustomerCompanyName()!=null) {
    				 out.println(customerBean.getCustomerCompanyName()); %> <br> <%} %>
    				 
    				 <%if(customerBean.getCustomerAddress()!=null) {
    				  out.println(customerBean.getCustomerAddress()); %> <br> <%} %>
    				  
    				  <%if(customerBean.getCustomerEmailId()!=null) {
    				  out.println(customerBean.getCustomerEmailId()); %> <br> <%} %>
    				</address>
    			</div>
				
				
				
    			<div class="col-xs-6 " align="right">
    				<b>Provision # </b><%out.print(customerBean.getProvisionID()); %>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					 <%out.println(finalInvoiceBean.getCustomerPaymentMode()==null?"":finalInvoiceBean.getCustomerPaymentMode()); %><br>    				    
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					<%out.print(finalInvoiceBean.getOrderDate()); %><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
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
    						</thead>
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
                                     <td><strong></strong></td>
        							<td><strong></strong></td>
        							<td><strong></strong></td>
        							<td class="text-center"><strong></strong></td>
        							<td class="text-right"><strong></strong></td>
        							<td class="text-right"><strong>Total-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalPrice()); %></td>
        							<td class="text-right"><strong></strong></td>
        							<td class="text-right"><strong>Total SGST-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalSGST()); %></td>
        							<td class="text-right"><strong></strong></td>
        							<td class="text-right"><strong>Total CGST-&nbsp;</strong><% out.print(finalInvoiceBean.getTotalCGST()); %></td>
        							
        							<td class="text-right"><strong>Total Net-&nbsp;</strong><% out.print(finalInvoiceBean.getNetPrice()); %></td>
                                </tr>
    							 
    							 </tbody>	 
    							
    					</table>
    					
    					<br />
    					
    							  
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
           
    							
    							 <div align="left">
    							   <strong>Amount in words:</strong><br>
    							   <% out.print(finalInvoiceBean.getAmountInWords()); %>
    							   </div>
    							   <br /> <br />
    							    <div class = "footer">  
    							   <table width = "100%">
    							     <tr><td align="left"><b>Remarks:</b></td></tr>
    							     <tr><td><b></b>&nbsp;</td></tr>
    							     <tr><td>&nbsp;</td></tr>
    							     <tr><td>&nbsp;</td></tr>
    							     <tr><td>&nbsp;</td></tr>
    							     <tr><td align="left">Company's PAN &nbsp;:&nbsp;<b>AMLPP2813K</b></td></tr>
    							      <tr><td>&nbsp;</td></tr>
    							      <tr>
    							          <td align="left"><p>
    							                 <b>Declaration:</b> <br />
    							                 We declare that this invoice shows actual price of goods <br /> 
    							                 and/or services described & that all particulars are true and <br />
    							                 correct. <br />
    							              </p>
    							          </td>
    							          <td align="right"><p>
    							                 <b>Company's Bank Details:</b>  <br />
    							                 Bank Name              : TJSB SAHAKARI BANK LTD <br />
    							                 A/C No.                : 034120100004045        <br />
    							                 IFSC code              : TJSB0000034 <br />
    							          </p>
    							                 
    							          </td>
    							      </tr>
    							   </table>
    							        <table>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							          <tr><td>&nbsp;</td></tr>
    							        </table>
    							       <table width = "100%">
    					             <tr>    					             
    					                  <td align="left">&nbsp;---------------------------------------------------- <br />
    							            <font face="Courier New, Courier, monospace">Receiver's Signature</font></td>
    					             
    					                  <td align="right"> ------------------------------------------ <br />
    							            <font face="Courier New, Courier, monospace">Authorised Signatory</font></td>    					             
    					             </tr>    					   
    							  </table>
    							  
    							   <hr />  
    							 <center><font face = "Times New Roman, Times, serif">This is a Computer Generated Invoice</font></center>
    							  
</div>
</div>


</body>

</html>