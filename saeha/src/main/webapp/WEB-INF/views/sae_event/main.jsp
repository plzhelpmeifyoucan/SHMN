<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
</head>
<script>
	function popup() {
		var url = "/sae_event/recruit";
		var name = "popup test";
		var option = "width = 615, height = 470, top = 100, left = 200"
		window.open(url, name, option);
	}
</script>
<body>
	<div style="width: 100%; height: 400px"><img src="/resources/img/bnr2.jpg"></div>
	<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">

	<div style="display: flex">
		<div>
			<input onclick="popup()" type="button" value="응모방법">
		</div>
		<div>
			<a href="/sae_event/register">응모하기</a>
		</div>
	</div>
	<div style="display: flex;">
		<c:forEach var="popular" items="${popular }" varStatus="status">
			<div style="width: 28%">
				<div style="width: 100%; height: 300px"><img src="/resources/img/11111.png" style="width:100px; position: absolute;" /><a href="/sae_event/detail?bno=${popular.et_bno }">
				<img style="width:100%; border:4px solid #b4c3ff"
					src="/resources/eventimg/${popular.et_file}" /></a></div>
					<div style="display:flex; justify-content:space-between;">
				<div>${popular.et_title }</div>
				<div>
					투표수 ${popular.et_vote } <a
						href="/sae_event/upvote?bno=${popular.et_bno }&resultvote=${popular.et_vote}">투표하기</a>
				</div></div>
			</div>
				<div style="width: 5%"></div>
		</c:forEach>
	</div>
	<div style="display: flex; flex-flow: wrap">
		<c:forEach var="recently" items="${recently }">
			<div style="width: 28%;"><div style="width:100%; height: 300px">
				<a href="/sae_event/detail?bno=${recently.et_bno }">
					<img style="width:100%;" src="/resources/eventimg/${recently.et_file}" />
				</a></div>
				<div style="display:flex; justify-content:space-between;">
				<div>${recently.et_title } </div>
				<div>투표수 ${recently.et_vote } <a
						href="/sae_event/upvote?bno=${recently.et_bno }&resultvote=${recently.et_vote}">투표하기</a>
				</div></div>
			</div>
			<div style="width: 5%"></div>
		</c:forEach>
	</div>
</div></div></div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>

</body>
</html>