package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.NormalVO;

public class NormalDAO {
	//실험용 주석 입력합니다1
	@Autowired
	private SqlSessionTemplate ss;
	
	public int getTotalCount() {
		return ss.selectOne("normal.totalCount");
	}
	public NormalVO[] getList(Map<String, String> map) {
		// map에 담겨져 있는 begin, end로 원하는 갯수만큼의 게시물을 뽑는다.
		List<NormalVO> list = ss.selectList("normal.getList", map);
		NormalVO[] ar = null;
		if(list!=null && list.size()>0) {
			ar = new NormalVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	public boolean addBbs(NormalVO vo) {
		int cnt =ss.insert("normal.add", vo);
		if(cnt >0 )
			return true;
		else
			return false;
	}
	public NormalVO getBbs(String seq) {
		return ss.selectOne("normal.getBbs",seq);
	}
	public boolean editBbs(NormalVO vo ) {
		int cnt = ss.update("normal.edit", vo);
		if(cnt>0)
			return true;
		else
			return false;
	}
}
