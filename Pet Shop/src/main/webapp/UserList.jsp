<%@page import="com.petshop.model.*"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/aeca6704b2.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-image: linear-gradient(rgba(0, 0, 0, .5) 50%,
		rgb(0, 0, 0, .5) 50%), url("./Images/background1.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
	background-size: cover;
	background-attachment: fixed;
	color: white;
}

.head {
	height: 40px;
	width: 100%;
	padding-top: 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
}

h1 {
	display: inline;
	width: 300px;
	position: absolute;
	top: -5px;
	left: 10px;
	font-size: x-large;
}

#menu {
	height: 40px;
	display: inline;
}

#menu li {
	display: inline;
}

#menu a {
	color: white;
	font-size: 22px;
	font-weight: bold;
	text-decoration: none;
	float: right;
	padding-right: 20px;
	margin-top: 8px;
	transition: 0.5s;
}

#menu a:hover {
	color: tomato;
}

h2 {
	margin-top: 50px;
	margin-left: 30px;
}

table {
	top: 90px;
	margin: 40px;
	font-size: 20px;
}
table tr,th{
padding: 10px;
}
</style>
</head>
<body>
	<%
		Customers customerDetails = new Customers();
		CustomerDAO customerDao = new CustomerDAO();
		List<Customers> customerList = customerDao.customersList();
	%>
	<div class="navigation">
		<h1>
			<i class="fas fa-paw" style="color: white;"></i> Pet Shop
		</h1>
		<ul id="menu">
			<li><a href="AdminProfile.jsp">My Profile</a></li>
			<li><a href="UserList.jsp">User List</a></li>
			<li><a href="AdminHome.jsp">Home</a></li>
		</ul>
	</div>


	<div>
		<h2>Customers List</h2>
	</div>
	<table class="table table-bordered" style="width: 500px;">
		<thead>

			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>User Name</th>
				<th>Email</th>
				<th>Number</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Customers customer : customerList) {
			%>
			<tr>
				<td class="text-capitalize"><%=customer.getCustomerId()%></td>
				<td class="text-capitalize"><%=customer.getFirstName()%></td>
				<td class="text-capitalize"><%=customer.getLastName()%></td>
				<td class="text-capitalize"><%=customer.getGender() %></td>
				<td><%=customer.getUserName()%></td>
				<td><%=customer.getEmail()%></td>
				<td><%=customer.getNumber()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>