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
  <link rel="stylesheet" href="AdminProfile.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
    <style type="text/css">
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
               <td><label for="firstname">FirstName</label></td>
               <td><input type="text" name="firstname" value="<%=adminDetails.getFirstName()%>"></td>
           </tr>
           <tr>   
               <td><label for="lastname">LastName</label></td>
               <td><input type="text" name="lastname" value="<%=adminDetails.getLastName()%>"></td>
           </tr>
            <tr>
                <td><label for="username"UserName>UserName</label></td>
                <td><input type="text" name="username" value="<%=adminDetails.getUserName()%>"></td>
            </tr>
              <tr>
                <td><label for="email">Email</label></td>
                <td><input type="text" name="email" value="<%=adminDetails.getEmail()%>"></td>
              </tr>
              <tr>
                <td><label for="number">number</label></td>
                <td><input type="text" name="number" value="<%=adminDetails.getNumber()%>"></td>
              </tr>     
              <tr>
			<td><a href="Logout.jsp"><button type="button" id="logout">Logout</button></a></td>
			</tr>         
        </tbody>
    </table>

</body>
</html>