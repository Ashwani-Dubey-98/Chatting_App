<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="java.awt.color.CMMException"%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@page import="com.scs.dao.chat_model"%>
<%@page import="java.util.List, java.util.Set" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Query" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.springframework.web.servlet.ModelAndView" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter,java.util.Date, org.hibernate.Transaction" %><%@include file="header.jsp" %>
<%@page import="javax.servlet.http.HttpSession" %>

<h1 style="color: Blue;">Friends Page</h1><hr>
 <% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null)
        {}
    else {
        %>
     <p style="color:Green;">Your Chat List: </p>     
       <div class="row bg-light">     
         <div class="col-lg-6 col-md-12 mb-4 mb-lg-0" style="border:1px black;">
    <%
    String username7 = (String) session.getAttribute("user_name");
    Session session2 = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
    Query q = session2.createQuery("from chat_model c where c.receiver=:a or c.temp=:b");
    q.setString("a",(String) session.getAttribute("user_name"));
    q.setString("b",(String) session.getAttribute("user_name"));
  	
    List <chat_model>list  = q.list();
    for(chat_model cm: list){ 
  	  if(list.size()>0){
  		  %>
		<div class="container text-left">
			<div class="row d-flex justify-content-end">
				<div class="row">
					<div class="col-12">
						<ul class="list-group">
							<li class="list-group-item list-group-item-warning text-dark"><a href="contactus.do?fr=<%=cm.getTemp()%>"> <%=cm.getTemp()%></a>
<!-- 								Profile <span class="badge badge-info">9</span>  
      								<span class="sr-only">unread messages</span>     -->
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%
        	        	  	}
		}
		%>
  	</div>  
 
 <div class="container-fluid col-lg-6 col-md-12 mb-4 mb-lg-0" style="border:1px black;">
   <form action="chatlogic.do" method="post">
    <div class="mb-6 row">
     <div class="input-group mb-6">
        <span class="border-left-3"><img src="img/Add_friends.png" class="rounded-circle" alt="logo" /><br><hr>
            <input type="text" class="form-control" placeholder="Enter the Email Address"  name="fr" /><br>
            <input class="btn btn-outline-primary" type="submit" value="Add Friends" id="button-addon2" />
        </span>
     </div>
    </div>
   </form>
 </div>	
</div>
${Addedfriends}

 <% }%>
<hr>
<%@include file="footer.jsp" %>