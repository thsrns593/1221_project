package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public MemberVO login(String id, String pwd) {
		MemberVO mvo =null;
		mvo = ss.selectOne("");
		return mvo;
	}
}
