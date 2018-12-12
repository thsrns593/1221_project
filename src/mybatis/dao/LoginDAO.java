package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class LoginDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public MemberVO login(String m_id, String m_pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pwd", m_pwd);
		
		
		MemberVO vo = ss.selectOne("login.log",map);

		return vo;
	}
	
	public MemberVO loginInfo(MemberVO vo) {
		return ss.selectOne("login.loginInfo",vo);
	}
}
