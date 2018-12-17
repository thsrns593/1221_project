package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BookDAO;
import mybatis.vo.BookVO;
import spring.util.BoardUtil;

@Controller
public class Book_EditControl {
	@Autowired
	BookDAO b_dao;
	@Autowired
	private HttpSession session;
	//GET방식으로 수정하기로 온경우
	@RequestMapping(value="editBook.inc", method = RequestMethod.GET)
	public ModelAndView goForm(BoardUtil bu) {
		ModelAndView mv = new ModelAndView();
		String num = bu.getNum();
		BookVO vo = b_dao.getBbs(num);
		String m_id =(String)session.getAttribute("m_id");
		if(m_id !=null &&m_id.equals(vo.getM_id() )) {
			mv.addObject("ac", "editBook.inc");
			mv.setViewName("book_write");			
			mv.addObject("vo", vo);
		}else {
			mv.setViewName("redirect:book_read.inc?num="+num);
		}
		return mv;
	}
	@RequestMapping(value="editBook.inc", method=RequestMethod.POST)
	public ModelAndView editBook() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
