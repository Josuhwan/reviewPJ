<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
ul.liststyle, ol.liststyle {
	display: inline-block;
	list-style: none;
	margin: 20px;
	padding: 50px;
	width: 100%;
}

ul.liststyle li, ol.liststyle li {
	display: inline-block;
	padding: 20px;
	margin-bottom: 30px;
	margin-left: 20px;
	border: 1px solid #efefef;
	font-size: 12px;
	cursor: pointer;
	width: 270px;
	height: 440px;
}
</style>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script>
	function tpWriter() {
		location.href = "tvProgram/TPwrite.jsp";
	}
	function orderBy() {
		alert("여긴옵니까");
		$("#orderBy").attr("method", "post").attr("action","tpcontroller?type=main").submit();
		
	}
	
	
</script>
</head>
<body>
	<input type="button" value="글쓰기" onclick="tpWriter();">
	<form action="" id="orderBy" method="post">
	<input type="hidden" name="${vo.tp_boardid}">
		<select name="idx" onchange="orderBy()">
			<option value="0">정렬기준</option>
			<option value="1">조회순</option>
			<option value="2">인기순</option>
			<option value="3">최신순</option>
		</select>
	</form>
	<ul class="liststyle">
		<c:forEach var="vo" items="${list }">
			<a href="tpcontroller?type=view&tp_boardid=${vo.tp_boardid}">
			<li>
				<div>
				<img src="resources/upload/${vo.f_name}" alt="이미지" width="250" height="360">
				</div>
				<div>제목 ${vo.title}</div>
				<div>작성자 ${vo.writer}</div>
				<div>조회수 ${vo.hit}</div>
				<div>좋아요 ${vo.b_updown}</div>
			</li>
			</a>
		</c:forEach>
	</ul>

</body>
</html>