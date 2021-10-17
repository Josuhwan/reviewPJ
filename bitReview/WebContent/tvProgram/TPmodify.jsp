<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="bitReview/resources/js/summernote/summernote-lite.js"></script>
<script src="/bitReview/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">

<style>
#title {
	height: 100px;
	width: 100%;
	font-size: 40pt;
	border: 0px;
}
</style>
<script>

	function modifyOk() {
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
		location.href = "tpcontroller?type=modifyok&tp_boardid=${one.tp_boardid}";
	}
	
	function cancel() {
		location.href = "tpcontroller?type=view&tp_boardid=${one.tp_boardid}";
	}
</script>
</head>
<body>

<br><br><br>
<div class="content">
	<div class ="wrap">
	<form action="tpcontroller?type=modifyok&tp_boardid=${one.tp_boardid}" method="post" enctype="multipart/form-data">
		<div>
	    	<input type="text"  id="title" name="title" value="${one.title }" maxlength="30" >
	    </div>
	    <div>
	    	<span><input type="file" name= tpfile value="${one.f_name}"></span>	    
	    </div>
	    <div>
	    	<input type="text" name="tpid" value="${one.tp_name }"> 
	    	<button type="button" class="" data-toggle="" data-target="">TV프로등록</button>
	    </div>
	    <div>
	    	<input type="text" name="writer" value="${one.writer}">
	    </div>
		<textarea id="summernote" name="b_content" >${one.b_content }</textarea>
		<div></div>
		<br>
		<hr>
		<button type="submit" >글수정</button>
		<button id="deleteBtn" class="btn btn-outline-secondary" data-post_no="${one.tp_boardid}"
           onclick="cancel();">취소</button>
	</form>
	</div>
</div>
       
         
      <div align="right">
        <c:if test="${article.post_id == userInfo.id}">
          <br>      
     
        <br><br>
        </c:if>
        </div>   
          <!--------------------- 글 작성자 프로필--------------------->  
         <div>       

        
         
</main>
</div>
</body>
</html>