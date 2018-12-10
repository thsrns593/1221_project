package spring.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.NormalDAO;

@Controller
public class Text_ReadControl {
	@Autowired
	NormalDAO n_dao;
	
	@RequestMapping("text_read.inc")
	public String text_read(String cPage) {
		Map<String, String> map = new HashMap<>();
		map.put
		n_dao.getList(map);
		return "text_read";
	}
}
