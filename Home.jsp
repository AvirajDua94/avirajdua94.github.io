<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Support</title>
<link href="https://fonts.googleapis.com/css?family=Ruslan+Display" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Old+Standard+TT|Ruslan+Display" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">

<link rel="stylesheet" href="css/main.css">

<style>
	.login-modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 20%; /* Location of the box */
	    padding-left:12%;
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.login-modal-content {
	    background-color: #fefefe;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 60%;
	    height: 30%;
	}
	
	/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}

</style>

<script>
	function alertmsg()
	{
		alert("Here some webhosting promble.Whole website is ready on LOCALHOST");
		alert("Sorry For inconvenience");
	}
</script>

</head>

<body onload="alertmsg()">

	<header>
		<div class="Logo_Thoughts">
			<div class="logo">
				<a href="index.jsp">StudentSupport
				</a>
			</div>
			<div class="thoughts">
				<span>LET'S HELP EACH OTHER TO BUILD CAREER</span>
				<br>
				<span style="color: red; font-size: 30px;"><b>(Website UnderMaintenance.)</b></span>
			</div>
		</div>
	</header>
	
	<section class="mainmenu">
	
		<ol>
			<li><a href="#" class="home">HOME</a>
			<li><a href="#" class="home">ABOUT US</a>
			<li><a href="#" class="home">CONTACT US</a>
			<%
				String msg1 = (String)session.getAttribute("name");
				
				if(msg1!=null)
				{
					%><li><a href="../LogoutServlet" class="home">LOGOUT</a><%
				}
				else
				{
					%><li><a href="#" id="loginbutton" class="home">LOGIN</a><%
				}
			%>
			
		</ol>
		
	</section>
	<div class="maincontainer">
		<div class="leftpanel">
			<a href="showassignment.jsp?subject_id=1" class="sidemenu">LINUX</a>
			<br><br><br>
			<a href="showassignment.jsp?subject_id=2" class="sidemenu">WINDOWS</a>
			<br><br><br>
			<a href="showassignment.jsp?subject_id=3" class="sidemenu">NETWORKING</a>
			<br><br><br>
			<a href="showassignment.jsp?subject_id=4" class="sidemenu">COMMUNICATION</a>
		</div>
		
		<div class="rightpanel">
			<p class="msg">Welcome, 
			<%
				String msg = (String)session.getAttribute("name");
				
				if(msg!=null)
				{
					out.println(msg.toUpperCase());
				}
				else
				{
					out.println("Students");
				}
			%>
			</p><hr>
			<br><br>
			<p class="notemsg"><b><u>NOTE</u></b></p><br>
			<p class="fullmsg">
			
			Here we aer going to <b>HELP</b> each other. So, Please don't copy any other work.
			<br>This all work or assignment just only for reference <b>NOT FOR COPY</b>.
			</p>
		</div>
	</div>
	
	<div id="loginmodal" class="login-modal">
	<span class="close">&times;</span>
  <!-- Modal content -->
	      <div class="form">
	      		
	      		<%
	      			System.out.println(session.getAttribute("authenticate"));
	      		%>
	      		
			    <form action="../RegisterServlet" method="post" class="register-form" id="signin-form">
			      <input type="text" name="name" placeholder="name"/>
			      <input type="text" name="studentnumber" placeholder="Student Number">
			      <input type="password" name="password" placeholder="password"/>
			      <input type="text" name="email" placeholder="email address"/>
			      <input type="submit" value="register">
			      <p class="message">Already registered? <a href="javascript:logInFunction()">Sign In</a></p>
			    </form>
			    <form action = "../LoginServlet" method = "post" class="login-form" id="login-form">
			      <span style="color:blue; font-size: 16px;"><b>Your Username is must be your Student Id.<b><br><br>
			      <input type="text" name="username" placeholder="username"/>
			      <input type="password" name="password" placeholder="password"/>
			      <input type="submit" value="Login">
			      <p class="message">Not registered? <a href="javascript:singInFunction()">Create an account</a></p>
			    </form>
		</div>
	    

	</div>

	<script>
	// Get the modal
	var modal = document.getElementById('loginmodal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("loginbutton");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		var status = <%=(String)session.getAttribute("authenticate")%>
		if(status==true)
		{
			alert("You are already Loginned");	
		}
		else
		{
			modal.style.display = "block";
		}
	    
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	function singInFunction()
	{
		document.getElementById("signin-form").style.display="block";
		document.getElementById("login-form").style.display="none";
		
	}
	function logInFunction()
	{
		document.getElementById("signin-form").style.display="none";
		document.getElementById("login-form").style.display="block";
		
	}
	
	
	</script>

</body>
</html>