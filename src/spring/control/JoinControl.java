package spring.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class JoinControl {
	
	@Autowired MemberDAO m_dao;
	
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












