package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BookDAO {
	@Autowired
	private SqlSessionTemplate ss;
}
