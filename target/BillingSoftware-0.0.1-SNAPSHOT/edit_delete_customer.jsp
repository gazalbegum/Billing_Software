<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Edit/Delete customer form</title>
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
	
	$.ajaxSetup({ cache: false });
    $(document).ready(function() {   
        
    	/* edit modal submit */
    	
    	$('#submit').click(function(event) {
    		 $('#edit').modal('hide');
            var form = (event.target.form),
                url = "/BillingSoftware/updateCustomerDetails"         
               
            $.post(url, $("#edit_customer_form").serialize(), function(getData) { 
               console.log(getData);       
            }, 'json');
            
            $('#delete_message').text("Customer edited successfully")
        });
    	
    	$('#edit').on('hidden.bs.modal', function () {
    		 location.reload(true);
    		 $('#delete_message').text("Customer edited successfully")
    		})
        
        /* delete modal submit */
        
        $('#delete-yes').click(function(event) {
        	
        	var customerId = $('#customer_id_delete').val();
        	 $('#delete').modal('hide');
        	console.log("delete-yes-customerId :" +customerId);
        	        	
        		 $.ajax({
        	            url:'/BillingSoftware/jsp/deleteCustomerDetails',
        	            data:{name:customerId},
        	            type:'post',
        	            cache:false,
        	            success:function(data){
        	              console.log(data); 
        	            },
        	            error:function(){
        	              //alert('error');
        	            }
        	         }
        	    );
        		 $('#delete_message').text("Customer deleted successfully")
        		 location.reload(true);
        });    	
        
    });	
	
    
    $('#delete').on('hidden.bs.modal', function () {
    	$('#delete_message').text("Customer deleted successfully")
		 location.reload(true);
		 $('#delete_message').text("Customer deleted successfully")
		 alert("Customer deleted successfully");
		})
	
    /* edit function */
	
	'${list.customerId}','${list.customerName}','${list.customerAddress}','${list.customerPhone}','${list.customerEmailId}', '${list.customerPaymentMode}','${list.customerCompanyName}'
	function editFunction(customerId, customerName, customerGstIn, customerAddress, customerPhone,
			customerEmailId) {
		$('#customer_name').val(customerName);
	    $('#customer_gst_in').val(customerGstIn);
		$('#customer_phone').val(customerPhone);
		$('#customer_email_id').val(customerEmailId);
		$('#customer_address').val(customerAddress);
		$('#customer_id').val(customerId);
	}

	
			/* delete function */
			
			function deletefunctionTest(customerId){					
				$('#customer_id_delete').val(customerId);
				console.log("invoice id :" + $('#customer_id_delete').val());			
			}
	
	
	  $(document).ready(function() {
		    $('#edit_customer_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	product_name: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Please supply your customer name'
		                    }
		                }
		            },
		            product_hsn_bac: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please supply your email address'
		                    },
		                    emailAddress: {
		                        message: 'Please supply a valid email address'
		                    }
		                }
		            },
		            product_gst: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please supply your phone number'
		                    },
		                    phone: {
		                        country: 'US',
		                        message: 'Please supply a vaild phone number with area code'
		                    },
		                    
		                    
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
		            
		            $( '#edit_customer_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#edit_customer_form').click(function() {
		                location.reload(true);
		            });
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
<legend>EDIT/DELETE CUSTOMER</legend>
 
</fieldset>
<div class="row">
		
  
        <div class="col-md-12">
        <div class="table-responsive">
          <span id="delete_message" class="color:green"></span> 
                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Customer Name</th>
                   <th>Customer GST</th>
                   <th>Address</th>
                   <th>Phone</th>
                   <th>Email</th>
                   <th>Edit</th>                      
                   <th>Delete</th>
                   </thead>
    <tbody>
   
    <c:forEach items="${customerBeans}" var="list">
     <tr>
         <td><input type="checkbox" class="checkthis" /></td>
         <td>${list.customerName}</td>
         <td>${list.customerGstIn}</td>
         <td>${list.customerAddress}</td>
         <td>${list.customerPhone}</td>
         <td>${list.customerEmailId}</td>
         <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" onclick="editFunction('${list.customerId}','${list.customerName}','${list.customerGstIn}','${list.customerAddress}','${list.customerPhone}','${list.customerEmailId}')"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
         <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash" onclick="deletefunctionTest('${list.customerId}')"></span></button></p></td>     </tr>
    </c:forEach>
     
    </tbody>
        
</table>

<!-- <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>-->
                
            </div>
            
        </div>
	</div>
</div> 




<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="#edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      
        
      </div>
          <div class="modal-body">
          <form  action="updateCustomerDeatils" method="post"  id="edit_customer_form">
						<div class="form-group">    
						     <label>Customer Name</label>   
       						 <input class="form-control " id = "customer_name"	name="customer_name" type="text" readonly>
                        </div>							
                        
 						<div class="form-group"> 
 						     <label>Customer GST</label>      
       						 <input class="form-control " id = "customer_gst_in"	name="customer_gst_in" type="text" >
                        </div>	
                        
                        <div class="form-group">       
                             <label>E-Mail</label>
       						 <input class="form-control " id = "customer_email_id"	name="customer_email_id" type="text">
                        </div>
                        
 						<div class="form-group">    
 						     <label>Phone #</label>   
       						 <input class="form-control " id = "customer_phone"	name="customer_phone" type="text" onkeyup="calculate_net_price()" >
                        </div>	
                        
                        <div class="form-group">    
 						     <label>Address</label>   
       						 <input class="form-control " id = "customer_address"	name="customer_address" type="text">
                        </div>	
                        
  						<div class="form-group">       
						     <input class="form-control " id = "customer_id"	name="customer_id" type="hidden" >
                        </div>
                      </form>
      </div>
          <div class="modal-footer ">
        <button type="button" id = "submit" class="btn btn-info btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
        <span class="color:red">${deleteMessage}</span> 
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       <div class="form-group">       
						     <input class="form-control " id = "customer_id_delete"	name="customer_id" type="hidden" >
                        </div>
      </div>
        <div class="modal-footer ">
        <button id = "delete-yes" type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
</div>
</div>
    </div><!-- /.container -->
</body>
</html>
