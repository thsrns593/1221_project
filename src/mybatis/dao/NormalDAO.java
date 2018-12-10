package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.NormalVO;

public class NormalDAO {
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
	public boolean writeBbs(NormalVO vo) {
		int cnt =ss.insert("bbs.add", vo);
		if(cnt >0 )
			return true;
		else
			return false;
	}
	public NormalVO getBbs(String seq) {
		return ss.selectOne("bbs.getBbs",seq);
	}
	public boolean editBbs(NormalVO vo ) {
		int cnt = ss.update("bbs.edit", vo);
		if(cnt>0)
			return true;
		else
			return false;
	}
}
