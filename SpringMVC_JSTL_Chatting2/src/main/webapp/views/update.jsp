<%@include file="header.jsp" %>
<%@page import="javax.servlet.http.HttpSession" %>
<h1 style="color: Blue;">Contact Us page</h1>
<hr>
<%@page import="com.scs.dao.chat_model" %>
<% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null)
        {out.print("");}
    else {String fr = (String) request.getParameter("fr");%>
       <h5>Welcome  <%= username2  %><%=fr%></h5>  	
 <%   }%>
 <% 
  chat_model obj =(chat_model) request.getAttribute("key_update");
 %>

<div class="container">
 <form action="UpdateSer.do?fr=<%= (String)request.getParameter("fr") %>" method="post">
  <div class="mb-3 row">
    <div class="input-group mb-3">
      <input type="hidden" class="form-control" value=<%=obj.getId()%> name="id" readonly="readonly" />
      <input type="text" class="form-control" value=<%=obj.getChat()%> name="chat" />
      <input class="btn btn-outline-secondary" type="submit" value="Update" />
    </div>
  </div>
 </form>
</div>
 <hr>
<%@include file="footer.jsp" %>