<%@include file="header.jsp" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <h1 style="color: Blue;">Home page</h1>
 <hr>
 <% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null)
        {out.print("");}
    else {%>
 <%   }%>
  
<div class="container">
  <h2>Java Language</h2>  
<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/img1.jfif" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/img2.jfif" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/img3.jfif" class="d-block w-100" alt="...">
    </div>
     <div class="carousel-item">
      <img src="img/img4.jfif" class="d-block w-100" alt="...">
    </div>
     <div class="carousel-item">
      <img src="img/img5.jfif" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>  
</div>
<hr>
<%@include file="footer.jsp" %>