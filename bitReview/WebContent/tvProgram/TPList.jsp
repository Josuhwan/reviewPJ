<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램선택창</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
</script>

</head>
<body>
	<h2>프로그램선택</h2>
	<button id="getTPBtn">프로그램 선택</button>
	<hr>
	<table border>
		<tbody>	
		</tbody>
	</table>
	<hr>

</body>
</html>