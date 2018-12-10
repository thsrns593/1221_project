package spring.control;

import java.util.HashMap;
import java.util.Map;

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
		
		String c_page = String.valueOf(vo.getNowPage());

		if(c_page.equals("0"))
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		rowTotal = n_dao.getNbTotalCount(vo);
		
		System.out.println("총게시물 :"+n_dao.getNbTotalCount(vo));

		Paging page = new Paging(nowPage, 
				rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		pageCode = page.getSb().toString();
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		System.out.println("시작:"+begin);
		System.out.println("시작:"+end);
		
		vo.setBegin(begin);
		vo.setEnd(end);

		NormalVO[] ar = n_dao.getList(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("board_free");
		return mv;
	}

}
