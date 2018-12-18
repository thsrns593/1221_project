package spring.control;

import java.util.ArrayList;
import java.util.List;

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
	public ModelAndView table(String isbn) {
		
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}
