package spring.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class FindControl {

	@Autowired MemberDAO m_dao;
	
	@RequestMapping("find.inc")
	public String find() {
		return "find";
	}
	
	@RequestMapping(value="findid.inc",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findId(String email){
		MemberVO vo = m_dao.searchEmail(email);
		Map<String, String> map = new HashMap<String, String>();
		String findid = vo.getM_id();
		map.put("findid", findid);
		
		return map;
	}
	
	@RequestMapping(value="findemail.inc",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findEmail(String id){
		MemberVO vo = m_dao.searchId(id);
		Map<String, String> map = new HashMap<String, String>();
		String findEmail = vo.getM_email();
		map.put("findEmail", findEmail);
		
		return map;
	}
	
	@RequestMapping(value="findpwd.inc",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findPwd(String email){
		MemberVO vo = m_dao.searchEmail(email);
		Map<String, String> map = new HashMap<String, String>();
		String findPwd = vo.getM_pwd();
		map.put("findPwd", findPwd);
		
		return map;
	}
	
}
