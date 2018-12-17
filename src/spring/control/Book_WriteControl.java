package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BookDAO;
import mybatis.vo.BookVO;

@Controller
public class Book_WriteControl {

	@Autowired
	BookDAO b_dao;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	//get방식으로 글쓰기로 온 경우
	@RequestMapping(value = "writeBook.inc", method = RequestMethod.GET)
	public ModelAndView goForm() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("ac", "writeBook.inc");
		Object obj =session.getAttribute("m_id");
		if(obj == null) {
			mv.setViewName("redirect:board_share.inc");
		}else {
			mv.setViewName("book_write");
		}
		return mv;
	}
	@RequestMapping(value="writeBook.inc", method=RequestMethod.POST)
	public String writeBook(BookVO vo) {
		//bb_num ,bb_category bb_title bb_bname bb_author bb_press bb_content
		String m_id =(String)session.getAttribute("m_id");
		String ip =request.getRemoteAddr();
		vo.setM_id(m_id);
		vo.setBb_ip(ip);
		b_dao.writeBook(vo);
		return "redirect:board_share.inc";
	}
}
