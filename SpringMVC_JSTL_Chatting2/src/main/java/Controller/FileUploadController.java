package Controller;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scs.dao.Registration;
import com.scs.dao.TableUpload;

@Controller
public class FileUploadController {
	
	@RequestMapping("/uploadlogic")
	public ModelAndView uploadlogic(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IOException {
	
	  //  This code is for the Image Upload.
			String path =session.getServletContext().getRealPath("/")+"img";
			String filename =file.getOriginalFilename();
			byte bytes[]= file.getBytes();
			BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(path+"/"+filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();
			
			Session session1 = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction tx = session1.beginTransaction();
			HttpSession ses = request.getSession();
			TableUpload s= new TableUpload();
			s.setPath(filename);
			s.setUsername( (String)ses.getAttribute("user_name"));
			session1.save(s);
			tx.commit();
			return new ModelAndView("gallery","filesuccess",filename);
	}
}
