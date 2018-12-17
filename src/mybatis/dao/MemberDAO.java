package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class MemberDAO {

	@Autowired
	private SqlSessionTemplate ss;

	public MemberVO login(String id, String pwd) {
		MemberVO mvo = null;
		mvo = ss.selectOne("");
		return mvo;
	}

	public boolean join(MemberVO vo) {
		int cnt = ss.insert("member.addjoin", vo);

		if (cnt > 0)
			return true;
		else
			return false;
	}

	public MemberVO searchId(String id) {
		MemberVO mvo = null;
		mvo = ss.selectOne("member.searchId", id);
		return mvo;
	}

	public MemberVO searchEmail(String email) {
		MemberVO mvo = null;
		mvo = ss.selectOne("member.searchEmail", email);
		return mvo;
	}

	public boolean upInfo(MemberVO vo) {
		int cnt = ss.update("member.updateinfo", vo);
		if (cnt > 0)
			return true;
		else
			return false;
	}

	public boolean delDate(MemberVO vo) {
		int cnt = ss.update("member.deldate", vo);
		if (cnt > 0)
			return true;
		else
			return false;
	}
}
