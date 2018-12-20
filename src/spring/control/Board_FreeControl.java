package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NormalDAO;
import mybatis.vo.NormalVO;
import spring.util.Paging;

@Controller
public class Board_FreeControl {
	@Autowired
	private NormalDAO n_dao;
	
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;
	
	int nowPage;
	int rowTotal;
	String pageCode;

	@RequestMapping("board_free.inc")
	public ModelAndView board_free(NormalVO vo) {
		
		//System.out.println("받은 페이지"+String.valueOf(vo.getNowPage()));
		String c_page = String.valueOf(vo.getNowPage());
		
		if(c_page.equals("0"))
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		rowTotal = n_dao.getNbTotalCount(vo);
		String board_name ="board_free";
		String cate = vo.getCate(); 
		Paging page = new Paging(nowPage, 
			rowTotal, BLOCK_LIST, BLOCK_PAGE,board_name,cate);
		
		pageCode = page.getSb().toString();
		
		int begin = page.getBegin();
		int end = page.getEnd();
		

		vo.setBegin(begin);
		vo.setEnd(end);

		NormalVO[] ar = n_dao.getList(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("searchType", vo.getSearchType());
		mv.addObject("searchValue",vo.getSearchValue());
		mv.addObject("pageCode", pageCode);

		mv.addObject("cate",cate);
		mv.setViewName("board_free");
		return mv;
	}

}
