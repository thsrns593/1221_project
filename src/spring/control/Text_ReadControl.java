package spring.control;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NormalDAO;
import mybatis.dao.NreplyDAO;
import mybatis.vo.NormalVO;
import mybatis.vo.NreplyVO;
import spring.util.PageUtil;
import spring.util.Paging;

@Controller
public class Text_ReadControl {

	public static final int BLOCK_LIST = 10;
	public static final int BLOCK_PAGE = 5;

	String pageCode;

	@Autowired
	private NormalDAO n_dao;
	
	@Autowired
	private NreplyDAO nreply_dao;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("text_read.inc")
	public ModelAndView text_read(NormalVO vo) {
		
		NormalVO nvo = n_dao.getText(vo);
		

		Object obj = session.getAttribute("view_list");
		
		List<NormalVO> list = null;
		if(obj == null) {
			
			list = new ArrayList<NormalVO>();
			list.add(nvo);
			
			n_dao.updateHit(nvo);
			
			int hit = Integer.parseInt(nvo.getNb_hit());
			nvo.setNb_hit(String.valueOf(hit+1));
			
			
			session.setAttribute("view_list", list);

		}else {
			
			list = (ArrayList<NormalVO>)obj;
			
			boolean chk = false;
			int i =0;
			for(NormalVO nvo1 : list) {
				if(nvo.getNb_num().equals(nvo1.getNb_num())) {
					chk = true;
					break;//반복문 탈출!
				}
			}
			// 현재 영역에 와서는.. chk의 값이 계속 false를 유지하고
			//있을 수도 있으며, chk의 값이 true일수도 있다.
			//true라는 것은 이미 앞서 같은 게시물을 읽은 적이 있다는 것이다
		//	if(chk == false) {
			if(!chk) {
				list.add(nvo);//list에 vo추가!
				
				n_dao.updateHit(nvo);//DB에 조회수 증가
				
				int hit = Integer.parseInt(nvo.getNb_hit());
				nvo.setNb_hit(String.valueOf(hit+1));

			}
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo",nvo);
		
		mv.setViewName("text_read");
		
		
		//여기서부터 댓글 기능---------------------
		NreplyVO rvo = new NreplyVO();
		
		rvo.setNb_num(vo.getNb_num());
		
		int replycount = Integer.parseInt(nvo.getNb_reply_count());
		
		//댓글 페이징
		PageUtil pvo = new PageUtil(1, replycount, BLOCK_LIST, BLOCK_PAGE);
		
		pageCode = pvo.getSb().toString();
		
		rvo.setBegin(pvo.getBegin());
		rvo.setEnd(pvo.getEnd());
		
		NreplyVO[] nreplyar = nreply_dao.getNreplyList(rvo);
		mv.addObject("nreplyar", nreplyar);
		mv.addObject("nrnowPage", 1);
		mv.addObject("nrreplycount", replycount);
		mv.addObject("nrblockList", BLOCK_LIST);
		mv.addObject("nrpageCode", pageCode);

		return mv;
	}
	
	//댓글 추가
	@RequestMapping("nreply.inc")
	@ResponseBody
	public Map<String, Object> addNreply(NreplyVO vo, HttpServletRequest request){
		

		vo.setNreply_ip(request.getRemoteAddr());
		
		if(vo.getNreply_content() != null && vo.getNreply_content().trim().length() >1)
			nreply_dao.addNreply(vo);
			

		NormalVO nvo = new NormalVO();
		
		nvo.setNb_num(vo.getNb_num());
		
		nvo = n_dao.getText(nvo);
		
		PageUtil pvo = new PageUtil(vo.getNowPage(), Integer.parseInt(nvo.getNb_reply_count()), BLOCK_LIST, BLOCK_PAGE); 
		
		
		vo.setBegin(pvo.getEnd());
		vo.setBegin(pvo.getBegin());
		
		NreplyVO[] nreplyar = null;
		
		
		
		if(pvo.getBegin() <1 ) {
			pvo.setBegin(1);
			pvo.setEnd(10);
		}
		
		vo.setBegin(pvo.getBegin());
		vo.setEnd(pvo.getEnd());

		nreplyar = nreply_dao.getNreplyList(vo);		

		pageCode = pvo.getSb().toString();
				
		Map<String, Object> map = new HashMap<>();
		
		map.put("ar",nreplyar);
		map.put("replycount",nvo.getNb_reply_count());
		map.put("pageCode", pageCode);
		
		return map;
		
	}
	
	//댓글추가 2
	@RequestMapping("nreply2.inc")
	@ResponseBody
	public Map<String, Object> addNreply1(NreplyVO vo, HttpServletRequest request) throws Exception{
		
		vo.setNreply_ip(request.getRemoteAddr());

		vo.setNreply_content(URLDecoder.decode(vo.getNreply_content(),"utf-8"));
		nreply_dao.addNreply2(vo);
		
		NormalVO nvo = new NormalVO();
		
		nvo.setNb_num(vo.getNb_num());
		
		nvo = n_dao.getText(nvo);
		
		nvo.getNb_reply_count();
		
		if(vo.getNowPage() == 0)
			vo.setNowPage(1);
		
		PageUtil pvo = new PageUtil(vo.getNowPage(), Integer.parseInt(nvo.getNb_reply_count()), BLOCK_LIST, BLOCK_PAGE); 
		
		vo.setBegin(pvo.getEnd());
		vo.setBegin(pvo.getBegin());
		
		NreplyVO[] nreplyar = null;

		if(pvo.getBegin() <0 ) {
			pvo.setBegin(1);
			pvo.setEnd(10);
		}
		
		vo.setBegin(pvo.getBegin());
		vo.setEnd(pvo.getEnd());
			
		nreplyar = nreply_dao.getNreplyList(vo);
		
		
		pageCode = pvo.getSb().toString();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("ar",nreplyar);
		map.put("replycount",nvo.getNb_reply_count());
		map.put("pageCode", pageCode);
		
		return map;
		
	}
	
	//댓글삭제
	@RequestMapping("nreply3.inc")
	@ResponseBody
	public Map<String, Object> addNreply2(NreplyVO vo, HttpServletRequest request){
		
		nreply_dao.delNreply(vo);
		
		
		NormalVO nvo = new NormalVO();
		
		nvo.setNb_num(vo.getNb_num());
		
		nvo = n_dao.getText(nvo);
		
		nvo.getNb_reply_count();
		
		if(vo.getNowPage() == 0)
			vo.setNowPage(1);
		
		PageUtil pvo = new PageUtil(vo.getNowPage(), Integer.parseInt(nvo.getNb_reply_count()), BLOCK_LIST, BLOCK_PAGE); 
		
		vo.setBegin(pvo.getEnd());
		vo.setBegin(pvo.getBegin());
		
		NreplyVO[] nreplyar = null;
		
		if(pvo.getBegin() <0 ) {
			pvo.setBegin(1);
			pvo.setEnd(10);
		}
		
		vo.setBegin(pvo.getBegin());
		vo.setEnd(pvo.getEnd());
		
		nreplyar = nreply_dao.getNreplyList(vo);
		pageCode = pvo.getSb().toString();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("ar",nreplyar);
		map.put("replycount",nvo.getNb_reply_count());
		map.put("pageCode", pageCode);
		
		return map;
		
	}
	
	@RequestMapping("text_del.inc")
	public ModelAndView text_del(NormalVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		boolean chk = n_dao.delText(vo);
		
		mv.setViewName("redirect: board_free.inc");
		
		return mv;
	}
}
