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
	<%
		out.print(finalInvoiceBean.getInvoiceNumber());
	%>
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
<script
	src="resources/bootstrap/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>


<!-- css reference -->

<spring:url
	value="resources/bootstrap/bootstrap-3.3.7/dist/css/bootstrap.min.css"
	var="bootstrapCSS" />
<link rel="stylesheet" href="${bootstrapCSS}">

<style>
body {
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-style: normal;
	font-variant: normal;
}

table {
	cellpadding: 10;
	width: 100%;
}

td {
	padding: 5px
}

table, td, th {
	border: 1px solid black;
}

.cell-spacing-pdf {
	
}

#containment-holder {
	margin: 0px;
	padding: 0px;
	border: 0px 1px 1px 1px;
	border-style: solid;
}

.no-border {
	border: 0px;
}

.footer {
	position: relative;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: #efefef;
	text-align: center;
}
</style>
</head>
<body>
	<div style="float: right; padding-top: 0px; margin-top: 0px">
		<a id="print_hide" onclick="print_invoice();"><span
			class="glyphicon glyphicon-print"><font
				face="Courier New, Courier, monospace"> Print</font></span></a>
		<p align="right">
			<font face="Courier New, Courier, monospace"></font>
		</p>

	</div>
	<div id="containment-holder"
		style="padding-top: 0px !important; margin-top: 0px !important">
		<table>
			<tr align="center" style="border-top: none !important">
				<td colspan="2"><b>TAX INVOICE </b>
					<p align="right">Original/Duplicate/Triplicate</p>
			</tr>
			<tr>
				<td width="70%" class="cell-spacing-pdf container-fluid">Name
					of Supplier - <b>PURVI AUTOMATION AND CONTROL</b> <br /> Gala No
					I-04, T-80 Block, Mangalmurti Industrial Complex, MIDC Bhosari,<br />
					Pune-411 026, Maharashtra <br /> Email ID :
					purviautomation@rediffmail.com <br> Mobile : +91 9850221106 <br />
					GSTIN - 27AMLPP2813K1ZQ
				</td>
				<%-- <td width="30%" align="">Invoice No. <%
					out.print(finalInvoiceBean.getInvoiceNumber());
				%><span style="border-top:solid 1px;display:block"><br>Date <%
					out.print(finalInvoiceBean.getOrderDate());
				%></span>

				</td> --%>
				<td width="30%" style="padding: 0px">
					<div
						style="border-top: solid 1px; border-bottom: solid 1px; margin: 0px; padding: 0px;">
						<div
							style="border-right: solid 1px; display: inline; padding-left: 5px">Invoice
							No.</div>
						<div style="display: inline; text-align: right;">
							<%
								out.print(finalInvoiceBean.getInvoiceNumber());
							%>
						</div>
					</div> <br>
					<div
						style="border-top: solid 1px; border-bottom: solid 1px; margin: 0px; padding: 0px;">
						<div
							style="border-right: solid 1px; display: inline; padding-left: 5px">Date
						</div>
						<div style="display: inline">
							&nbsp;
							<%
								out.print(finalInvoiceBean.getOrderDate());
							%>
						</div>
					</div>
				</td>
			</tr>


		</table>
		<br />
		<table cellpadding="20">




			<tr>
				<td class="container-fluid"><div style="display: inline">PO
						No.</div>
					<div style="float: right; display: inline">
						<%
							out.print(finalInvoiceBean.getPurchaseOrder());
						%>
					</div></td>
				<td>
					<div style="display: inline">PO Date.</div>
					<div style="float: right; display: inline">
						<%
							out.print(finalInvoiceBean.getPurchaseDate());
						%>
					</div>
				</td>
				<td><div style="display: inline">Challan No.</div>
					<div style="float: right; display: inline">
						<%
							out.print(finalInvoiceBean.getChallanNumber());
						%>
					</div></td>
				<td><div style="display: inline">Challan Date</div>
					<div style="float: right; display: inline">
						<%
							out.print(finalInvoiceBean.getChallanDate());
						%>
					</div></td>

			</tr>
		</table>
		<br />

		<table>
			<tr>
				<td colspan="2" align="center"><b>Details of Recepient</b></td>
			</tr>
			<tr>
				<td colspan="2" class="cell-spacing-pdf container-fluid"><b>Billing
						Address - </b> <%
 	customerBean = finalInvoiceBean.getCustomerBean();
 	if (customerBean.getCustomerName() != null) {
 %> <b> <%
 	out.println(customerBean.getCustomerName());
 %>
				</b> <br> <%
 	}
 %> <%
 	if (customerBean.getCustomerAddress() != null) {
 		out.println(customerBean.getCustomerAddress());
 %> <br> <%
 	}
 %> <%
 	if (customerBean.getCustomerEmailId() != null) {
 		out.println(customerBean.getCustomerEmailId());
 %> <br> <%
 	}
 %> <b>GST No: </b> <%
 	out.print(customerBean.getcustomerGstIn());
 %></td>
			</tr>
		</table>
		<br />

		<table cellpadding="10">
			<tr>
				<td colspan="11" class="cell-spacing-pdf"><b>Order Summary</b></td>
			</tr>
			<tr>

				<td><strong>Sl No.</strong></td>
				<td><strong>Product</strong></td>
				<td><strong>HSN/BAC</strong></td>
				<td class="text-center"><strong>Rate (Rs)</strong></td>
				<td><strong>Qty</strong></td>
				<td><strong>Total Price (Rs)</strong></td>
				<td><strong>CGST (%)</strong></td>
				<td><strong>CGST (Rs)</strong></td>
				<td><strong>SGST (%)</strong></td>
				<td><strong>SGST (Rs)</strong></td>
				<td><strong>Net Price (Rs)</strong></td>
			</tr>

			<tbody>

				<!-- foreach ($order->lineItems as $line) or some such thing here -->
				<c:forEach items="${invoiceBeans}" var="list" varStatus="counter">
					<tr id="OrderSummary">
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
					<td colspan="5"><strong></strong></td>

					<td class="text-right"><strong>Total-&nbsp;</strong> <%
 	out.print(finalInvoiceBean.getTotalPrice());
 %></td>
					<td class="text-right"><strong></strong></td>
					<td class="text-right"><strong>SGST-&nbsp;</strong> <%
 	out.print(finalInvoiceBean.getTotalSGST());
 %></td>
					<td class="text-right"><strong></strong></td>
					<td class="text-right"><strong>CGST-&nbsp;</strong> <%
 	out.print(finalInvoiceBean.getTotalCGST());
 %></td>

					<td class="text-right"><strong>Net-&nbsp;</strong> <%
 	out.print(finalInvoiceBean.getNetPrice());
 %></td>
				</tr>


			</tbody>
			<tfoot>
		</table>
		<div class="container-fluid" style="margin-bottom: 7px">
			<br /> <strong>Amount in words:</strong>
			<%
				out.print(finalInvoiceBean.getAmountInWords());
			%>

		</div>


		<div class="footer container-fluid" style="margin-top:5%">

			<div class="row" style="border-bottom: 1px solid black">
				<p class="container-fluid text-left" style="padding: 7px 0px 0px 15px">
					Company's PAN &nbsp;:&nbsp;<b>AMLPP2813K</b> <br /> <b>Company's
						Bank Details:</b> <br /> Bank Name : TJSB SAHAKARI BANK LTD <br />
					A/C No. : 034120100004045 <br /> IFSC code : TJSB0000034 <br />
				</p>
			</div>
			<div class="row">
				<div  style="width:50%;float:left;border-right: 1px solid black" >
					<br /> <br /> <br /> <br /><br /><br />
					<p>----------------------------------------------------</p>
					<font face="Courier New, Courier, monospace"><strong>Receiver's
							Signature</strong></font>
				</div>
				
				
				<div style=" width:50%;float:right">
				<br /> <br />
							<br /> <br /><br /><br />
							<p>------------------------------------------</p> <font
							face="Courier New, Courier, monospace"><strong>Authorised
									Signatory</strong></font>
				
				</div>
				
				
				<!-- 
				
				<table width="100%">
					<tr>
						<td align="left"><p class="container-fluid"
								style="padding: 7px 0px 0px 10px">
								Company's PAN &nbsp;:&nbsp;<b>AMLPP2813K</b> <br /> <b>Company's
									Bank Details:</b> <br /> Bank Name : TJSB SAHAKARI BANK LTD <br />
								A/C No. : 034120100004045 <br /> IFSC code : TJSB0000034 <br />
							</p></td>
					</tr>



				</table>

				<table width="100%">
					<tr>
						<td align="left" style="border: none !important"><br /> <br />
							<br /> <br />
							<p>----------------------------------------------------</p> <font
							face="Courier New, Courier, monospace"><strong>Receiver's
									Signature</strong></font></td>
						<td align="right" style="border: none !important"><br /> <br />
							<br /> <br />
							<p>------------------------------------------</p> <font
							face="Courier New, Courier, monospace"><strong>Authorised
									Signatory</strong></font></td>
					</tr>
				</table>
 -->
			</div>

		</div>
</body>
</html>