<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다")
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}
	function chk2() {
		if (!frm.id.value) {
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
// 변수 id에 입력한 id를 담아서 포스트 방식으로 confirm.do를 실행하고 그 결과를 id가 err인 곳에 html 형식으로 출력
		$.post('confirm.do',"id=" + frm.id.value, function(data) {
			$('#err').html(data);
		});
	}
</script>
</head>
<body>
<div align="center">
<form action="join.do" method="post" name="frm" onsubmit="return chk()">
<table><caption>회원가입</caption>
	<tr><th>아이디</th>
		<td><input type="text" name="id" required="required" autofocus="autofocus">
			<input type="button" value="중복체크" onclick="chk2()">
			<div id="err"></div>
	<tr><th>암호</th>
		<td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th>
		<td><input type="password" name="password2" required="required"></td></tr>
	<tr><th>이름</th>
		<td><input type="text" name="name" required="required"></td></tr>
	<tr><th>주소</th>
		<td><input type="text" name="address" required="required"></td></tr>
	<tr><th>전화</th>
		<td><input type="tel" name="tel" required="required" pattern="010-\d{3,4}-\d{4}"
			placeholder="010-1111-1111" title="전화형식 010-숫자 3/4-숫자 4"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
<br>
<button onclick="location.href='loginForm.do'">로그인</button>
</div>
</body>
</html>