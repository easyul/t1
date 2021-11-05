<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript">
	function del() {
		var con = confirm("탈퇴하시겠습니까?");
		if (con) location.href="delete.do";
		else alert("탈퇴가 취소되었습니다");
	}
</script>
</head>
<body>
<h2>${member.name }님 반갑습니다</h2>
<table>
	<tr align="center"><td><button onclick="location.href='view.do'">회원정보 조회</button></td></tr>
	<tr align="center"><td><button onclick="location.href='updateForm.do'">회원정보 수정</button></td></tr>
	<tr align="center"><td><button onclick="del()">회원탈퇴</button></td></tr>
	<tr align="center"><td><button onclick="location.href='logout.do'">로그아웃</button></td></tr>
</table>
</body>
</html>