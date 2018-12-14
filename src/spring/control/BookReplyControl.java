package spring.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("breply_write.inc")
	@ResponseBody
	public Map<String, Object> breply_write(String bb_num, String m_id, String breply_content, String replyPage) {
		System.out.println("bb_num: "+bb_num + " m_id"+m_id + " breply_content"+ breply_content+" replyPage");
		BreplyVO vo = new BreplyVO();
		vo.setBb_num(bb_num);
		vo.setM_id(m_id);
		vo.setBreply_content(breply_content);
		vo.setBreply_ip(request.getRemoteAddr());
		Map<String, Object> map = new HashMap<>();
		boolean b =br_dao.addReply(vo);
		System.out.println("댓글? : "+b);
		if(replyPage == null || replyPage.equals("")) 
			replyPage ="1";
		
		BreplyVO[] ar = br_dao.getList(bb_num, replyPage);
		map.put("r_list", ar);
		return map;
	}
	
}
