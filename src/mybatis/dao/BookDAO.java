package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BookVO;

public class BookDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	//카테고리,검색된 총게시물 수
	public int getTotalCount(Map<String,String> map) {
		return ss.selectOne("book.totalCount", map );
	}
	
	//카테고리별 게시물들
	public BookVO[] searchCate(Map<String,String> map) {
		BookVO[] ar = null;
		List<BookVO> list = ss.selectList("book.cate", map);
		if(list!=null && list.size()>0) {
			ar = new BookVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//카테고리, 검색된 게시물들
	public BookVO[] getList(Map<String,String> map) {
		BookVO[] ar = null;
		List<BookVO> list = ss.selectList("book.list", map);
		if(list!=null && list.size()>0) {
			ar = new BookVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	
	//하나의 게시물 보기
	public BookVO getBbs(String num) {
		return ss.selectOne("book.getBbs",num);
	}
	
	//게시물 삭제처리
	public boolean deleteBbs(String num) {
		boolean b = false;
		int cnt = ss.update("book.deleteBbs", num);
		if(cnt >0)
			b = true;
		
		return b;
	}
}
