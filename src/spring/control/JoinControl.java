package spring.control;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;
import src.service.MailService;

@Controller
public class JoinControl {
	private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	
	@Autowired 
	private MailService mailService;
	
	@Autowired MemberDAO m_dao;
	
	
	@RequestMapping(value="sendMail.inc", method=RequestMethod.POST,
			produces="application/json")
	@ResponseBody
	private Map<String, String> sendMail(HttpSession session, String email) {
		int randomCode = new Random().nextInt(10000) +1000;
		String joinCode = String.valueOf(randomCode);
		String subject = "회원가입 승인 번호 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("회원가입 승인 번호는 ").append(joinCode).append(" 입니다.");
		
		mailService.send(subject, sb.toString(), "in3joson@gmail.com", email);
	
		Map<String, String> map = new HashMap<>();
		
		map.put("joinCode", joinCode);
		
		return map;
	}
	
	
	@RequestMapping("join.inc")
	public String join() {
		return "join";
	}
	@RequestMapping("reg.inc")
	public ModelAndView reg(MemberVO vo) {
		boolean chk = m_dao.join(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:main.inc");
		
		return mv;
	}
	
	@RequestMapping(value="checkid.inc",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkid(String id) {
		MemberVO vo = m_dao.searchId(id);
		Map<String, String> map = new HashMap<String, String>();
		if(vo == null) {
			map.put("msg", "1");
		}else {
			map.put("msg", "0");
		}
		
		return map;
	}
	
}












