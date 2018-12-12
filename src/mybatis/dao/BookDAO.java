package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BookVO;

public class BookDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	public int getTotalCount(Map<String,String> map) {
		return ss.selectOne("book.totalCount", map );
	}
	public BookVO[] searchCate(Map<String,String> map) {
		BookVO[] ar = null;
		List<BookVO> list = ss.selectList("book.cate", map);
		if(list!=null && list.size()>0) {
			ar = new BookVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	public BookVO[] getList(Map<String,String> map) {
		BookVO[] ar = null;
		List<BookVO> list = ss.selectList("book.list", map);
		if(list!=null && list.size()>0) {
			ar = new BookVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	public BookVO getBbs(String num) {
		return ss.selectOne("book.getBbs",num);
	}
}
