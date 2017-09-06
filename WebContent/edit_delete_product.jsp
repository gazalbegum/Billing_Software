<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Edit/Delete product form</title>
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
                url = "/BillingSoftware/updateProduct"         
               
            $.post(url, $("#edit_delete_product_form").serialize(), function(getData) { 
               console.log(getData);       
            }, 'json');
            
            $('#delete_message').text("Product edited successfully")
        });
    	
    	$('#edit').on('hidden.bs.modal', function () {
    		 location.reload(true);
    		 $('#delete_message').text("Product edited successfully")
    		})
        
        /* delete modal submit */
        
        $('#delete-yes').click(function(event) {
        	
        	var productId = $('#product_id_delete').val();
        	 $('#delete').modal('hide');
        	console.log("delete-yes-productId :" +productId);
        	        	
        		 $.ajax({
        	            url:'/BillingSoftware/deleteProduct',
        	            data:{name:productId},
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
        		 $('#delete_message').text("Product deleted successfully")
        		 location.reload(true);
        });    	
        
    });	
	
    
    $('#delete').on('hidden.bs.modal', function () {
    	$('#delete_message').text("Product deleted successfully")
		 location.reload(true);
		 $('#delete_message').text("Product deleted successfully")
		 alert("Product deleted successfully");
		})
	
    /* edit function */
	
	'${list.productName}', '${list.hsnBac}', '${list.productPrice}',
			'${list.productGst}', '${list.priceAfterGst}',
			'${list.productQuantity}', '${list.productRate}'
	function editFunction(product_id, productName, hsnBac, productSGST, productCGST) {
		$('#product_name').val(productName);
		$('#hsn_bac').val(hsnBac);		
		$('#product_sgst').val(productSGST);	
		$('#product_cgst').val(productCGST);		
		$('#product_id').val(product_id);
	}

	
			/* delete function */
			
			function deletefunctionTest(productId){					
				$('#product_id_delete').val(productId);
				console.log("product id :" + $('#product_id_delete').val());			
			}
	
	
	  $(document).ready(function() {
		    $('#edit_delete_product_form').bootstrapValidator({
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
		            
		            $( '#edit_delete_product_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#edit_delete_product_form').click(function() {
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
<legend>EDIT/DELETE PRODUCTS</legend>
 
</fieldset>
<div class="row">
		
        
        <div class="col-md-12">
        <div class="table-responsive">
          <span id="delete_message" class="color:green"></span> 
                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Product Name</th>
                   <th>HSN / BAC</th>
                   <th>SGST</th>                 
                   <th>CGST</th>                
                   <th>Edit</th>                      
                   <th>Delete</th>
                   </thead>
    <tbody>
    <c:forEach items="${productBeans}" var="list">
     <tr>
         <td><input type="checkbox" class="checkthis" /></td>        
         <td>${list.productName}</td>
         <td>${list.productHsnBac}</td>
         <td>${list.productSGST}%</td>        
         <td>${list.productCGST}%</td> 
 		 <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" onclick="editFunction('${list.productId}','${list.productName}','${list.productHsnBac}','${list.productSGST}', '${list.productCGST}')"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
         <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash" onclick="deletefunctionTest('${list.productId}')"></span></button></p></td>     </tr>
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
          <form  action="updateProduct" method="post"  id="edit_delete_product_form">
						<div class="form-group">    
						     <label>Product Name</label>   
       						 <input class="form-control " id = "product_name"	name="product_name" type="text" readonly>
                        </div>							
                        
 						<div class="form-group"> 
 						     <label>HSN/BAC</label>      
       						 <input class="form-control " id = "hsn_bac"	name="hsn_bac" type="text" >
                        </div>	
                        
                       	<div class="form-group">    
 						     <label>SGST</label>   
       						 <input class="form-control " id = "product_sgst"	name="product_sgst" type="text" onkeyup="calculate_net_price()" >
                        </div>	
                        
                       	<div class="form-group">    
  						      <label>CGST</label>   
       						 <input class="form-control " id = "product_cgst"	name="product_cgst" type="text" onkeyup="calculate_net_price()" >
                        </div>	
                        
                      	<div class="form-group">       
						     <input class="form-control " id = "product_id"	name="product_id" type="hidden" >
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
						     <input class="form-control " id = "product_id_delete"	name="product_id" type="hidden" >
                        </div>
      </div>
        <div class="modal-footer ">
        <button id = "delete-yes" type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
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
