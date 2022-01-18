<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="com.petshop.controller.login"%>
<%@page import="com.petshop.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin profile</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
  <style type="text/css">
   
   
   body{
   background-image:linear-gradient(rgba(0,0,0,.5)50%,rgb(0,0,0,.5)50%), url("./Images/background1.jpg");
   background-repeat: no-repeat;
   background-size: cover;
   height:100vh;
   text-transform: capitalize;
   color:white;
   
}
.head{
    height: 40px;
    width: 100%;
    padding-top: 15px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;   
}

h1{
    display: inline;
    width: 300px;
    position: absolute;
    top: 5px;
    left: 10px;
    font-size: x-large;
}
#menu {
    height: 40px;
    display: inline;
}
#menu li{
    display: inline;
}
#menu a{
    color: white;
    font-size:22px;
    font-weight: bold;
    text-decoration: none;
    float: right;
    padding-right: 20px;
    margin-top: -10px;
    transition: 0.5s;
}
#menu a:hover{
    color: tomato;
}
h1{
    display: inline;
    width: 300px;
    position: absolute;
    font-size: x-large;
    margin-top: 5px;
}
input:focus{
    outline: none;
}

#menu {
    display: inline;
}
#menu li{
    display: inline;
}
#menu a{
    text-decoration: none;
    float: right;
    padding-right: 20px;
    margin-top: 10px;
}
table{
margin: 40px;
font-size: 20px;
font-weight: bold;}

table img{
    width: 300px;
    height: 350px;
    border: 1px solid;
    border-color:black;
}
table tr,td{
    padding-left: 25px;
    padding-top: 20px;
}
    #logout {
	width: 130px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: tomato;
	border: none;
	margin: auto;
	border-radius: 10px;
	box-shadow: 0 0 5px black;
}
</style>
</head>
<body>
<% Admin adminDetails=new Admin();
  adminDetails=(Admin)session.getAttribute("Admin");%>

        <div class="navigation">
        	<h1><i class="fas fa-paw" style="color: white;"></i> Pet Shop</h1>
        <ul  id="menu">
        <li><a href="Adminprofile.jsp">My Profile</a></li>
        <li><a href="UserList.jsp">User List</a></li>
        <li><a href="AdminHome.jsp">Home</a></li>
        </ul>
        </div>
    
    <table>
        <tbody>
            <tr>
               <td rowspan="5"><img src="https://media1.popsugar-assets.com/files/thumbor/gMCOEkYB_3qTEDUrUbxtJkuusAA/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2017/07/12/947/n/1922153/c6f2e6f1596698606ad0d6.04019961_edit_img_image_15110365_1499895175/i/Chris-Hemsworth-Grooming-Interview.jpg" alt=""></td>
               <td>FirstName</td>
               <td> : <%=adminDetails.getFirstName()%></td>
           </tr>
           <tr>   
               <td>LastName</td>
               <td> : <%=adminDetails.getLastName()%></td>
           </tr>
            <tr>
                <td>UserName</td>
                <td> : <%=adminDetails.getUserName()%></td>
            </tr>
              <tr>
                <td>Email</td>
                <td> : <%=adminDetails.getEmail()%></td>
              </tr>
              <tr>
                <td>Number</td>
                <td> : <%=adminDetails.getNumber()%></td>
              </tr>     
              <tr>
			<td><a href="Logout.jsp"><button type="button" id="logout">Logout</button></a></td>
			</tr>         
        </tbody>
    </table>

</body>
</html>