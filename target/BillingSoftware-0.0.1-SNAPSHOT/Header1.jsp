<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Example of Bootstrap 3 Static Navbar</title>
 <!--  javascript reference -->

        <script src="resources/jquery/js/jquery-1.9.1.js"></script>
        <script src="resources/bootstrap/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
        <script src="resources/bootstrap/bootstrapvalidator-0.5.2/dist/js/bootstrapValidator.min.js"></script>
   
 	<!-- css reference -->
 	   
 	  <spring:url value="resources/bootstrap/bootstrap-3.3.7/dist/css/bootstrap.min.css" var="bootstrapCSS" />
	  <link rel="stylesheet" href="${bootstrapCSS}">
<style type="text/css">
    .bs-example{
    	margin: 20px;
    }
</style>
</head> 
<body>
<div class="bs-example">
    <nav class="navbar navbar-default">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- <a href="#" class="navbar-brand">Purvi Automation Control</a>  -->
        </div>
        <!-- Collection of nav links and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav nav nav-pills nav-justified">
                <li><a href="${pageContext.request.contextPath}/add_master_customer.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/add_master_customer.jsp">Customer</a></li>
                <li><a href="${pageContext.request.contextPath}/add_master_product.jsp">Product</a></li>
                <li><a href="${pageContext.request.contextPath}/add_product_billing.jsp">Inovice</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Logout</a></li>
            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                
            </ul> -->
        </div>
    </nav>
</div>
</body>
</html>                                		