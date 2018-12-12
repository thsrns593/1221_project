package spring.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NormalDAO;
import mybatis.dao.NreplyDAO;
import mybatis.vo.NormalVO;
import mybatis.vo.NreplyVO;

@Controller
public class Text_ReadControl {
	
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
			System.out.println("최소 게시물 리스트생성");
		}else {
			
			list = (ArrayList<NormalVO>)obj;
			
			boolean chk = false;
			int i =0;
			for(NormalVO nvo1 : list) {
				if(nvo.getNb_num().equals(nvo1.getNb_num())) {
					chk = true;
					System.out.println("탈출은 하냐");
					break;//반복문 탈출!
				}
				System.out.println("nvo :"+nvo.getNb_num());
				System.out.println("nvo"+(i++)+":"+nvo1.getNb_num());
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

				System.out.println("안본글보기");
			}
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo",nvo);
		
		mv.setViewName("text_read");
		
		
		//여기서부터 댓글 기능---------------------
		//댓글 수
		NreplyVO rvo = new NreplyVO();
		
		rvo.setNb_num(vo.getNb_num());
		
		int replycount = nreply_dao.getNreplyTotalCount(rvo);
		
		mv.addObject("replycount",replycount);
		
		//댓글 리스트
		
		NreplyVO[] nreplyar = nreply_dao.getNreplyList(rvo);
		
		mv.addObject("nreplyar",nreplyar);
		
			
		return mv;
	}
	
	//댓글 추가
	@RequestMapping("nreply.inc")
	public NreplyVO[] addNreply(NreplyVO vo) {
		NreplyVO[] nreplyar = null;
		
		nreply_dao.addNreply(vo);
		
		nreplyar = nreply_dao.getNreplyList(vo);
		
		return nreplyar;
		
	}
	
	@RequestMapping("text_del.inc")
	public ModelAndView text_del(NormalVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		boolean chk = n_dao.delText(vo);
		
		mv.setViewName("redirect: board_free.inc");
		
		return mv;
	}
}
