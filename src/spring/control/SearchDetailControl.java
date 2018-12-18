package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LibDAO;
import mybatis.dao.NormalDAO;
import mybatis.vo.NormalVO;
import spring.util.Paging;

@Controller
public class SearchDetailControl {

	@Autowired
	private LibDAO lib_dao;
	
	public static final int BLOCK_LIST = 5;
	public static final int BLOCK_PAGE = 5;
	
	int nowPage;
	int rowTotal;
	String pageCode;

	@RequestMapping("searchDetail.inc")
	public ModelAndView table(NormalVO vo) {
		
		String c_page = String.valueOf(vo.getNowPage());

		if(c_page.equals("0"))
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		rowTotal = n_dao.getNbTotalCount(vo);
		String board_name ="table";
		Paging page = new Paging(nowPage, 
				rowTotal, BLOCK_LIST, BLOCK_PAGE,board_name, vo.getNb_category());
		
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
		mv.addObject("pageCode", pageCode);
		mv.setViewName("searchDetail");
		return mv;
	}
}
