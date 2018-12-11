package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class LoginDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public MemberVO login(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		System.out.println(id);
		System.out.println(pw);
		
		MemberVO vo = ss.selectOne("login.log",map);

		return vo;
	}
	
}
