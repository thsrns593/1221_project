package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BookDAO;
import mybatis.vo.BookVO;
import spring.util.BoardUtil;

@Controller
public class Book_ReadControl {
	@Autowired
	BookDAO b_dao;
	
	@RequestMapping("book_read.inc")
	public ModelAndView book_read(BoardUtil bu) {
		ModelAndView mv = new ModelAndView();
		System.out.println("게시물 idx :"+bu.getNum());
		BookVO vo = b_dao.getBbs(bu.getNum());
		mv.addObject("bu", bu);
		mv.addObject("vo",vo);
		mv.setViewName("book_read");
		return mv;
	}
}
