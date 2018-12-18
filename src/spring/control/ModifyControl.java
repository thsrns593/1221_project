package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class ModifyControl {

	@Autowired
	private MemberDAO m_dao;
	
	@RequestMapping("modify.inc")
	public String modify() {
		return "modify";
	}
	@RequestMapping(value="upinfo.inc",
			method=RequestMethod.POST)
	public ModelAndView upInfo(MemberVO vo){
		ModelAndView mv = new ModelAndView();
	
		boolean chk = m_dao.upInfo(vo);
		
		mv.setViewName("redirect:/main.inc");
		
		return mv;
	}
	
	@RequestMapping(value="deldate.inc",
			method=RequestMethod.POST)
	public ModelAndView deldate(MemberVO vo){
		ModelAndView mv = new ModelAndView();
		
		boolean chk = m_dao.delDate(vo);
		
		mv.setViewName("redirect:/logout.inc");
		
		return mv;
	}
	
}
