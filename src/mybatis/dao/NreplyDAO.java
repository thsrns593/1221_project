package mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import mybatis.vo.NreplyVO;

public class NreplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시물의 댓글수
	public int getNreplyTotalCount(NreplyVO vo) {
		
		int a= 0;
		
		int cnt =  sqlSession.selectOne("reply.totalCount",vo);
		
		if(cnt>0)
			a = cnt;
		
		return a;
	}
	
	//게시물의 댓글 가져오기
	public NreplyVO[] getNreplyList(NreplyVO vo) {
		NreplyVO[] ar = null;
		
		List<NreplyVO> list = sqlSession.selectList("reply.list",vo);
		
		if(list != null && !list.isEmpty()) {
			ar = list.toArray(new NreplyVO[list.size()]);
		}
		
		return ar;
	}
	
	//게시물의 댓글 추가하기
	public boolean addNreply(NreplyVO vo) {
		boolean chk = false;
		
		int cnt = sqlSession.insert("reply.add",vo);
		int cnt2 = sqlSession.update("reply.upnb_count",vo);
		
		if(cnt > 0 && cnt2 > 0)
			chk = true;
		
		return chk;
	}
	//게시물의 댓글 추가하기
	public boolean addNreply2(NreplyVO vo) {
		boolean chk = false;
		
		int cnt = sqlSession.insert("reply.add2",vo);
		int cnt2 = sqlSession.update("reply.upnb_count",vo);
		
		if(cnt > 0 && cnt2 > 0)
			chk = true;
		
		return chk;
	}
	
	//게시물 삭제
	public boolean delNreply(NreplyVO vo) {
		
		boolean chk = false;
		
		int cnt = sqlSession.update("reply.del",vo);
		
		if(cnt > 0)
			chk = !chk;
		
		return chk;
	}
}
