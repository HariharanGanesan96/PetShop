<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="com.petshop.model.*"%>
<%@page import="com.petshop.model.CartItems"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet" href="MyCart.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
    <style type="text/css">
* {
	margin: 0;
	padding: 0;
	color: white;
}

body {
	background-image: linear-gradient(rgba(0, 0, 0, .4) 50%,
		rgb(0, 0, 0, .4) 50%), url("./Images/myordersbackground.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	text-transform: capitalize;
	color: white;
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
}

h2:hover {
	color: black;
}


table{
	font-size: 20px;
	margin-top: 20px;
}
table p {
	margin-left: 20px;
}

table img {
	width: 400px;
	height: 350px;	
    margin-left: 30px;
}

table tr,th,td{
line-height: 2;
}
	
#buynow{
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-weight:bold;
	color: white;
    border: none;
	border-radius: 5px;
	background-color:  rgb(16, 177, 16);
	box-shadow: 0 0 5px black;
}

#view{
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-weight:bold;
	color: white;
    border: none;
	border-radius: 5px;
	background-color:  rgb(16, 177, 16);
	box-shadow: 0 0 5px black;
}

#remove{
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-weight:bold;
	color: white;
    border: none;
	border-radius: 5px;
	background-color: tomato ;
	box-shadow: 0 0 5px black;
}

#buyall{
	margin-left: 450px;
	margin-top:30px;
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-weight:bold;
	color: white;
    border: none;
	border-radius: 5px;
	background-color:  rgb(16, 177, 16);
	box-shadow: 0 0 5px black;	
}
#removeall{
	margin-left: 20px;
	margin-top:30px;
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-weight:bold;
	color: white;
    border: none;
	border-radius: 5px;
	background-color: tomato;	
	box-shadow: 0 0 5px black;
}
#empty{
	position:absolute;
	margin-top: 40px;
	margin-left: 40px;
	font-size: 30px;
}
#move p{
margin-left: -260px;
}
    
    </style>
</head>
<body>
	<%
		CartItemsDAO cartItemDao = new CartItemsDAO();
		Customers customerDetails = new Customers();
		customerDetails = (Customers) session.getAttribute("customer");
		List<CartItems> cartList = new ArrayList<CartItems>();
		cartList = cartItemDao.showAllCartItems(customerDetails);
		PetDetails pet = new PetDetails();
		PetDAO petDao = new PetDAO();
		session.setAttribute("cartList", cartList);
	%>

		<div class="navigation">
				<h1><i class="fas fa-paw" style="color: white;"></i> Pet Shop</h1>
			<ul id="menu">
				<li><a href="myprofile.jsp">My Profile</a></li>
				<li><a href="mycart.jsp">My cart</a></li>
				<li><a href="myorders.jsp">My orders</a></li>
				<li><a href="MyPets.jsp">My pets</a></li>
				<li><a href="AddItem.jsp">Add item</a></li>
				<li><a href="home.jsp">Home</a></li>
			</ul>
		</div>
    <h2>My Cart</h2>
    
	<table>
		<%
		

				double totalAmount = 0;
				for (CartItems cartItems : cartList) {
			totalAmount += cartItems.getTotalPrice();
			pet = petDao.showCurrentPet(cartItems.getPet().getPetId());
		%>
		<tr>
			<td><img src="./Pets/<%=cartItems.getPet().getPetImage()%>" alt="petimage"></td>

			<td><p>
					Item id</span>
				</p>
				<p>
					Pet id</p>
				<p>
					Pet Type</p>
				<p>
					Pet Name</p>
				<p>
					Quantity
				</p>
				<p>
					Unit_price</p>
				<p>

					Total price</p>

				<p>
					<a
						href="PetDescription.jsp?petid=<%=cartItems.getPet().getPetId()%>"><button
							id="view">View</button></a>
					<button type="button" id="buynow"
						onclick="buy('<%=cartItems.getItemId()%>')">BuyNow</button>
					<button type="button"
						onclick="removeCart('<%=cartItems.getItemId()%>')" id="remove">Remove</button>
					<%
					String message = "message" + cartItems.getItemId();
					%>
				
				<p name="message" id="<%=message%>">
				</td>
				<td id="move"><p>
					 : <span id="itemid"><%=cartItems.getItemId()%></span>
				</p>
				<p>
					 : <%=cartItems.getPet().getPetId()%></p>
				<p>
					 : <%=cartItems.getPet().getPetType()%></p>
				<p>
					 : <%=cartItems.getPet().getPetName()%></p>
				<p>
					 : <span id="quantity"><%=cartItems.getQuantity()%></span>
				</p>
				<p>
					 : <%=cartItems.getUnitPrice()%></p>
				<p>

				     : <%=cartItems.getTotalPrice()%></p>
				 <p style="visibility: hidden;">empty</p>
				</td>

		</tr>
		<%
		}
		session.setAttribute("totalCartAmount", totalAmount);
		%>
	</table>
	<%
	if (cartList.size() > 0) {
		if (cartList.size() > 1) {
	%>
	<button id="buyall" onclick="buyAll()">Buyall</button>
	<button id="removeall" onclick="removeAll()" >Remove All</button>
	
	<p>
		<%
		}
		} else {
		%>
	
	<h1 id="empty" style="margin-top: 140px">Your cart is empty</h1>
	<%
	}
	%>

	<script type="text/javascript">
	
	
		//buy all
		function buyAll() {
			var address='<%=customerDetails.getAddress()%>';
			if(address!='none'){
				
		    var confirmAction = confirm("Are you sure you want buy this item");
		       if (confirmAction) {
			   console.log("called");
		       var url = "BuyAll.jsp";
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
		    }
		   else{
			   alert("Action canceled");
		   }
		   }
		   else{
				alert("please update address before buy");
			}
		}

		

		//buy
		function buy(itemId) {
			var address='<%=customerDetails.getAddress()%>';
			if (address != 'none') {
				var confirmAction = confirm("Are you sure you want buy this item");
				if (confirmAction) {

					console.log("called buy");
					console.log(itemId);
					var url = "CartBuy.jsp?itemId=" + itemId;
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

			} else {
				alert("please update address before buy");
			}
		}

		// remove cart
		function removeCart(itemId) {
			var confirmAction = confirm("Are you sure you want remove this item");
			if (confirmAction) {

				console.log("called buy");
				console.log(itemId);
				var url = "RemoveCartItem.jsp?itemId=" + itemId;
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

		//remove all
		function removeAll() {
			var confirmAction = confirm("Are you sure you want remove all this item");
			if (confirmAction) {
				var url = "RemoveAllCartItems.jsp";
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
				//document.getElementById('messageall').innerHTML = val;
			}
		}
	</script>
</body>
</html>