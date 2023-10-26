<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@page import="com.scs.dao.chat_model"%> <%@page import="com.scs.dao.Registration"%> <%@page import="java.util.List" %> <%@page import="javax.servlet.http.HttpServletRequest" %> <%@page import="javax.servlet.http.HttpSession" %>
<%@page import="org.hibernate.Session" %> <%@page import="org.hibernate.Query" %> <%@page import="org.hibernate.cfg.Configuration" %> <%@page import="org.springframework.web.servlet.ModelAndView" %>
<%@page import="java.time.LocalDateTime" %> <%@page import="java.time.format.DateTimeFormatter,java.util.Date, org.hibernate.Transaction" %>

<%@include file="header.jsp" %>
<h3 style="color: #F4BC3D; text-align: center;"><u><i><%=request.getParameter("fr") %></i></u></h3>
<hr>
<div style="background-image: img/bg.jfif; background-color: lightblue;">
 <% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null)
      {
    	new ModelAndView("redirect:home.do");
      }
    else { %>
   <%
   String fr = request.getParameter("fr");
   Session session2 = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
   Query q = session2.createQuery("from chat_model c where c.receiver=:a and c.temp=:b or c.temp=:a and c.receiver=:b");
   q.setString("a",fr);
   q.setString("b",(String) session.getAttribute("user_name"));
   
   
   List <chat_model>  list = q.list();
   
   %> <div class="row"><div class="column col-sm-3"></div>
   <div class="overflow-auto col-sm-7" text-align: left; padding-left: 0px; margin: 0px; border: 2px grey solid rounded">	<%
   for(chat_model chat: list){
	   String username6 = (String) session.getAttribute("user_name");
	   // This if and else is for the left alignment of the container, but it is not working Now.
	%>
	
	 <div class="container-center">
	   <font size="2">
         <div class="row">
          <div class="col-12">
	       <div class="card">
	        <div class="row" style="padding: 0px; margin-bottom: 0px; border: 1px;">
	            &ensp;
		        <div class="column bg-default col-sm-4 card-text">
		        <% 
		        if(chat.getTemp().equals((String) session.getAttribute("user_name"))){ %>
		            <font color="blue" size="2"><i><%= chat.getTemp() %></i></font>
		        <% } 
		        else{ %>
		        	<font color="#F4BC3D" size="2"><i><%= chat.getTemp() %></i></font>
		        <% }	
		        %>
		        
		         </div>
	            <div class="column col-sm-2 card-text"><font size="1"><%= chat.getAddeddate() %> </font></div>
	            <div class="column col-sm-2 dropdown show" style="border: 1px;">
                  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
                 <div class="column dropdown-menu col-sm-1" aria-labelledby="dropdownMenuLink" style="border: 1px;">
                   <a class="dropdown-item" href="DeleteSer.do?chat_model_id=<%=chat.getId()%>&fr=<%=chat.getReceiver() %>" class="btn bg-warning">Delete</a>
                   <a class="dropdown-item" href="update.do?chat_model_id=<%=chat.getId()%>&fr=<%=chat.getReceiver() %>">Update</a>
                 </div>
                </div>
	        </div>
	        <div class="card-title"><i><%= chat.getChat()%></i></div>
		   </div>
	      </div>
         </div>
</font>
 </div>
 <%  
	}session2.close();
  }
 %>

</div> 

<div class="column col-sm-3"></div>

 <div class="row container-left col-sm-7" style=" position: sticky; bottom: 0; background-color: 8EB2FF; padding-top: 2px; padding-bottom: -80px; font-size: 25px;">
<% 		String fr = request.getParameter("fr");  %>
  <form action="chatlogic.do?fr=<%= fr %>" method="post">
  <div class="mb-3 row">
    <div class="input-group mb-3" style="position: relative;">
      <input type="text" class="form-control" placeholder="Want to say something..."  name="chat" Required>
      <b><input class="btn btn-outline-secondary bg-light" type="submit" value="Send" /></b>
    </div>
  </div>
 </form>
 </div>
 
 <div class="column col-sm-3"></div>
<div class="column col-sm-3"></div>
</div>
</div>