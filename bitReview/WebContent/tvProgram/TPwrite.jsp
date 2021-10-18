<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">

<style>
#title {
	height: 100px;
	width: 100%;
	font-size: 40pt;
	border: 0px;
}
</style>

</head>
<script>
	$(document).ready(function() {
		
		$("#writeBtn").click(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력해주세요");
				return;
			} else if ($("#tp").val() == "") {
				alert("TV프로그램 선택해주세요 !!");
				return;
			} else if ($('#summernote').summernote('isEmpty')) {
		        alert("내용 입력해주세요 !!");
		        return;	
			}  else if ($("#file").val() == "") {
				alert("파일을 선택해주세요 !!");
				return;
			}	
			$("#writeForm").attr("method", "post").attr("action","../tpcontroller?type=write").submit(); 
		});
		
		$('#summernote').summernote({
			placeholder: '최대 300자 작성 가능합니다.',
	        height: 500,
	        lang: 'ko-KR',
	        callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	        		for(var i = files.length -1; i>=0; i--) {
	        			sendFile(files[i], this);
	        		}
	        	}
	        }
		});
		
	});	
	
	function tpList() {
		window.name ="TPwrite.jsp"
		
		window.open("TPList.jsp", "tplist", "width = 1100, height = 500, resizable = no, scrollbars = no, status = no");
	}
	
	function setChildValue(name, id) {

		document.getElementById("tp").value = name;
		document.getElementById("tpid").value = id;
	}
	
	function cancel() {
		location.href = "../tpcontroller?type=main";
	}
	
</script>
<body>
<div class="content">
	<div class ="wrap">
	<form action="" id="writeForm"  method="post" enctype="multipart/form-data">
		<div>
	    	<input type="text"  id="title" name="title" placeholder="제목을 입력하세요." maxlength="30" >
	    </div>
	    <div>
	    	<span><input type="file" name= tpfile id ="file"></span>	    
	    </div>
	    <div>
	    	<input type="text" id="tp" name="tpname" placeholder="tp 선택">
	    	<input type="hidden" id="tpid" name="tpid" value="tpid">  
	    	<button type="button"  onclick="tpList()" >TV프로등록</button>
	    </div>
	    <div>
	    	<input type="text" name="writer" placeholder="임시작성자">
	    </div>
		<textarea id="summernote"  name="b_content"></textarea>
	</form>
	<hr>
	<br>
	
	<button type="submit" id="writeBtn" >글쓰기</button>
	<button type="button" id="cancel" onclick="cancel()" >취소</button>
	</div>
</div>
<input type="hidden" id="tpList" value="
<c:forEach var="tvo" items="${tplist }">
				<div>${tvo.tp_name}</div>
				<div>${tvo.tp_member}</div>
				<div>${tvo.tp_genre}</div>
				<div>${tvo.tp_brdcs}</div>
</c:forEach>
">
</body>
</html>