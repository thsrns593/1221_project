package spring.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.BreplyDAO;
import mybatis.vo.BookVO;
import mybatis.vo.BreplyVO;

@Controller
public class BookReplyControl {
	@Autowired
	BreplyDAO br_dao;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value="breply_write.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> breply_write(String bb_num, String m_id, String breply_content, String replyPage,String breply_to, String breply_group) {
		System.out.println("bb_num: "+bb_num + " m_id"+m_id + " breply_content"+ breply_content+" replyPage");
		BreplyVO vo = new BreplyVO();
		
		vo.setBb_num(bb_num);
		vo.setM_id(m_id);
		vo.setBreply_content(breply_content);
		vo.setBreply_to(breply_to);
		vo.setBreply_group(breply_group);
		vo.setBreply_ip(request.getRemoteAddr());
		Map<String, Object> map = new HashMap<>();
		boolean b =br_dao.addReply(vo);
		//책 게시물의 댓글 수 컬럼을 증가 시켜야 한다
		System.out.println("댓글? : "+b);
		if(replyPage == null || replyPage.equals("")) 
			replyPage ="1";
		
		BreplyVO[] ar = br_dao.getList(bb_num, replyPage);
		map.put("ar", ar);
		
		return map;
	}
	@RequestMapping("breply_delete.inc")
	@ResponseBody
	public Map<String, Object> breply_delete(String bb_num,  String replyPage,String breply_num) {
		Map<String, Object> map = new HashMap<>();
		boolean b =br_dao.deleteReply(breply_num);
		//책게시물의 댓글수 컬럼을 감소 시켜줘야 한다
		
		BreplyVO[] ar = br_dao.getList(bb_num, replyPage);
		map.put("ar", ar);
		
		return map;
	}
}
