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
    <link rel="stylesheet" href="AdminHome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>
    <style type="text/css">
    *{
    margin: 0;
    padding: 0;
    color: white;
}
.backgroundpage{
   background-image:linear-gradient(rgba(0,0,0,.5)50%,rgb(0,0,0,.5)50%), url("https://images.pexels.com/photos/7282845/pexels-photo-7282845.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
   background-repeat: no-repeat;
   background-size: cover;
   width: 100%;
   height: 250vh;
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
    font-size: x-large;
}
#search{
    width: 100px;
    height: 30px;
    border: 1px solid;
    border-color: tomato ;
    font-size: 14px;
    font-weight: bold;
    color: white;
    border-top-right-radius: 10px;
    border-left: none;
    position: absolute;
    left: 630px;
    background-color:tomato;
    margin-top: -2px;
}

#searchinput{
    padding-left: 10px;
    position: absolute;
    font-size: 17px;
    color: white;
    top: 13px;
    left: 330px;
    width: 300px;
    height: 30px;
    border: 1px solid;
    border-color: tomato;
    border-top-left-radius: 10px;
    border-bottom-left-radius:10px;
    background-color: transparent;
    border-right: none;
}
#searchinput::placeholder{
    color: rgb(199, 181, 181);
}
input:focus{
    outline: none;
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
    margin-left: 50px;
    transition: 0.5s;
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
    margin-left: 45px;
    margin-top: 20px;
    line-height: 2;
    font-size: 18px;
    background-color:  transparent;
    border-radius: 10px;
}

.petdetails{
    width: 300px;
}
#pets span{
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
        <input type="search" id="searchinput" placeholder="Enter pet category or name">
        <button id="search"><i class="fas fa-search" style="color: white"></i></button>
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
                                    <td><img src="./Pets/<%=petDetails.getPetImage()%>" alt=""></td>    
                                    <td class="petdetails">
                                        <span>Type : <%=petDetails.getPetType()%> </span><br>
                                        <span>Name : <%=petDetails.getPetName()%>  </span><br>
                                        <span>Color : <%=petDetails.getPetColor()%> </span><br>
                                        <span>price : Rs.<%=petDetails.getPetprice() %> </span><br>
                                        <span>Qty: <%=petDetails.getAvilableQty() %></span><br>
                                        <span>Status: <%=petDetails.getStatus() %></span><br>
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