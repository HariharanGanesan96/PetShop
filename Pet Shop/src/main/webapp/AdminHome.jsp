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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
    <style type="text/css">
 *{
    margin: 0;
    padding: 0;
    color: white;
}
body{
  background-image: linear-gradient(rgba(0, 0, 0, .5) 50%,
		rgb(0, 0, 0, .5) 50%),
		url("./Images/background1.jpg");
 	background-repeat: no-repeat;
	background-position:center;
	background-size: cover;
	background-attachment: fixed;
	color: white;
	text-transform: capitalize;
}
.head{
    height: 40px;
    width: 100%;
    padding-top: 15px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;  
  
}
a:active {
    background-color: yellow;
  }
h1{
    display: inline;
    width: 300px;
    position: absolute;
    top: 15px;
    left: 10px;
    font-size: 25px;
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
    font-size:20px;
    font-weight: bold;
    text-decoration: none;
    float: right;
    padding-right: 20px;
    margin-top: 2px;
    transition: 0.5s;
}
#menu a:hover{
    color: tomato;
}
.petlist{
    margin-top: 40px;
    padding-top:20px;
    margin-left: 30px;
    transition: 0.5s;
    width: 350px;
}
 h2:hover{
    color: tomato;
}

#pets img{
    width: 350px;
    height: 280px;
    border-radius: 10px;
   
}
#pets {
    margin-left: 25px;
    margin-top: 20px;
    line-height: 2;
    font-size: 18px;
    background-color:  transparent;
    border-radius: 10px;
}

.petdetails{
    width: 300px;
}
#pets pre{
    font-family:sans-serif;
    margin-left: 10px;
    color: white;
}
#pets button{
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
    </style>
    
</head>
<body>
<%      List<PetDetails> petList=new ArrayList<PetDetails>();
        PetDetails pet=new PetDetails();
        PetDAO petdao=new PetDAO();      
        petList=petdao.showNotApprovedPetList();
       %>
    <div class="backgroundpage">
        <div class="head">
        <div class="navigation">
        <h1><i class="fas fa-paw" style="color: white;"></i> PET SHOP</h1>
        <ul  id="menu">
        <li><a href="AdminProfile.jsp">My Profile</a></li>
        <li><a href="UserList.jsp">User List</a></li>
        <li><a href="AdminHome.jsp">Home</a></li>
        </ul>
        </div>
        
        <h2 class="petlist">Not Approved Pet List</h2>
        
        <div class="not approved list">
        <table>
            <tbody>
                <tr>
                <%int count=0;
                for(PetDetails petDetails: petList){
                	%>
                    <td>
                        <table id="pets">
                            <tbody>
                                <tr>
                                    <td><img src="./Pets/<%=petDetails.getPetImage()%>" alt="pet image"></td>    
                                    <td class="petdetails">
                                        <pre>Type       : <%=petDetails.getPetType()%> </pre>
                                        <pre>Name     : <%=petDetails.getPetName()%>  </pre>
                                        <pre>Color      : <%=petDetails.getPetColor()%> </pre>
                                        <pre>price       : Rs.<%=petDetails.getPetprice() %> </pre>
                                        <pre>Quantity : <%=petDetails.getAvilableQty() %></pre>
                                        <pre>Status    : <%=petDetails.getStatus() %></pre>
                                        <button type="button" onclick="UpdateStatus('<%=petDetails.getPetId() %>','approved')">accept</button>
                                        <button type="button" onclick="UpdateStatus('<%=petDetails.getPetId() %>','declined')">decline</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                            
                    </td>
                       <% count ++;
                       if(count==2){ %> 
                    	   </tr>
                    	   <tr>              
                     <%count=0; }}%>  
                       
                </tr>
            </tbody>
        </table>
         
        </div>
    </div>
   </div>
      
   <script type="text/javascript">
   
   function UpdateStatus(petId,status){     
	   
   
   	var url="UpdatePetStatus.jsp?petId="+petId+"&status="+status;  
   	
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
      
    
   
   function getInfo(){  
   	if(request.readyState==4){  
   	var val=request.responseText;
   	    
   	    alert(val); 
   		location.reload();
   	}  
   	}  
  
 
   
   </script>
</body>
</html></html>