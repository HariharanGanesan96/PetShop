<%@page import="com.petshop.daoimpl.OrderItemsDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.petshop.model.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link rel="stylesheet" href="MyOrders.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/aeca6704b2.js"
	crossorigin="anonymous"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	color: white;
}

body {
	background-image: linear-gradient(rgba(0, 0, 0, .4) 50%,
		rgb(0, 0, 0, .4) 50%), url("./Images/background8.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	color: white;
	text-transform: capitalize;
}

.navigation {
	padding-top: 15px;
	font-family: sans-serif;
}

h1 {
	display: inline;
	width: 300px;
	position: absolute;
	top: 10px;
	left: 10px;
	font-size: 25px;
}


#menu li {
	display: inline;
}

#menu a {
	float: right;
	padding-right: 20px;
	margin-top: 2px;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	transition: 0.5s;
	font-weight: bold;
}

#menu a:hover {
	color: black;
}

h2 {
	margin-top: 60px;
	margin-left: 40px;
	width: 150px;
	font-size: 30px;
	width: 150px;
	margin-bottom: 20px;
}

hr{
 border: 1px solid;
 margin-left: 30px;
 margin-right: 30px;
  
}

h2:hover {
	color: black;
}

table {
    margin-top:-15px;
	padding: 30px;	
}
table tr, th, td {
	padding: 15px;
	width:150px;
	font-size: 20px;
	text-align: center;
}

button {
	margin-left: 1175px;
	width: 120px;
	height: 30px;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 15px;
	font-weight: bold;
	margin-bottom:20px;
	background-color: rgb(16, 177, 16);
	box-shadow: 0 0 5px black;
}
button:hover {
color: black;
background-color: white;
}
</style>
</head>
<body>
	<%
	

		Customers customerDetails = new Customers();
		customerDetails = (Customers) session.getAttribute("customer");
		OrderItemsDAO orderItemDao = new OrderItemsDAO();
		List<OrderItems> orderItemList = orderItemDao.showMyOrdersItemsList(customerDetails);
		SimpleDateFormat formet = new SimpleDateFormat("dd-MM-yyyy");
	%>

	<div class="navigation">
		<h1>
			<i class="fas fa-paw" style="color: white;"></i> Pet Shop
		</h1>
		<ul id="menu">
			<li><a href="myprofile.jsp">My Profile</a></li>
			<li><a href="mycart.jsp">My cart</a></li>
			<li><a href="myorders.jsp">My orders</a></li>
			<li><a href="AddItem.jsp">Add item</a></li>
			<li><a href="MyPets.jsp">My pets</a></li>
			<li><a href="home.jsp">Home</a></li>
		</ul>
	</div>

	<h2>My orders</h2>
	<%
	int size = orderItemList.size();
	for (int i = 0; i < orderItemList.size();) {
	%>
	<table>
		<tr>
			<th>Order id</th>
			<th>Pet id</th>
			<th>Pet name</th>
			<th>Unit_price</th>
			<th>Quantity</th>
			<th>Total price</th>
			<th>Status</th>
			<th>Order date</th>
		</tr>

		<%
		while (i < size) {
		%>
		<tr>
			<td><%=orderItemList.get(i).getOrders().getOrderId()%></td>
			<td><%=orderItemList.get(i).getPet().getPetId()%></td>
			<td><%=orderItemList.get(i).getPet().getPetName()%></td>
			<td><%=orderItemList.get(i).getUnitPrice()%></td>
			<td><%=orderItemList.get(i).getQuantity()%></td>
			<td><%=orderItemList.get(i).getTotalPrice()%></td>
			<td><%=orderItemList.get(i).getOrders().getOrderStatus()%></td>
			<%
			Date date = orderItemList.get(i).getOrders().getOrderDate();
			String orderDate = formet.format(date);
			%>
			<td><%=orderDate%></td>
			<%
			if (i < (size - 1)) {
				if (orderItemList.get(i).getOrders().getOrderId() != orderItemList.get((i + 1)).getOrders().getOrderId()) {
					i++; 
					break;
				}
			}
			i++;
			}
			%>

		</tr>

	</table>
	<%
	String status = orderItemList.get(i - 1).getOrders().getOrderStatus();
	if (status.equals("NotDelivered")) {
	%>
	<button type="button"
		onclick="cancelOrder('<%=orderItemList.get(i - 1).getOrders().getOrderId()%>')">Cancel
		order</button>	
		
	<%
	
	}
	%>
	<hr><%
	}
	%>

	<script type="text/javascript">
		function cancelOrder(orderId) {
			console.log(orderId);
			var confirmAction = confirm("Are you sure you want cancel this item");
			if (confirmAction) {
				var url = "CancelOrder.jsp?orderId=" + orderId;
				console.log(url);
				if (window.XMLHttpRequest) {
					request = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					request = new ActiveXObject("Microsoft.XMLHTTP");
				}
				try {
					request.onreadystatechange = getInfo;
					request.open("GET", url, true);
					request.send();
				} catch (e) {
					alert("Unable to connect to server");
				}
			} else {
				alert("Action canceled");
			}
		}
		
		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				alert(val);
				location.reload();
			}
		}
	</script>
</body>
</html>