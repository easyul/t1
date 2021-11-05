package ch17.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch17.dao.MemberDao;
import ch17.model.Member;

public class Confirm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		if (member == null) msg = "사용 가능한 아이디입니다";
		else msg = "이미 사용 중인 아이디입니다";
		request.setAttribute("msg", msg);
		return "confirm";
	}
}
