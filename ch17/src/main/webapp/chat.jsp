<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {	height: 450px; border: 2px solid green; width: 90%;
		table-layout: fixed; overflow: hidden; }
	div { height: 400px; overflow: scroll; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">/* 집은 127.0.0.1 */
	var websocket = new WebSocket("ws://172.30.1.47:8080/ch18/websocket");
	var disp;
	websocket.onopen = function() {  // 처음 연결 되면
		disp = document.getElementById("disp");
		disp.innerHTML += "연결 되었습니다<br>";
	}
	websocket.onclose = function() {  // 연결 종료
		disp.innerHTML += "종료 되었습니다<br>";
	}
	websocket.onerror = function() {  // 에러가 발생하면
		disp.innerHTML += "어이쿠 에러<br>";
	}
	websocket.onmessage = function(event) {  // 메세지가 오면
		disp.innerHTML += event.data+"<br>";
		// 자동으로 scrollbar를 움직여서 최신 메세지를 보이게 처리
		var objDiv = document.getElementById("disp");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	function webstart() {
		var message = document.getElementById("content").value;
		var name = document.getElementById("name").value;
		websocket.send(name+" > "+message); // 연결된 사람에게 메세지 전달
		document.getElementById("content").value = "";  // 입력 메세지 삭제
	}
	function init() {
		cont = document.getElementById("content");
		// 키보드를 누루고 손가락을 띄면 키보가 올라온다
		cont.addEventListener("keyup", function(event) {
			//  키보드 값                   IE에서 키값      나머지
			var keycode  = event.keyCode?event.keyCode:event.which;
			// 아스키 코드 13은 엔터
			if (keycode == 13) webstart();
			event.stopPropagation();  // 이벤트를 전달 금지
		});
	}
</script></head><body onload="init()">
별명 : <input type="text" name="name" id="name">
<table border="1">
	<tr><th height="400" id="a"><div id="disp"></div></th></tr>
	<tr><th height="50"><input type="text" id="content"><br>
		<button onclick="webstart()">웹 채팅</button></th></tr>
</table>
</body>
</html>