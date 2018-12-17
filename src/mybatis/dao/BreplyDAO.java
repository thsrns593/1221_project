package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BreplyVO;

public class BreplyDAO {
	@Autowired
	SqlSessionTemplate ss;
	public static final int BLOCK_LIST = 20;
	public boolean addReply(BreplyVO vo) {
		boolean chk = false;
		int cnt =ss.insert("breply.reply", vo);
		if(cnt >0) {
			chk=true;
		}
		return chk;
	}
	public BreplyVO[] getList(String bb_num,String replyPage) {
		BreplyVO[] ar = null;
		Map<String, String> map = new HashMap<>();
		int begin = 0;
		int end =0;
		if(replyPage == null || replyPage.equals("")) {
			replyPage = "1";
		}
		begin = (Integer.parseInt(replyPage) -1 )* BLOCK_LIST +1;
		end = begin + BLOCK_LIST -1;
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("bb_num", bb_num);
		List<BreplyVO> list =  ss.selectList("breply.getList", map);
		if(list !=null) {
			ar = new BreplyVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	public boolean deleteReply(String breply_num) {
		System.out.println("삭제 idx : "+breply_num);
		int cnt =ss.update("breply.del", breply_num );
		if(cnt >0)
			return true;
		return false;
	}
}
