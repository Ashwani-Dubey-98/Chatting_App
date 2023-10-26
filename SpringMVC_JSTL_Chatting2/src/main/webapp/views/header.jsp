<!doctype html>
<%@page import="javax.servlet.http.HttpSession" %>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
   <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
         integrity = "sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
         crossorigin = "anonymous"></script>
   <script src=" https://cdn.jsdelivr.net/npm/bootstrap-modal-js@2.0.1/dist/bootstrap-modal-js.min.js"></script>
	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   <style>
  *{margin:0px;
  padding: 0px;}
  </style>
  </head>
  <body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
            <div class="row bg-light">     
  <div class="col-lg-6 col-md-12 mb-4 mb-lg-0">
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="container" style="float:left; height:80px; width:80px;">
                 <a href="home.do"><img src="img/logo.png" class="img-thumbnail img-fluid" alt="logo"></a>
              </div>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">

  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="home.do">Home</a>
  </li>
  <% if(session.getAttribute("user_name")==null){
	  
  }  else{ %>
  <li class="nav-item">
    <a class="nav-link active" href="friends.do">Friends</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="gallery.do">Gallery</a>
  </li>
  <%} %>
  <li class="nav-item">
    <a class="nav-link active" href="services.do">Services</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="about.do">About</a>
  </li>
  <li class="nav-item">
  <% 
    String username3 = (String) session.getAttribute("user_name");
    if(username3!=null) {%>
    	<a class="nav-link active btn btn-danger" href="logout.do">Logout</a>
    <%	}
    	 else {%>
  <li>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
Login Here
</button>

<!-- Modal -->
<div class="modal fade justify-content-end" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Login Here</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
 <form action="loginlogic.do" method="post">
  <div class="col-sm-8">
    <label for="staticEmail2" class="visually-hidden">Email Address</label>
    <input type="text" class="form-control" name="email" placeholder="Enter Email Address" required >
  </div><br>
  <div class="col-sm-8">
    <label for="inputPassword2" class="visually-hidden">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Password should be atleast 8 characters" >
  </div><br>
  <div class="col-sm-5">
    <button type="submit" class="btn btn-primary mb-3">Login</button>
  </div>
 </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 </li>
 
  <li>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  Register Here
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog text-primary">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel1">Registration Form</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
 &ensp; ${key}
      <div class="modal-body">
        <form action="reg.do" method="post">
          <input type="text" name="username" placeholder="Enter Username" /><br><br>
          <input type="text" name="password" placeholder="Enter Password" /><br><br>
          <input type="text" name="email" placeholder="Enter Email" /><br><br>
          <input type="text" name="mobileno" placeholder="Enter Mobileno" /><br><br>
          <input type="submit" name="txtsubmit" value="Register" /><br><br>
        </form>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 </li>
 <%   }%>
 <li> 
 <% if(session.getAttribute("user_name")==null){%>
   ${key_wronglogin}<%
 } 
 else{ out.print(session.getAttribute("user_name"));  }%>
 </li>
       </ul>
     </div>
   </nav>
 </div> </div>
