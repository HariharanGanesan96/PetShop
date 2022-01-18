<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Details</title>
<link rel="stylesheet" href="PetDescription.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
    <style type="text/css">
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

h2 {
	margin-top: 50px;
	margin-left: 30px;
	width: 150px;
	font-size: 30px;
}

table img{
	width: 500px;
	height: 400px;
}
table td p{
	line-height: 2;
	margin-left: 15px;
	font-size: 20px;
}

#description{
	width: 450px;
	position: absolute;
	font-size:20px;
	text-align:justify;
	top: 135px;
	left: 870px;
	line-height: 2;
}

#description button{
	width: 130px;
	height: 30px;
	font-size: 17px;
	font-weight: bold;
	color: white;
	background-color:  rgb(16, 177, 16);
	border: none;
	border-radius: 5px; 
	box-shadow: 0 0 5px black;
}

#quantity{
	width: 50px;
	height: 25px;
	border:none;
	border-radius: 5px;
	
}
    </style>
</head>
<body>
	<%
	

		//List<PetDetails> petList=new ArrayList<PetDetails>();
		PetDetails pet = new PetDetails();
		PetDAO petdao = new PetDAO();
		int petid = Integer.parseInt(request.getParameter("petid"));
		pet = petdao.showCurrentPet(petid);
		session.setAttribute("pet", pet);
		Customers customerDetails = (Customers) session.getAttribute("customer");
		SimpleDateFormat formet = new SimpleDateFormat("dd-MM-yyyy");
		Date date = pet.getPetDob();

		String dob = formet.format(date);

		session.setAttribute("message", " ");
	%>
	<div class="navigation">
		<h1>
			<i class="fas fa-paw" style="color: white;"></i> Pet Shop
		</h1>
		<input type="search" id="searchinput"
			placeholder="Enter pet category or name">
		<button id="search">search</button>
		<ul id="menu">
			<li><a href="myprofile.jsp">My Profile</a></li>
			<li><a href="mycart.jsp">My cart</a></li>
			<li><a href="myorders.jsp">My orders</a></li>
			<li><a href="AddItem.jsp">Add item</a></li>
			<li><a href="MyPets.jsp">My pets</a></li>
			<li><a href="home.jsp">Home</a></li>
		</ul>
	</div>
	
	<h2>Pet Details</h2>
	
		<table>
			<tbody>
				<tr>
					<td><img src="./Pets/<%=pet.getPetImage()%>" alt=""></td>
					<td>
					    <p>
							<b>Id</b>
						</p>
					    <p>
							<b>Type</b>
						</p>
						<p>
							<b>Name</b>
						</p>
						<p>
							<b>Gender</b>
						</p>
						<p>
							<b>Date Of Birth</b>
						</p>
						<p>
							<b>Color</b>
						</p>
						<p>
							<b>Unit Price</b>
						</p>
						<p>
							<b>Available Qty</b>
						</p>
						<p>
							<b>Supplier Name</b>
						</p></td>
					<td><p>:<%=pet.getPetId()%></p>
						<p>:<%=pet.getPetType()%></p>
						<p>:<%=pet.getPetName()%></p>
						<p>:<%=pet.getPetGender()%></p>
						<p>:<%=dob%></p>
						<p>:<%=pet.getPetColor()%></p>
						<p>:<%=pet.getPetprice()%></p>
						<p>:<%=pet.getAvilableQty()%></p>
						<p>:<%=pet.getCustomer().getFirstName()%></p>
					</td>

				</tr>
			</tbody>
		</table>

		<div id="description">
			<p style="	text-transform: none;">
				<b>Description: </b><br><%=pet.getDescription()%>
			<p>
			<p>
				Quantity : <input type="number" id="quantity"
					max="<%=pet.getAvilableQty()%>" min="0" name="quantity" style="color: black;">
			</p>
			<p>
				<button type="button" onclick="addToCart()">Add to Cart</button>
				<button type="button" onclick="buyNow()">Buy Now</button>
			</p>
			<p name="message" id="message">
			<p>
		</div>
		<tr>
			<script>
    
    
    function addToCart(){     
        let qty=document.getElementById("quantity").value;
        console.log(qty);
        if(qty>0){
        document.getElementById("message").innerHTML=" ";
    	var url="AddToCart.jsp?quantity="+qty;  
    	
    	if(window.XMLHttpRequest){  
    		request=new XMLHttpRequest();  
    		}  
    		else if(window.ActiveXObject){  
    		request=new ActiveXObject("Microsoft.XMLHTTP");  
    		}  
    	try  
    	{  
    	request.onreadystatechange=getInfo;  
    	request.open("GET",url,true);  
    	request.send();  
    	}  
    	catch(e)  
    	{  
    	alert("Unable to connect to server");  
    	}
        }
        else{
        	alert("invalid qty");
        }
    } 
    
    function getInfo(){  
    	if(request.readyState==4){  
    	var val=request.responseText;
    	   alert(val) ;
    	}  
    	}  
    
    
    // buy Now
    function buyNow(){  
    	var address='<%=customerDetails.getAddress()%>';
					if (address == 'none') {
						alert("Please add address before buy");
					} 
					else {
						var confirmAction = confirm("Are you sure you want buy this item");
						if (confirmAction) {
							console.log("called but");
							let qty = document.getElementById("quantity").value;
							console.log(qty);
							if (qty > 0) {
								document.getElementById("message").innerHTML = " ";
								var url = "BuyNow.jsp?quantity=" + qty;
								if (window.XMLHttpRequest) {
									request = new XMLHttpRequest();
								} else if (window.ActiveXObject) {
									request = new ActiveXObject(
											"Microsoft.XMLHTTP");
								}
								try {
									request.onreadystatechange = getInfoBuy;
									request.open("GET", url, true);
									request.send();
								} catch (e) {
									alert("Unable to connect to server");
								}
							
						} 
							else {
							alert("Invalid quantity");
						}
						}
						else {
							  alert("Action canceled");
					}
				}
    }
				function getInfoBuy() {
					if (request.readyState == 4) {
						var val = request.responseText;
						alert(val);
					}
				}
			</script>
</body>
</html>