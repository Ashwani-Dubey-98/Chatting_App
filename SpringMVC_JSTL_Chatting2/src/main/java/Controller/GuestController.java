package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scs.dao.*;

@Controller
public class GuestController {

	@RequestMapping("/home")
	public ModelAndView home() {
    return new ModelAndView("home");	
	}
	
	@RequestMapping("/contactus")
	public ModelAndView contactus() {
	    return new ModelAndView("contactus","command",new chat_model());
	}
	
	@RequestMapping("/about")
	public ModelAndView about() {
       return new ModelAndView("about");		
	}

	@RequestMapping("/gallery")
	public ModelAndView gallery() {
    return new ModelAndView("gallery");		
	}
	
	@RequestMapping("/services")
	public ModelAndView services() {
    return new ModelAndView("services");		
	}
	
	@RequestMapping("/friends")
	public ModelAndView friends() {
    return new ModelAndView("friends");		
	}
}