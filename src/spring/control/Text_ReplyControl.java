package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.NreplyDAO;

@Controller
public class Text_ReplyControl {

	@Autowired
	private NreplyDAO l_dao;

}
