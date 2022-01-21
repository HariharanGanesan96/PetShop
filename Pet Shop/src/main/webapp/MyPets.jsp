<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Pets</title>
<link rel="stylesheet" href="MyPets.css">
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
		rgb(0, 0, 0, .4) 50%), url("./Images/background6.jpg");
    background-repeat: no-repeat;
	background-position:center;
	background-size: cover;
	background-attachment: fixed;
	text-transform: capitalize;
	font-weight:bold;
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
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	transition: 0.5s;
	font-weight: bold;
}

#menu a:hover {
	color: black;
}

#content {
	margin-top: 40px;
}

#content h2 {
	margin-top: 30px;
	margin-left: 20px;
	width: 150px;
	font-size: 30px;
	width: 150px;
}

.petlist {
	margin-top: 40px;
	padding-top: 20px;
	margin-left: 50px;
	transition: 0.5s;
}

h2:hover {
	color: black;
}

#pets {
	margin-left: 20px;
	margin-top: 20px;
	line-height: 1.5;
	font-size: 20px;
	background-color: transparent;
	border-radius: 10px;
}

#pets img {
	width: 320px;
	height: 250px;
	border-radius: 10px;
}

#pets p {
	margin-left: 10px;
	color: white;
}

#pets p a {
	margin-left: -10px;
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
</style>
</head>
<body>

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

	<%
	List<PetDetails> petList = new ArrayList<PetDetails>();
	Customers customerDetails = (Customers) session.getAttribute("customer");
	PetDetails pet = new PetDetails();
	PetDAO petdao = new PetDAO();
	petList = petdao.showMypetdetails(customerDetails.getCustomerId());
	int soldQty = 0;
	%>
	<div id="content">

		<h2>My Pet List</h2>
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
									<td class="petdetails">
										<p>Name</p>
										<p>Color</p>
										<p>price</p>
										<p>Total Qty</p>
										<p>Sold Qty</p>
										<p>Aavilable Qty</p>
										<p>Status</p> <%
 if (petDetails.getStatus().equals("Not approved")) {
 %>
										<p>
											<a href="EditPet.jsp?petid=<%=petDetails.getPetId()%>"><button
													type="button">Edit</button></a>
										</p> <%
 }
 %>
									</td>

									<td class="petdetails">
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
											<%=petDetails.getPetQty()%>
										</p> <%
 soldQty = petDetails.getPetQty() - petDetails.getAvilableQty();
 %>
										<p>
											:
											<%=soldQty%>
										</p>
										<p>
											:
											<%=petDetails.getAvilableQty()%></p>
										<p>
											:
											<%=petDetails.getStatus()%></p> <%
 if (petDetails.getStatus().equals("Not approved")) {
 %>
										<p>
											<a href=""><button type="button"
													onclick="deletePet('<%=petDetails.getPetId()%>')">Delete</button></a>
										</p> <%
 }
 %>
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
	<script type="text/javascript">
		function deletePet(petId) {
			var confirmAction = confirm("Are you sure you want delete this item");
			if (confirmAction) {

				console.log("called buy");
				console.log(petId);
				var url = "DeletePet.jsp?petId=" + petId;
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