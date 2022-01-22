<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/aeca6704b2.js" crossorigin="anonymous"></script>

<style type="text/css">

/* Margin settings */
  *{
    margin: 0;
    padding: 0;
    color:white;
}

/* Background and body */
 body{
    background:linear-gradient(rgba(0,0,0,.3)50%,rgb(0,0,0,.3)50%),url("./Images/background7.jpg");
    background-repeat: no-repeat;
	background-position:center;
	background-size: cover;
	background-attachment: fixed;
	color: white;
}

/* Logo */
h1{
    font-family: sans-serif;
    padding-top: 10px;
    padding-left: 10px;
}

/* form field */
.form{
    color: black;
    position: absolute;
    top: 24%;
    left: 70%;
    border: 1px solid transparent;
    width: 290px;
    height: 280px;
    padding: 20px;
    padding-left: 35px;
    line-height: 2;
    font-family: 'Times New Roman', Times, serif;
    font-size: 18px;
    font-weight: bold;
    border-radius: 15px;
    background-color: rgb(209, 219, 209);
    box-shadow: 0 0 10px black;
}


form label,p,a,input{
color: black;
}

#head{
    text-align: center;
    font-size: 25px;
    margin-top: -5px;
}

#message{
   position: absolute;
   top:18%;
   left:73%;
   font-size: 20px;
   font-weight:bold;
   display:none;
   text-align: center; 
}

form input{
         height: 30px;
         width: 250px;
         background: transparent;
         border-top: none;
         border-left: none;
         border-right: none;
         border-bottom: 1px solid rgb(160, 155, 155);         
 }

form input:focus{
    outline: none;
    }
    
 form button{
     height: 30px;
     width: 130px;
     margin-top: 10px;
     background-color: rgb(231, 112, 112);
     color: white;
     border-radius: 5px;
     border: none;
     font-weight: bold;
     font-size: 15px;

 }

</style>
</head>
<body>
	<div id="background">
	
		<!-- Web site Name and Logo-->
		
		<h1><i class="fas fa-paw" style="color: white;"></i> Pet Shop</h1>
		
		<!--Login form-->
		
		<!--Message field-->
		 
	 
        
        <p id="message"></p>
          
		
		<form action="login" class="form" method="get">
		
		<p id="head">Login</p>
			
  <!--UserName And Password-->
			<label for="username" id="username"><i class="fas fa-id-card" style="color: black;"></i> Username:</label> <br> <input
				type="text" name="usernameinput" id="usernameinput"
				placeholder="Enter the username" pattern="[a-zA-Z0-9]+{8,20}"
				title="username must be in 8 character" required> <br>
			
			<label for="password"><i class="fas fa-lock" style="color: black;"></i> Password:</label> <br> <input
				type="password" name="passwordinput" id="passwordinput"
				placeholder="Enter the password"
				pattern="[a-zA-Z0-9!@#$%^&*()]+{8,20}"
				title="password must be in 8 character" required> <br>
			
   <!--Login Button-->
			<button type="submit" id="login">Login</button>
			<p>
				Don't have account ?<a href="Register.jsp"> Register here</a>
			</p>
		</form>
	</div>
	
  <!--validation response for username password-->
  
	<%if(session.getAttribute("message")!=null){
%>
          <script type="text/javascript">
          document.getElementById("message").style.display="block";
          document.getElementById("message").innerHTML="Invalid Username or password";
          </script>	  
	<%} %>
	 
</body>
</html>
