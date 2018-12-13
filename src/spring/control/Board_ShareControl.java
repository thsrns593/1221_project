package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BookDAO;
import mybatis.vo.BookVO;
import spring.util.BoardUtil;
import spring.util.PageUtil;

@Controller
public class Board_ShareControl {
	@Autowired
	private BookDAO b_dao;
	@Autowired
	private HttpSession session;
	
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;
	
	//네비게이션을 통해서 책게시판에 들어온 경우
	@RequestMapping(value ="board_share.inc", method =RequestMethod.GET)
	public ModelAndView selectCate(BoardUtil bu) {
		Map<String, String> map = new HashMap<String,String>();
		String cate = bu.getCate();
		String nowPage = bu.getNowPage();
		if(nowPage == null)
			nowPage = "1";
		map.put("cate", cate);
		int tc =b_dao.getTotalCount(map);
		PageUtil pu = new PageUtil(Integer.parseInt(nowPage), tc, BLOCK_LIST, BLOCK_PAGE);
		map.put("begin", String.valueOf(pu.getBegin()));
		map.put("end", String.valueOf(pu.getEnd()));
		BookVO[] ar = b_dao.searchCate(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("cate",cate);
		mv.addObject("nowPage",nowPage);
		mv.addObject("pageCode", pu.getSb().toString());
		mv.setViewName("board_share");
		
		return mv;
	}
	//책게시판에서 검색 버튼 또는 페이지숫자를 눌러서 들어온 경우
	@RequestMapping(value="board_share.inc",method = RequestMethod.POST)
	public ModelAndView getList(BoardUtil bu) {
		Map<String, String> map = new HashMap<String, String>();
		String cate = bu.getCate();
		String nowPage =bu.getNowPage();
		if(nowPage == null)
			nowPage ="1";
		String searchType =bu.getSearchType();
		String searchValue= bu.getSearchValue();
		map.put("cate", cate);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		//getTotalCount 에서는 카테고리, 검색타입, 검색어만 필요로한다.
		int tc =b_dao.getTotalCount(map);
		//페이지를 관리할 객체 생성
		PageUtil pu = new PageUtil(Integer.parseInt(nowPage),tc , BLOCK_LIST , BLOCK_PAGE);
		//getList에서는 카테고리,검색타입,검색어,begin,end가 필요함
		map.put("begin", String.valueOf(pu.getBegin()));
		map.put("end", String.valueOf(pu.getEnd()));
		BookVO[] ar = b_dao.getList(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageCode", pu.getSb().toString());
		mv.addObject("cate",cate);
		mv.addObject("searchType",searchType);
		mv.addObject("searchValue",searchValue);
		mv.addObject("nowPage",nowPage);
		mv.addObject("ar",ar);
		mv.setViewName("board_share");
		return mv;
	}
	
	//게시물 삭제
	@RequestMapping(value = "deleteBook.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deleteBbs(BoardUtil bu) {
		String msg = "0";
		String m_id = (String)session.getAttribute("m_id");
		if(m_id !=null && m_id.equals(bu.getM_id())) {
			boolean chk =b_dao.deleteBbs(bu.getNum());
			//true이면 삭제완료
			if(chk) {
				msg ="1";
			}
		}
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
}
