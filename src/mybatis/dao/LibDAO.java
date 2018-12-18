package mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.LibraryVO;

public class LibDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public LibraryVO[] selectLib(LibraryVO vo) {
		
		LibraryVO[] ar = null;
		
		List<LibraryVO> list = sqlSession.selectList("lib.selectlib",vo);
		
		
		if(list != null) {
			
			ar = new LibraryVO[list.size()];
			
			list.toArray(ar);
		}
		
		return ar; 
	}
	
	public boolean insertLib(LibraryVO vo){
		
		boolean chk = false;
		
		int cnt = sqlSession.insert("lib.insertlib",vo);
		
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
}
