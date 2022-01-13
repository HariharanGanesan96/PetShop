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
<link rel="stylesheet" href="UserList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
<style type="text/css">

body{
   background-image:linear-gradient(rgba(0,0,0,.1)50%,rgb(0,0,0,.1)50%), url("https://images.pexels.com/photos/7282845/pexels-photo-7282845.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
   background-repeat: no-repeat;
   background-size: cover;
   background-attachment: fixed;
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
    margin-top: 8px;
    transition: 0.5s;
}
#menu a:hover{
    color: tomato;
}
table{
background-color: rgba(255, 254, 254, 0.815);
position:absolute;
top: 100px;
margin-left: 40px;
font-size: 20px;
text-align:center;
border: 1px soild black;
color:black;
}
table th,tr{
margin: 10px 10px 10px 10px;
padding: 25px 25px 25px 25px;

}
</style>
</head>
<body>
<%
  Customers customerDetails=new Customers();
  CustomerDAO customerDao=new CustomerDAO();
  List<Customers> customerList=customerDao.showCustomerList();
		  
%>
        <div class="navigation">
       	<h1><i class="fas fa-paw" style="color: white;"></i> Pet Shop</h1>
        <ul  id="menu">
        <li><a href="AdminProfile.jsp">My Profile</a></li>
        <li><a href="UserList.jsp">User List</a></li>
        <li><a href="AdminHome.jsp">Home</a></li>
        </ul>
        </div>

<table border="1" cellspacing="0px">
<thead>
<tr>
<th >Id</th>
<th >First Name</th>
<th>Last Name</th>
<th>Gender</th>
<th>User Name </th>
<th>Email</th>
<th>Number</th>
</tr>
</thead>
<tbody>
<%for(Customers customer:customerList){ %>
<tr>
<td  ><%=customer.getCustomerId()%></td>
<td ><%=customer.getFirstName()%></td>
<td><%=customer.getLastName()%></td>
<td><%=customer.getGender()%></td>
<td><%=customer.getUserName()%></td>
<td><%=customer.getEmail()%></td>
<td><%=customer.getNumber()%></td>
</tr>
<%} %>
</tbody>
</table>
</body>
</html>