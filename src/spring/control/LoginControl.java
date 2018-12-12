package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.storeconfig.StoreRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LoginDAO;

@Controller
public class LoginControl {
	
	@Autowired 
	private LoginDAO l_dao;
	@Autowired
	private HttpSession session;
	@RequestMapping("/login.inc")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login.inc", method=RequestMethod.POST)
	public ModelAndView login(String email, String password) {
		ModelAndView mv = new ModelAndView();
	
		if(l_dao.login(email, password) != null) {
			session.setAttribute("m_id", email);
			System.out.println((String)session.getAttribute("m_id"));
			mv.setViewName("main");
		}else {
			
			mv.setViewName("redirect:/login.inc?check=fail");
		}
		return mv;
	}
	
	@RequestMapping("logout.inc")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("m_id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}
	
}
