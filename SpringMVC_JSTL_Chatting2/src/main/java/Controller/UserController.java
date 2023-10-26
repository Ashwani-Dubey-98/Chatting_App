package Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scs.dao.Registration;
import com.scs.dao.chat_model;

@Controller
public class UserController {

	@RequestMapping("/reg")
	public ModelAndView reg(HttpServletRequest request) {
		Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Registration s= new Registration();
		s.setUsername(request.getParameter("username"));
		s.setPassword(request.getParameter("password"));
		s.setEmail(request.getParameter("email"));
		s.setMobileno(request.getParameter("mobileno"));
		session.save(s);
		tx.commit();
		session.close();
		return new ModelAndView("home","key","Registration Sussessfully");		
	}

	@RequestMapping("/loginlogic")
	public ModelAndView loginlogic(HttpServletRequest request,chat_model ch_mo) {
		Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Query q = session.createQuery("from Registration s where s.email=:a and s.password=:b");
		 q.setString("a",request.getParameter("email"));
		 q.setString("b",request.getParameter("password"));
        
		List lst= q.list();
		if(lst.size()>0)
	    {
			HttpSession ses =(HttpSession) request.getSession();
			ses.setAttribute("user_name", request.getParameter("email"));
			
			return new ModelAndView("about","key1","Login Successfully");
	    }
	    else
	    { 	
	    	return new ModelAndView("home","key_wronglogin","Email ID or Password Incorrect");
	    }
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {

		HttpSession ses = request.getSession();
		ses.getAttribute("user_name");
		ses.invalidate();
	    	return new ModelAndView("redirect: home.do");
	}
}