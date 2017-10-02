<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Verify product form</title>
   <!--  javascript reference -->

        <script src="resources/jquery/js/jquery-1.9.1.js"></script>
        <script src="resources/bootstrap/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
        <script src="resources/bootstrap/bootstrapvalidator-0.5.2/dist/js/bootstrapValidator.min.js"></script>
   
 	<!-- css reference -->
 	   
 	  <spring:url value="resources/bootstrap/bootstrap-3.3.7/dist/css/bootstrap.min.css" var="bootstrapCSS" />
	  <link rel="stylesheet" href="${bootstrapCSS}">
	<style type="text/css">
	  #success_message{ display: none;}
	</style>
	
	<script>
	$(document).ready(function() { 
	var $rows = $('#myTable tr');
	
	$('#search').keyup(function() {
		
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});
	});
	</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
   <div class="container">

    <div class="well form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>BILLING HISTORY</legend>
 
</fieldset>
<div class="row">
   
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <!-- <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#contains">Contains</a></li>
                      <li><a href="#its_equal">It's equal</a></li>
                      <li><a href="#greather_than">Greather than ></a></li>
                      <li><a href="#less_than">Less than < </a></li>
                      <li class="divider"></li>
                      <li><a href="#all">Anything</a></li>
                    </ul>
                </div> -->
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" id="search" class="form-control" name="x" placeholder="Type to search...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
	</div>
      
              <table id="myTable" class="table table-bordred table-striped">
                   
                 <thead> 
                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Customer Name</th>
                   <th>Order Date</th>
                   <th>Invoice number</th>
                   <th>Total Price</th>
                 </thead>  
    
   <tbody>
    <c:forEach items="${billingHistoryBeans}" var="list">
     <tr>
         <td><input type="checkbox" class="checkthis" /></td>       
         <td>${list.customerName}</td>
         <td>${list.orderDate}</td>
         <td><a href="getProductsForInvoice?invoice_number=${list.invoiceNumber}" target="_blank">${list.invoiceNumber}</a></td>   
         <td>${list.totalPrice}</td>
     </tr>
 </c:forEach>
     </tbody>
   
 <!-- <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul> -->
        
</table>

</div>
</div>
</div>
</div>

</body>
</html>
