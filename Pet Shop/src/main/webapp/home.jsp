<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/aeca6704b2.js"
	crossorigin="anonymous"></script>
<style type="text/css">
@charset "ISO-8859-1";

* {
	margin: 0;
	padding: 0;
	color: white;
}

body {
	background-image: linear-gradient(rgba(0, 0, 0, .5) 50%,
		rgb(0, 0, 0, .5) 50%), url("./Images/background.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
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

#searchinput {
	padding-left: 10px;
	position: absolute;
	font-size: 17px;
	top: 13px;
	left: 230px;
	width: 300px;
	height: 30px;
	border: 1px solid;
	border-color: tomato;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	background-color: transparent;
	border-right: none;
}

#searchinput::placeholder {
	color: white;
}

#search {
	position: absolute;
	left: 530px;
	width: 100px;
	height: 30px;
	margin-top: -2px;
	border: 1px solid;
	border-color: tomato;
	font-size: 17px;
	font-weight: bold;
	border-top-right-radius: 10px;
	border-left: none;
	background-color: tomato;
}

#search:hover {
	background-color: white;
	border-color: white;
	color: black;
}

#menu li {
	display: inline;
}

#menu a {
	float: right;
	padding-right: 20px;
	margin-top: 2px;
	font-size: 20px; font-weight : bold;
	text-decoration: none;
	transition: 0.5s;
	font-weight: bold;
}

#menu a:hover {
	color: black;
}

.petlist {
	margin-top: 40px;
	padding-top: 20px;
	margin-left: 50px;
	transition: 0.5s;
}

.petlist:hover {
	color: black;
}

.content h2 {
	margin-top: 30px;
	width: 150px;
	font-size: 30px;
}

#pets {
	margin-left: 45px;
	margin-top: 20px;
	line-height: 2;
	font-size: 20px;
}

#pets p {
	margin-left: 10px;
	font-weight: bold;
}

#pets button {
	margin-left: 10px;
	margin-top: 5px;
	width: 120px;
	height: 30px;
	background-color: rgb(16, 177, 16);
	border-radius: 10px;
	border: none;
	color: white;
	font-size: 17px;
	font-weight: bold;
	box-shadow: 0 0 5px black;
}

#pets button:hover {
	background-color: white;
	color: black;
}

#pets img {
	width: 350px;
	height: 280px;
	border-radius: 10px;
}

#petdetails {
	width: 70px;
}

input:focus {
	outline: none;
}
</style>
</head>
<body>

	<%
	List<PetDetails> petList = new ArrayList<PetDetails>();
	Customers customerDetails = (Customers) session.getAttribute("customer");
	PetDetails pet = new PetDetails();
	PetDAO petdao = new PetDAO();
	petList = petdao.showAllpets(customerDetails);
	%>

	<div class="navigation">
		<h1>
			<i class="fas fa-paw" style="color: white;"></i> Pet Shop
		</h1>
		<form action="Search.jsp">
		<input type="search" name="search" id="searchinput"
			placeholder="Enter pet category or name">
		<button type="submit" id="search">search</button>
		</form>
		<ul id="menu">
			<li><a href="myprofile.jsp">My Profile</a></li>
			<li><a href="mycart.jsp">My cart</a></li>
			<li><a href="myorders.jsp">My orders</a></li>
			<li><a href="AddItem.jsp">Add item</a></li>
			<li><a href="MyPets.jsp">My pets</a></li>
			<li><a href="home.jsp">Home</a></li>
		</ul>
	</div>
	<div class="content">
		<h2 class="petlist">Pet Lists</h2>
		<table>
			<tbody>
				<tr>
					<%
					int count = 0;
					for (PetDetails petDetails : petList) {
					%>
					<td>
						<table id="pets">
							<tbody>
								<tr>
									<td><img src="./Pets/<%=petDetails.getPetImage()%>"
										alt="petimage"></td>
									<td id="petdetails">
										<p>Type</p>
										<p>Name</p>
										<p>Color</p>
										<p>price</p>
										<p>Qty</p>
										<p style="visibility: hidden;">empty</p>
									</td>
									<td>
										<p>
											:
											<%=petDetails.getPetType()%>
										</p>
										<p>
											:
											<%=petDetails.getPetName()%>
										</p>
										<p>
											:
											<%=petDetails.getPetColor()%>
										</p>
										<p>
											: Rs.<%=petDetails.getPetprice()%>
										</p>
										<p>
											:
											<%=petDetails.getAvilableQty()%></p>
										<p>
											<a
												href="PetDescription.jsp?petid=<%=petDetails.getPetId()%>"><button>view</button></a>
										</p>
									</td>
								</tr>
							</tbody>
						</table>


					</td>
					<%
					count++;
					if (count == 2) {
					%>
				</tr>
				<tr>
					<%
					count = 0;
					}
					}
					%>

				</tr>
			</tbody>
		</table>
	</div>	
</body>
</html>
</html>