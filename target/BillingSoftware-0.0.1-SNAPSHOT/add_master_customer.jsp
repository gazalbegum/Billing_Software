<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Add customer form</title>
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
		    $('#customer_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	customer_name: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Add Customer Name'
		                    }
		                }
		            },
		            
		            customer_gst_in: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Add Customer GST'
		                    }
		                }
		            },
		            
		            customer_email_id: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer E-mail Address'
		                    },
		                    emailAddress: {
		                        message: 'Add Customer E-mail Address'
		                    } 
		                }
		            },
		            customer_phone: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer Mobile number'
		                    },
		                    stringLength: {
		                        max: 10,
		                        min: 10,
		                        message: 'Only 10 Digits'
		                    }
		                }
		            },
		            customer_address: {
		                validators: {
		                     stringLength: {
		                        min: 2,
		                    },
		                    notEmpty: {
		                        message: 'Add Customer Address'
		                    }
		                }
		            },
		            customer_company_name: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer Company Name'
		                    }
		                }
		            },
		            zip: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please supply your zip code'
		                    },
		                    stringLength: {
		                        max: 6,
		                        min: 6,
		                        message: 'Only 6 Digits'
		                    }
		            
		                }
		            },
		            comment: {
		                validators: {
		                      stringLength: {
		                        min: 10,
		                        max: 200,
		                        message:'Please enter at least 10 characters and no more than 200'
		                    },
		                    notEmpty: {
		                        message: 'Please supply a description of your project'
		                    }
		                    }
		                }
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
		            
		            $( '#customer_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#customer_form').click(function() {
		                location.reload(true);
		            });
		        });
		});


	  
	  // Allow Only numbers Validation
	  
	  $(document).ready(function () {
  //called when key is pressed in textbox
  $("#customer_phone").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
  $("#customer_phone").attr('maxlength','10');
});
	  
	  
	</script>
	
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
   <div class="container">

    <form class="well form-horizontal" action="addCustomer" method="post"  id="customer_form">
<fieldset>

<!-- Form Name -->
<legend>CUSTOMER FORM</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Customer Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="customer_name" placeholder="Customer Name" class="form-control"  type="text">
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">Customer GST</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
  <input  name="customer_gst_in" id="customer_gst_in" placeholder="Customer GST" class="form-control"  type="text">
    </div>
  </div>
</div>


<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="customer_email_id" placeholder="E-Mail Address" class="form-control"  type="text">
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">Phone #</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="customer_phone" id="customer_phone" placeholder="9876543210" class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">Address</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <input name="customer_address" placeholder="Address" class="form-control" type="text">
    </div>
  </div>
</div>


<!-- Success message -->
<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Customer details submitted successfully!</div>

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
