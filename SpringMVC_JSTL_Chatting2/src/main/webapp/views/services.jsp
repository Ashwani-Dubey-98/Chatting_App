<%@include file="header.jsp" %>
<%@page import="javax.servlet.http.HttpSession" %>
<h1 style="color: Blue;">Services Us page</h1>
<hr>
<% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null)
        {out.print("");}
    else {%>
 <%   }%>
<div class="card-deck">
<div class="col-sm-3" >
<div class="card" style="width: 18rem; height:30rem;">
  <img src="img/img_java.jfif" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">Java Card</h5>
    <p class="card-text">Java is an Object-Oriented Programming Language</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

<div class="col-sm-3">
<div class="card" style="width: 18rem; height:30rem;">
  <img src="img/img-css.png" class="card-img-top img-responsive" alt="java" style="">
  <div class="card-body"> 
    <h5 class="card-title">CSS Card</h5>
    <p class="card-text">CSS full form is Cascade Style Sheet, is used with the HTML. It is applied with the Style tag</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

<div class="col-sm-3 mb-6" style="object-fit: contain;">
<div class="card" style="width: 18rem; height:30rem;">
  <img src="img/img-html.png" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">HTML Card</h5>
    <p class="card-text">HTML full form is HyperText MarkedUp Language. It is used for the static website.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

<div class="col-sm-3" >
<div class="card " style="width: 18rem; height:30rem;">
  <img src="img/img-sql.png" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">SQL Card</h5>
    <p class="card-text">SQL is Structured Query Language. It is used to communicate with the Database.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>
</div>

<br>
<div class="card-deck">
<div class="col-sm-3" >
<div class="card " style="width: 18rem; height:30rem;">
  <img src="img/img-spring.png" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">Spring Card</h5>
    <p class="card-text">Spring is an Application Framework, Core technologies: dependency injection, to make a Loosely Coupled program.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

<div class="col-sm-3">
<div class="card" style="width: 18rem; height:30rem;">
  <img src="img/img-hibernate.jfif" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">Hibernate Card</h5>
    <p class="card-text">Hibernate ORM is an object–relational mapping tool for the Java programming language. It provides a framework for mapping an object-oriented domain model to a relational database.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

<div class="col-sm-3 mb-6">
<div class="card" style="width: 18rem; height:30rem;">
  <img src="img/img-mvc.jfif" class="card-img-top img-fluid" alt="java">
  <div class="card-body">
    <h5 class="card-title">MVC Card</h5>
    <p class="card-text">MVC is Model-View-Control, is a design pattern that divides the program into three different elements</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>

</div>
<hr>
<%@include file="footer.jsp" %>



