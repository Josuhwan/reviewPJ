<%@page import="com.br.model.dao.BoardDAO"%>
<%@page import="com.br.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>

#title, #nickname{
   font-family: 'Nanum Myeongjo', serif;
}

.media{
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: solid;
    border-left-style: none;
    border-width: 1px;
    border-color: lightgray;
}

@media (min-width: 768px) {
  .container {
    width: 800px;
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

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var member = "뽀로로";
    
    $(document).ready(function(){
    	getReplyList();
    });
  	
    function getReplyList() { 	
    	$.ajax({
    		url: "replyList",
    		type: "get",
    		dataType:"json",
    		async:true,
    		data:{
    			tp_boardid:"${one.tp_boardid}"
    		}, success: function(data){
					var tbody ="";
					var alist = data.rlist;
					
					$.each(alist, function(index, reply){
						tbody += "<tr align='center' data-tp_replyid='" + this.tp_replyid+ "'data-tp_boardid='" + this.tp_boardid+"' '>";
						tbody += "<td>" + this.r_writer + "</td>";
						tbody += "<td>" + this.r_content + "</td>";
						tbody += "<td>" + this.r_regdate + "</td>";
						if(this.r_writer == "뽀로로") {
						tbody += "<td><input type='button' class='modifyReply' id='modifyReply'  value='수정'></td>"
						tbody += "<td><input type='button' class='deleteBtn' id='deleteReply' value='삭제'></td>"
						}
						tbody += "</tr>";
						
					});
					$("#tbody").html(tbody);
					
    			}, 
    			error : function(jqXHR, textStatus, errorThrown){
        			alert("실패실패실패");
    				
    			}
    	});
	}
  	
	 // Ajax 댓글작성
    	function writerReply() { 
    	$.ajax({
    		url: "reply",
    		type: "post",
    		dataType:"json",
    		async:true,
    		data:{
    			r_content:$("#replyContent").val(),
                tp_boardid:"${one.tp_boardid}"
    		}, success: function(data){
    			getReplyList(data);
    		}
    	});
	 }	
	
	 // 댓글 삭제
    $(document).on("click", ".deleteBtn", function() {
    	if(confirm("댓글을 삭제하시겠습니까?")) {
    		var tp_replyid = $(this).parent().parent().data("tp_replyid");
    		var tp_boardid = $(this).parent().parent().data("tp_boardid");
			console.log("replyno " + tp_replyid);
			console.log("tp_boardid " + tp_boardid);
			$.ajax({
	            url : 'delete?tp_replyid='+tp_replyid+'&tp_boardid='+tp_boardid,
	            type : 'GET',
	            dataType : 'json',
	            success : function(data) {       
	            	getReplyList(data);
	            }       
	      }); 
    	}
    });
   
	// 댓글 수정 버튼 클릭 -> 폼 변경 -> 데이터 담기
    $(document).on("click", ".modifyReply", function() {
	   if(confirm("댓글을 수정하시겠습니까?")) {
	   		var tp_replyid = $(this).parent().parent().data("tp_replyid");
   	   		//var tp_boardid = $(this).parent().parent().data("tp_boardid");
       $.ajax({
            url : 'modifyreply?tp_replyid='+tp_replyid, //+'&tp_boardid='+tp_boardid,
            type : 'GET',
            contentType : 'application/json;charset=UTF-8',
            dataType : 'json',
            success : function(data) {
               ModifyReplyForm(data);
            }  
      }); 
	 }
   });
	
	// 댓글 폼 만들기
	function ModifyReplyForm(reply) {
		
		var output = "";
	      output += '   <div class="media-body" id="modifyComplete">';
	      output += '     <h6><b>' + reply.r_writer +'</b></h6>';
	      output += '     <div style="float:left" data-tp_replyid="' + reply.tp_replyid + '" data-tp_boardid="' + reply.tp_boardid + '">';
	      output += '        <textarea id="modifiedContent" rows="4" style="width:706px" placeholder="내용을 입력해주세요">' + reply.r_content +'</textarea>';      
	      output += '        <button id= "modifyComplete" >수정</button>';
	      output += '     </div>';
	      output += '   </div>';
	   $("#modi").append(output);   
	   
	}
	
	// 댓글 수정완료버튼
	
	 $(document).on("click", "#modifyComplete", function() {
	      var r_content = $("#modifiedContent").val();
	      var tp_boardid = $(this).parent().data("tp_boardid");
	      var tp_replyid  = $(this).parent().data("tp_replyid");

	       if(r_content.trim().length != 0) {
	         $.ajax({
	            url : 'modifyok?tp_replyid='+tp_replyid+'&tp_boardid='+tp_boardid+'&r_content='+r_content,
	            type : 'post',
	            contentType : 'application/json;charset=UTF-8',
	            dataType : 'json',
	            success : function() {
	            	alert("수정이 완료되었습니다.");
	      	       getReplyList();
	            }
	         });
	      } 
	      
	   });
	
	// 글 상세 - > 목록으로(메인페이지이동) 
 	function mainGo() {	
	 	location.href = "tpcontroller?type=main";	
 	};
 	
 	function modifyGo() {
 		location.href = "tpcontroller?type=modify&tp_boardid=${one.tp_boardid}";
 	};
 	
	function deleteGo() {
		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			 location.href = "tpcontroller?type=delete&&tp_boardid=${one.tp_boardid}";
		 }else{
		     return false;
		 }
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
         
         	<table class='table table-striped table-bordered' style= 'margin-top: 10px;'>
			 	<tbody id="tbody">
			   		
			 	</tbody>
			 	<tfoot>
			 	<tfoot>
			 </table>	
      
         		<!-- 댓글 라인 -->
	         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    			<div id="showComment" style="text-align: center;"></div>
			</div>

				<!-- 댓글 작성창 -->
				<div id ="modi" class="modi">
				</div>
	         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
	    		<textarea class="form-control" rows="3" id="replyContent" placeholder="댓글을 입력하세요." style="width: 100%;" ></textarea>
	    		<div class="btn-group btn-group-sm" role="group" aria-label="...">
	            <input type="button" class="btn btn-default" value="댓글 쓰기" id="replyWrite" onclick="writerReply()">
				
               
	    	</div>
		</div>
 
</main>
</div> <!-- /container -->
</body>
</html>