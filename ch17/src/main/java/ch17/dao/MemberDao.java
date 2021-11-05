package ch17.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ch17.model.Member;

public class MemberDao {
	// singleton
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static { // 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("연결 에러 : " + e.getMessage());
		}
	}
	public Member select(String id) {
		// selectOne 한 건 조회 , selectList 여러건 조회
		return (Member) session.selectOne("memberns.select",id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert",member);
	}
	public int update(Member member) {
		return session.update("memberns.update",member);
	}
	public int delete(String id) {
		return session.update("memberns.delete",id);
	}
}
