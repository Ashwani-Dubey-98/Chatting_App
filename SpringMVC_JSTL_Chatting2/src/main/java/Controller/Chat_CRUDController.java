package Controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scs.dao.chat_model;

import net.sf.ehcache.transaction.xa.commands.Command;
@Controller
public class Chat_CRUDController {

	@RequestMapping("/chatlogic")
	public ModelAndView chatlogic(@ModelAttribute("SpringMVC_JSTL_Chatting2") chat_model obj ,HttpServletRequest request) {
		Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String fr = request.getParameter("fr");
        
		HttpSession ses =(HttpSession) request.getSession();
		String user_name = (String) ses.getAttribute("user_name");
        
		chat_model s= new chat_model();
		s.setChat(obj.getChat());
		s.setAddeddate(new Date());
		s.setTemp(user_name);
		s.setReceiver(fr);
		
        session.save(s);
		tx.commit();
		session.close();
		return new ModelAndView("contactus","command",new chat_model()).addObject("fr",request.getParameter("fr"));		
	}

	@RequestMapping("/DeleteSer")
	public ModelAndView DeleteSer(HttpServletRequest request) {
		Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		int chatid = Integer.parseInt(request.getParameter("chat_model_id"));
		chat_model del_obj=(chat_model) session.get(chat_model.class, chatid);
		session.delete(del_obj);
		tx.commit();
    return new ModelAndView("redirect:contactus.do").addObject("fr", request.getParameter("fr"));
	}
	
	
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request) {
	  Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	   int chatid = Integer.parseInt(request.getParameter("chat_model_id"));
	   Object q = session.get(chat_model.class, chatid); 		
    return new ModelAndView("update","key_update",q);	
	}
	
	@RequestMapping("/UpdateSer")
	public ModelAndView UpdateSer(HttpServletRequest request){
		
	        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			int id = Integer.parseInt(request.getParameter("id"));
			chat_model upd_obj=(chat_model) session.get(chat_model.class, id);
			upd_obj.setChat(request.getParameter("chat"));
			session.update(upd_obj);
			tx.commit();
			
			return new ModelAndView("redirect:contactus.do","key_update","Chat Updated").addObject("fr", request.getParameter("fr"));
	}

}