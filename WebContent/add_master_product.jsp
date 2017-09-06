<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Add product form</title>
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
	  $(document).ready(function() {
		    $('#product_form').bootstrapValidator({
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
		                        message: 'Add Product'
		                    }
		                }
		            },
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
		                        message: 'Add SGST'
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
		                        message: 'Add CGST'
		                    },
		                    
		                    stringLength: {
		                        max: 2,
		                        message: 'Max 2 digit'
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
		            
		            $( '#product_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#product_form').click(function() {
		                location.reload(true);
		            });
		        });
		});

	  
	  
	  
	  // Allow Only numbers Validation
	  
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

    <form class="well form-horizontal" action="addProduct" method="post"  id="product_form">
<fieldset>

<!-- Form Name -->
<legend>PRODUCT FORM</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Product Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
  <input  name="product_name" id="product_name" placeholder="Product Name" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">HSN/BAC</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></span>
  <input name="product_hsn_bac" id="product_hsn_bac" placeholder="hsn/bac" class="form-control"  type="text">
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">SGST</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
  <input name="product_sgst" id= "product_sgst" placeholder="SGST(%)" class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">CGST</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
  <input name="product_cgst" id= "product_cgst" placeholder="CGST(%)" class="form-control" type="text">
    </div>
  </div>
</div>


<!-- Success message -->
<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Product details submitted successfully!</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-warning" >Send <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>

</fieldset>
</form>
</div>
    </div><!-- /.container -->
</body>
</html>
