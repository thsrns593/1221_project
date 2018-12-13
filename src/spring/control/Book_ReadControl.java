package spring.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	@Autowired
	HttpSession session;
	
	@RequestMapping("book_read.inc")
	public ModelAndView book_read(BoardUtil bu) {
		ModelAndView mv = new ModelAndView();
		System.out.println("게시물 idx :"+bu.getNum());
		BookVO vo = b_dao.getBbs(bu.getNum());
		String bb_num =vo.getBb_num();
		List<String> read_list = (List<String>)session.getAttribute("read_list");
		//리스트가 없다면 생성
		if(read_list == null) {
			read_list = new ArrayList<>();
		}
		//이미 읽은 글이 아니라면
		if(!read_list.contains(bb_num)) {
			read_list.add(bb_num);
			//데이터베이스에 있는 게시물의 조회수를 증가시킴
			b_dao.upHit(bb_num);
			//세션의 리스트를 갱신
			session.setAttribute("read_list", read_list);
			//보여줄 게시물의 조회수를 증가시킴
			int hit =Integer.parseInt(vo.getBb_hit());
			vo.setBb_hit(String.valueOf(hit+1));
		}
		mv.addObject("vo",vo);
		mv.setViewName("book_read");
		return mv;
	}
}
