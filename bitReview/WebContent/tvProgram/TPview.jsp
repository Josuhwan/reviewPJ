<%@page import="com.br.model.dao.BoardDAO"%>
<%@page import="com.br.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}

#title, #nickname{
   font-family: 'Nanum Myeongjo', serif;
}
#review{
   font-family: 'Nanum Myeongjo', serif;
   font-size:3rem;
   color:darkgray;
}
.media{
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: solid;
    border-left-style: none;
    border-width: 1px;
    border-color: lightgray;
}
.media:hover{
   background-color: #f2f2f2;
}

A:visited {text-decoration:none; color:#646464;}

@media (min-width: 768px) {
  .container {
    width: 800px;
  }
}
@media (min-width: 992px) {
  .container {
    width: 880px;
  }
}
.img{
    position: relative;
    background-image: url("##");                                                               
    height: 50vh;
    background-size: cover;
}
.img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);     
     font-size : 6rem;                                                              
     color: white;
     z-index: 2;
     text-align: center;
}
#hit, #updown {
	pont-size : 1rem;
}
#info{
     position: absolute;
     top:90%;
     left:30%;
     transform: translate(-50%, -50%);                                                                   
     color: white;
     z-index: 2;
     text-align: center;
}
#postedImg{
   text-align:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    $.ajaxSetup({
       async:true,
       dataType:"json",
       error:function(xhr) {
       	console.log("error html = " + xhr.statusText);
        }
    });
    
  	
  	
	 // Ajax 댓글작성
    $(function() {
        $("#replyWrite").on("click", function() {
        	let r_content = $("#replyContent").val();
            $.ajax({
                url:"tpcontroller?type=reply",
                type:"post",		
                data:{
                	r_content:$("#replyContent").val(),
                    tp_boardid:"${one.tp_boardid}"
                },
                
                success:function(data) {            
                	// 서버에 대한 정상응답이 오면 실행, callback
                    if(data.result == 1) {            
                    	// 쿼리 정상 완료, 결과
                        console.log("comment가 정상적으로 입력되었습니다.");
                        $("#replyContent").val("");
                        $("#replyList").prepend("<div>"+data.r_content+"</div>");
                    } else {
                    	alert("댓글실패");
                    }
                }
            })
        });
    });
	 
    
   
	// 글 상세 - > 목록으로(메인페이지이동) 
 	function mainGo() {	
	 	location.href = "tpcontroller?type=main";	
 	};
 	
 	function modifyGo() {
 		location.href = "tpcontroller?type=modify&tp_boardid=${one.tp_boardid}";
 	};
 	
	function deleteGo() {
		location.href = "tpcontroller?type=deleteGo";
 	};
 	
    
</script>


</head>
<body>
<br><br><br>
<header>
 	   <label id="hit">조회수 ${one.hit }</label>
   	   <label id="updown">좋아요 ${one.b_updown }</label>
   	   <input type="button" value="목록으로" id="mainList" onclick="mainGo();">
   	   <br>
 <div class="img">
   <div class="content">
       <label id="title">${one.title }</label><br>
     >
   </div>
   <div class="img-cover">
   </div>
      <div align="right" id="info">
      <h5 id="nickname">${one.writer }</h5>
         <h6>${one.b_regdate }</h6>
      </div>
</div>
</header>
<hr>
<div class="container" id="articleBody" data-post_no="#" data-post_id="#">
   <main role="main">
         <div id="selectedBook">
         <c:if test="####################">
      <table style="border-top: 1px solid #444444;border-bottom: 1px solid #444444;width:100%;">
         <tr>
             <td>
                  <img src="#################" style="width: 200; padding-top: 20px; padding-bottom: 20px">
            </td>
            <td style="padding: 20px; width:720px;">
                <h4><span>#############</span></h4>
                  <p style="color: gray;">##########</p> 
             </td>
          </tr>
       </table>
       </c:if>
       <br><br>
       <c:if test="#">
       <div id="postedImg">
          <img src="#" style="width:80%;">
       </div>
       </c:if>
       <br><br>
      </div>
    
      <c:if test="${one.b_content ne null}">
         ${one.b_content}
      </c:if>
      
      <br><br><br><br><br><br><br>
 
         <hr>
      <div align="right">
        <c:if test="${article.post_id == userInfo.id}">
          <br>
           <button id="modifyBtn" class="btn btn-outline-secondary" data-post_no="${one.tp_boardid}"
           onclick="modifyGo();">글수정</button>
           <button id="deleteBtn" class="btn btn-outline-secondary" data-post_no="${one.tp_boardid}"
           onclick="deleteGo();">글삭제</button>
        <br><br>
        </c:if>
        </div>   
          <!--------------------- 글 작성자 프로필--------------------->  
         <div>       
             <div class="border p-4">
              <div align="center">
                    <img src="##" class="align-self-start mb-3 rounded-circle"style="width:100px">
                   <a href="javascript:mvMyPage('#');"><h4>${one.writer}</h4></a> 
                <div>
                   <p>${one.tp_name}</p>
                </div>
                
                <c:if test="#">
                   <button id="followBtn" onclick="javascript:follow('$#');"  class="btn btn-outline-secondary"  style="height:40px;">구독하기</button> 
                </c:if>
                 <c:if test="#">
                   <button id="cancelFollowBtn" onclick="javascript:cancelFollow('$#');"  class="btn btn-secondary"  style="height:40px;">구독중</button> 
                </c:if>
                <button id="mvWriterPage" class="btn btn-outline-secondary" onclick="javascript:mvWriterPage('${article.post_id}');" style="height:40px;">프로필보기</button>
                
         
                </div>  <!-- <div align="center"> -->
              </div> <!--<div class="border p-4">-->
            <hr/>
        
         <h2>댓글라인</h2>
     	 <ul id="replyList">
     	 </ul>
         <c:forEach var="rvo" items="${rlist }">
         	<table class='table table-striped table-bordered' style= 'margin-top: 10px;'>
			 	<tbody>
			   		<tr align='center'>
			  			<td> ${rvo.r_writer } </td>
			 			<td> ${rvo.r_content } </td>
			   			<td> ${rvo.r_regdate } </td>
			   			<td>
			   				<c:if test="${rvo.r_writer == rvo.r_writer}">
			   				<input type="button"  value="수정" id="replyModify">
			   				<input type="button"  value="삭제" id="replyDelete">
			   				</c:if>
			   			</td>
			  		</tr>
			 	</tbody>
			 </table>	
         </c:forEach>
         		<!-- 댓글 라인 -->
	         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    			<div id="showComment" style="text-align: center;"></div>
			</div>

				<!-- 댓글 작성창 -->
	         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
	    		<textarea class="form-control" rows="3" id="replyContent" placeholder="댓글을 입력하세요." style="width: 100%;" ></textarea>
	    		<div class="btn-group btn-group-sm" role="group" aria-label="...">
	            <input type="button" class="btn btn-default" value="댓글 쓰기" id="replyWrite">
				
               
	    	</div>
		</div>
 
</main>
</div> <!-- /container -->
</body>
</html>