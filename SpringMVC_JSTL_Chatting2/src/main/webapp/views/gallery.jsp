<%@include file="header.jsp" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.scs.dao.TableUpload"%>
<%@page import="java.util.List" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Query" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="javax.servlet.http.HttpSession" %>
<h1 style="color: Blue;">Gallery page</h1>
<hr>
<% 
    String username2 = (String) session.getAttribute("user_name");
    if(username2==null){}
    else {    
    	String filesuccess1= request.getParameter("filesuccess");
    %>
<!-- File Uploading Syntax -->
   	<form action="uploadlogic.do" method="post" enctype="multipart/form-data">
   	    <div class="form-group col-sm-3 bg-light" style="border: 1px grey solid">
   	      <label for="exampleFormControlFile1">Image Upload</label>
		  <input class="form-control-file" type="file" name="file" id="exampleFormControlFile1" Required/> 
		  <input type="submit" value="Upload" Required/>
	    </div>
	</form>
	
<!-- Gallery -->
<div class="lightbox">
<div class="row">
      <%
        Session session2 = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
   	    Query q = session2.createQuery("from TableUpload t where t.Username=:a");
        q.setString("a",(String) session.getAttribute("user_name"));
  	
        List <TableUpload>list  = q.list();
        for(TableUpload tu: list){ 
        %>
        	<div class="col-lg-4 mx-auto mb-lg-2 responsive" style="height:200px; width:200px; border:1px grey solid; overflow: auto;">
        <% 
  	    if(list.size()>0){
  	     %>
  	  <a target="_blank" href="img/<%= tu.getPath()%>">
        <img src="img/<%= tu.getPath() %>" class="w-100 shadow-1-strong rounded mb-4 object-fit-contain border rounded" alt="gallery_images" />
      </a>
  
     <% 
  	        } %> </div> <%
  } 
 %>
 <div class="responsive">
  <div class="gallery">
    <a target="_blank" href="img_forest.jpg">
      <img src="img_forest.jpg" alt="Forest" width="600" height="400">
    </a>
  </div>
</div>
    <% }%>
</div></div>
<hr>
<%@include file="footer.jsp" %>