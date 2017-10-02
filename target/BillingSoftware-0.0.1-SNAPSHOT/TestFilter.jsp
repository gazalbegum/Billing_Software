<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="resources/jquery/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
var $rows = $('#table tr');
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
<input type="text" id="search" placeholder="Type to search">
<table id="table">
   <tr>
      <td>Apple</td>
      <td>Green</td>
   </tr>
   <tr>
      <td>Grapes</td>
      <td>Green</td>
   </tr>
   <tr>
      <td>Orange</td>
      <td>Orange</td>
   </tr>
</table>
</body>
</html>