package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.NormalVO;

public class NormalDAO {
	//주석실험용 ㅇㄴㄹㄴㅇㄹㄴ
	@Autowired
	private SqlSessionTemplate ss;
	
	public int getNbTotalCount(NormalVO vo) {
		return ss.selectOne("normal.totalCount", vo);
	}
	
	public NormalVO[] getList(NormalVO vo) {
		// map에 담겨져 있는 begin, end로 원하는 갯수만큼의 게시물을 뽑는다.
		List<NormalVO> list = ss.selectList("normal.list", vo);
		NormalVO[] ar = null;
		if(list!=null && list.size()>0) {
			ar = new NormalVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	public boolean writeText(NormalVO vo) {
		
		int cnt =ss.insert("normal.add", vo);
		
		if(cnt >0 )
			return true;
		else
			return false;
	}
	public NormalVO getText(NormalVO vo) {
		return ss.selectOne("normal.view",vo);
	}
	public boolean delText(NormalVO vo) {
		int cnt = ss.update("normal.del",vo);
		if(cnt>0)
			return true;
		else
			return false;
		
	}
	
	public boolean editText(NormalVO vo ) {
		int cnt = ss.update("normal.edit", vo);
		if(cnt>0)
			return true;
		else
			return false;
	}
}
