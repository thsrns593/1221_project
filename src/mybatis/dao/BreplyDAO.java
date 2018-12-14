package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BreplyVO;

public class BreplyDAO {
	@Autowired
	SqlSessionTemplate ss;
	
	public boolean addReply(BreplyVO vo) {
		boolean chk = false;
		int cnt =ss.insert("breply.reply", vo);
		if(cnt >0) {
			chk=true;
		}
		return chk;
	}
	public BreplyVO[] getList(String bb_num,String nowPage) {
		BreplyVO[] ar = null;
		Map<String, String> map = new HashMap<>();
		
//		map.put("begin", )
//		ss.selectList("breply.getList", )
		return ar;
	}
}
