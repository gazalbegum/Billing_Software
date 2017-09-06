<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script src="jchart.js"></script>

<div id="demo"></div>

$("#demo").jChart({

name: "North American Regional Population Loss 2014",

headers: ["Arizona","Michigan","Ontario","British Columbia","Texas"],

values: [250000,478000,88000,429000,423000],

footers: [100000,200000,300000,400000,500000],

colors: ["#1000ff","#006eff","#00b6ff","#00fff6","#00ff90"]

});<br type="_moz">
</body>
</html>