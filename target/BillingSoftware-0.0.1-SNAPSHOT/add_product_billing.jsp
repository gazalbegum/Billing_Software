<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html ">
<html lang="en">
<head>
    <title>Add Product for billing</title>
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
	
	<script type="text/javascript">
	
	 function calculate_net_price() {
	       var product_sgst = document.getElementById('product_sgst').value;
	       var product_cgst = document.getElementById('product_cgst').value;
	       var unit_price = document.getElementById('unit_price').value;
	       var product_quantity = document.getElementById('product_quantity').value;
	       
	       if (product_sgst == "")
	    	   product_sgst = 1;
	       if (product_cgst == "")
	    	   product_cgst = 1;
	       if (unit_price == "")
	    	   unit_price = 1;
	       
	       
	       var total_price = unit_price * product_quantity;
	       var after_SGST = ((total_price * product_sgst) / 100);
	       var after_CGST = ((total_price * product_cgst) / 100);
	       

	       var net_price = (total_price) + after_SGST + after_CGST;
	       Math.round(net_price * 100) /100
	       if (!isNaN(net_price)) {
	           document.getElementById('net_price').value = net_price;
	       }
	   }
	
	
 $(document).ready(function() {	    
	 
	 var $select = document.getElementById('product_name');
	 
	 
   $select.addEventListener('change', function(){    
	   
	   var selectedValue = $('#product_name').val();
	   console.log("after selection :" +selectedValue)
      $.getJSON('/BillingSoftware/getProductsById', { name:selectedValue }, function (data) {
        	              
        	               if (data.productHsnBac) {
        	                   $('#product_hsn_bac').val(data.productHsnBac);
        	               }
        	               
        	               if (data.productSGST) {
        	                   $('#product_sgst').val(data.productSGST);
        	               }
        	               
        	               if (data.productCGST) {
        	                   $('#product_cgst').val(data.productCGST);
        	               }
        	               
        	              });
		  
   });  
   
		    $('#billing_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	
		            product_hsn_bac: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Add HSN/BAC Code for given product'
		                    },
		                    
		                }
		            },
		            product_sgst: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Please Add SGST'
		                    },
		                    
		                    stringLength: {
		                        max: 2,
		                        message: 'Max 2 digit'
		                    }
		                    
		                }
		            },
		            product_cgst: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Please Add CGST'
		                    },
		                    
		                    stringLength: {
		                        max: 2,
		                        message: 'Max 2 digit'
		                    }
		                    
		                }
		            },
		            customer_payment_mode: {
		                validators: {
		                     stringLength: {
		                        min: 4,
		                    },
		                    notEmpty: {
		                        message: 'Add payment mode'
		                    }
		                }
		            },
		            unit_price: {
		                validators: {
		                     stringLength: {
		                        min: 3,
		                    },
		                    notEmpty: {
		                        message: 'Add Price/Unit'
		                    }
		                }
		            },
		            product_quantity: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add number of quantites'
		                    }
		                }
		            },
		           	
		            }
		        })
		        .on('success.form.bv', function(e) {
		            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...	          
		           
		         
		            // Prevent form submission
		            e.preventDefault();

		            // Get the form instance
		            var $form = $(e.target);

		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');

		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		            }, 'json');
		            
		           // $('#billing_form').find('#product_name', '#product_hsn_bac','#product_cgst','#product_sgst', '#product_quantity','#unit_price','#net_price').val('');
		            
		           $('#billing_form').find('input, select').not("#order_date,#customer_payment_mode,#customer_id,#purchase_order,#challan_number").val('');
		            console.log("reset done");
		        });
		});

	  
// Allow Only numbers Validation
	  
	  $(document).ready(function () {
  //called when key is pressed in textbox
  $("#product_gst").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});

	  $(document).ready(function () {
		  //called when key is pressed in textbox
		  $("#unit_price").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        $("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
		});
	  
	  $(document).ready(function () {
		  //called when key is pressed in textbox
		  $("#product_quantity").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        $("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
		});


	</script>
	<!-- ddb dor customer-->
	<script type="text/javascript">
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
	
	function editFunction(temp){		
		console.log(temp);
	}
	
	$(document).ready(function(){
	    $("button").click(function(){
	        $("p").hide();
	    });
	});

	$(document).ready(function(){
	            var numbers = [1, 2, 3, 4, 5];
	            console.log(numbers);
				var option = '';
				
				
				 $.get("/BillingSoftware/customerMap", {
                   
            }, function(response) {
            	
            	var arr1 = Object.keys(response);

            	console.log(arr1);
            	
            	var arr = $.map(response, function(el) { return el });
            	console.log(arr);
            	
				    for(var i=0;i<arr.length;i++){
				    	$('#customer_id').append('<option value="'+arr1[i]  + '">' + arr[i]+ '</option>');
				    	
				    }
 				   //
 				
                    //$('#ajaxGetUserServletResponse').text(responseText);
            }); 
	
	});
	
	
</script>
	
	
	<!-- ddb for product -->
	
	<script type="text/javascript">
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
	
	function editFunction(temp){		
		console.log(temp);
	}
	
	$(document).ready(function(){
	    $("button").click(function(){
	        $("p").hide();
	    });
	});

	$(document).ready(function(){
	            var numbers = [1, 2, 3, 4, 5];
	            console.log(numbers);
				var option = '';
				
				
				 $.get("/BillingSoftware/productMap", {
                   
            }, function(response) {
            	
            	var arr1 = Object.keys(response);

            	
            	console.log("arr1: " + arr1);
            	
            	var arr = $.map(response, function(el) { return el });
            	
            	console.log("arr: " + arr);
            	console.log("arrlenght: " + arr.length);
            	
				    for(var i=0;i<arr.length;i++){
				    	$('#product_name').append('<option value="'+arr1[i] + '">' + arr[i]+ '</option>');
				    	
				    }
 				   //
 				
                    //$('#ajaxGetUserServletResponse').text(responseText);
            }); 
	
	});
	
	
	$(document).ready(function () {
		  //called when key is pressed in textbox
		  $("#product_sgst").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        $("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		     $("#product_sgst").attr('maxlength','2');
		   });
		  
		  
		  $("#product_quantity").keypress(function (e) {
			     //if the letter is not digit then display error and don't type anything
			     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			        //display error message
			        $("#errmsg").html("Digits Only").show().fadeOut("slow");
			               return false;
			    }
			     $("#product_sgst").attr('maxlength','2');
			   });
		  
		  
		  $("#product_cgst").keypress(function (e) {
			     //if the letter is not digit then display error and don't type anything
			     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			        //display error message
			        $("#errmsg").html("Digits Only").show().fadeOut("slow");
			               return false;
			    }
			     $("#product_cgst").attr('maxlength','2');
			   });
		});
	
</script>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
   <div class="container">

    <form class="well form-horizontal" action="addProductForBilling" method="post"  id="billing_form">
<fieldset>

<!-- Form Name -->
<legend>PRODUCT BILLING FORM</legend>

<!-- Text input-->

<!--  
<div class="form-group">
  <label class="col-md-4 control-label">Customer Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="customer_name" id="customer_name" placeholder="Customer Name" class="form-control"  type="text">
    </div>
  </div>
</div>
-->

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Purchase Order</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
  <input name="purchase_order" id="purchase_order" placeholder="Purchase Order" class="form-control"  type="text">
    </div>
</div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Challan No.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
  <input name="challan_number" id="challan_number" placeholder="Challan No." class="form-control"  type="text">
    </div>
</div>
</div>


<!-- select customer ddb -->
<div class="form-group"> 
  <label class="col-md-4 control-label">Customer Name</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="customer_id" id= "customer_id" class="form-control selectpicker" >
      <option value=" " >Please select your customer</option>
      </select>
  </div>
</div>
</div>

<!-- Select Basic -->

<!--    
<div class="form-group"> 
  <label class="col-md-4 control-label">State</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="state" class="form-control selectpicker" >
      <option value=" " >Please select your state</option>
      </select>
  </div>
</div>
 
</div>
--> 
<!-- select product ddb -->
<div class="form-group"> 
  <label class="col-md-4 control-label">Product Name</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="product_name" id="product_name" class="form-control selectpicker" >
      <option value=" " >Please select product name</option>
      </select>
  </div>
</div>
</div>
<!--  
<!-- Text input-->
<!--  
       <div class="form-group">
  <label class="col-md-4 control-label">Product Name</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="product_name" id="product_name" placeholder="Product Name" class="form-control"  type="text">
    </div>
  </div>
</div>
-->

<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">HSN/BAC</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></span>
  <input name="product_hsn_bac" id="product_hsn_bac" placeholder="hsn/bac" class="form-control" type="text" readonly="readonly">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Payment Mode</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
         <select name="customer_payment_mode" id= "customer_payment_mode" class="form-control selectpicker" >
          <option value="By RTGS" >By RTGS</option>
        <option value="By NEFT" >By NEFT</option>
         <option value="By cheque" >By cheque</option>
          <option value="By cash" >By cash</option>
      </select>
    </div>
</div>
</div>

<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">SGST</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
  <input name="product_sgst" id="product_sgst" placeholder="SGST(%)" class="form-control" type="text" readonly="readonly">
    </div>
  </div>
</div>



<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">CGST</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
  <input name="product_cgst" id="product_cgst" placeholder="CGST(%)" class="form-control" type="text" readonly="readonly">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Quantity</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
  <input name="product_quantity" id="product_quantity" placeholder="Quantity" class="form-control"  type="text">
    </div>
</div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">Unit Price</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
  <input name="unit_price" id="unit_price" placeholder="Unit Price" class="form-control" type="text" onkeyup="calculate_net_price()">
    </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">Net Price</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
  <input name="net_price" id="net_price" placeholder="Net Price" class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">Order Date</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input name="order_date" id = "order_date" placeholder="Order Date" class="form-control" type="date">
    </div>
  </div>
</div>
<!-- Success message -->
<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i>Product details for billing submitted successfully!</div>

<!-- Button -->
<table>
<tr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td>

<div class="form-group" align="center">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-warning" >Add Product For Invoice <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>
</td>
<!-- Button -->
<td>
<div class="form-group" align="center">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <a href="${pageContext.request.contextPath}/getProductsForVerify"><button type="button" class="btn btn-warning">Verify Products<span class="glyphicon glyphicon-send"></span></button></a>
  </div>
</div> 
</td>
</tr>
</table>
</fieldset>
</form>
</div>
    </div><!-- /.container -->
</body>
</html>
