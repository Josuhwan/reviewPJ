<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램선택창</title>
<style>
	#bbs table {
		width: 1100px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th, #bbs td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.name { width: 30%; }
	.genre { width: 15%; }
	.brdcs { width: 15%; }
	.member { width: 40%; }
	
</style>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/*
	$(document).ready(function(){
		$("#getTPBtn").click(getTPList);
	});
	function getTPList() {
		alert(">> getTPlList() 실행~~~");
	
		$.ajax({
			url : "../tpcontroller?type=tplist",
			type : "get",
			dataType : "json", //응답받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				lert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
				console.log(data.list);
				
				//전달받은 JSON 데이터 처리
				var tbody = "";
				var alist = data.list; //JSON 객체의 속성명 "list"의 값 추출
				$.each(alist, function(index, member){
					//console.log("this.name : " + this.name);
					tbody += "<tr>";
					tbody += "<td>" + this.idx + "</td>";
					tbody += "<td>" + this.name + "</td>";
					tbody += "<td>" + this["age"] + "</td>";
					tbody += "<td>" + this["addr"] + "</td>";
					//tbody += "<td>" + member.regdate + "</td>";
					tbody += "<td>" + member["regdate"] + "</td>";
					
					tbody += "</tr>";
				});
				$("#tbody").html(tbody);
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
					+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n"
					+ "errorThrown : " + errorThrown);
			}
		});
}
*/


function getTPList() {
	location.href = "../tpcontroller?type=tplist";
}

function sendChildValue(name, id) {
	
	opener.setChildValue(name, id);
	window.close();
}

</script>

</head>
<body>
	<h2>프로그램선택</h2>
	<button id="getTPBtn" onclick="getTPList()">프로그램 목록보기</button>
	<hr>
	<table>
		<thead>
		<tr class="title">
			<th class="name">프로그램명</th>
			<th class="genre">장르</th>
			<th class="brdcs">방송사</th>
			<th class="member">출연진</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="tvo" items="${tplist }">
		<tr>
			<td id="name" >${tvo.tp_name}</td>
			<td>${tvo.tp_genre}</td>
			<td>${tvo.tp_brdcs}</td>
			<td>${tvo.tp_member}</td>
			<th>${tvo.tp_id}</th>
			<td><input type=button value="선택"  onclick="sendChildValue('${tvo.tp_name}','${tvo.tp_id}')"></td>
		
		</tr>
		</c:forEach>		
		</tbody>	
	</table>		
	
	<hr>
</body>
</html>