package ch17.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch17.dao.MemberDao;
import ch17.model.Member;

public class Login implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		int result = 0; // 암호 불일치
		if (member == null || member.getDel().equals("y")) result = -1; // 아이디 미존재 또는 삭제
		else if (member.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			result = 1; // 로그인 성공
		}
		request.setAttribute("result", result);
		return "login";
	}
}
