package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NormalDAO;
import mybatis.vo.NormalVO;

@Controller
public class Text_ReadControl {
	
	@Autowired
	private NormalDAO n_dao;

	@RequestMapping("text_read.inc")
	public ModelAndView text_read(NormalVO vo) {
		

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo",n_dao.getText(vo));
		mv.setViewName("text_read");
		
		return mv;
	}
}
