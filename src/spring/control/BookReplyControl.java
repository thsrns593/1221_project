package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.BreplyDAO;

@Controller
public class BookReplyControl {
	@Autowired
	BreplyDAO br_dao;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("breply_write.inc")
	@ResponseBody
	public Map<String, String> breply_write() {
		Map<String, String> map = new HashMap<>();
		
		return map;
	}
	
}
