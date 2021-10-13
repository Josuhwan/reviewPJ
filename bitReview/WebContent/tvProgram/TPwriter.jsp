<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">

<!-- 네비바 -->
<%@ include file="navbar.jsp" %>

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
		$('#summernote').summernote({
			height: 500	
		});
	});	
</script>
<body>

<div class="content">
	<div class ="wrap">
	<form action="../tpcontroller?type=writer" method="post" enctype="multipart/form-data">
		<div>
	    	<input type="text"  id="title" name="title" placeholder="제목을 입력하세요." maxlength="30" >
	    </div>
	    <div>
	    	<span><input type="file" name= tpfile></span>	    
	    </div>
	    <div>
	    	<input type="text" name="tpid" placeholder="tp 선택"> 
	    	<button type="button" class="" data-toggle="" data-target="">TV프로등록</button>
	    </div>
	    <div>
	    	<input type="text" name="writer" placeholder="임시작성자">
	    </div>
		<textarea id="summernote" name="b_content"></textarea>
		
		<div>
	    	<button type="submit" >등록</button>
	    </div>
	</form>
	<button type="button" >취소</button>
	</div>
</div>

</body>
</html>