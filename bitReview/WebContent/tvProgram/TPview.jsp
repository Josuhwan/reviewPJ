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
    background-image: url("${root}/upload/album/${article.psavefolder}/${article.save_postPicture}");                                                               
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
</head>
<body>
<h2>일단 온거만 확인</h2>

<c:forEach var="vo" items="${view }">
	<li>${vo.board_id }, ${vo.writer }, ${vo.title }, ${vo.b_content }, $vo.{b_regdate },
	 ${vo.tp_id }, ${vo.hit }, ${vo.b_updown }
</c:forEach>

<br><br><br>
<header>
 <div class="img">
   <div class="content">
       <label id="title">${article.title}</label><br>
       <c:if test="${article.simpleReview != null}">
       <label id="review">"${article.simpleReview}"</label>
       </c:if>
   </div>
   <div class="img-cover">
   </div>
      <div align="right" id="info">
      <h5 id="nickname">by. ############</h5>
         <h6>#################</h6>
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
    
      <c:if test="${article.content ne null}">
         ${article.content}
      </c:if>
      
      <br><br><br><br><br><br><br>
 
         <hr>
      <div align="right">
        <c:if test="${article.post_id == userInfo.id}">
          <br>
           <button id="modifyBtn" class="btn btn-outline-secondary" data-post_no="${article.post_no}">글수정</button>
           <button id="deleteBtn" class="btn btn-outline-secondary" data-post_no="${article.post_no}">글삭제</button>
        <br><br>
        </c:if>
        </div>   
          <!--------------------- 글 작성자 프로필--------------------->  
         <div>       
             <div class="border p-4">
              <div align="center">
                    <img src="${root}/upload/profile/${article.saveFolder}/${article.save_proPicture}" class="align-self-start mb-3 rounded-circle"style="width:100px">
                   <a href="javascript:mvMyPage('${article.post_id}');"><h4>${article.nickname}</h4></a> 
                <div>
                   <p>${article.introduce}</p>
                </div>
                
                <c:if test="${followStatus.follow_no == null}">
                   <button id="followBtn" onclick="javascript:follow('${article.post_id}');"  class="btn btn-outline-secondary"  style="height:40px;">구독하기</button> 
                </c:if>
                 <c:if test="${followStatus.follow_no != null}">
                   <button id="cancelFollowBtn" onclick="javascript:cancelFollow('${article.post_id}');"  class="btn btn-secondary"  style="height:40px;">구독중</button> 
                </c:if>
                <button id="mvWriterPage" class="btn btn-outline-secondary" onclick="javascript:mvWriterPage('${article.post_id}');" style="height:40px;">프로필보기</button>
                
                <!--- 후원하기 
                <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal1">후원하기</button>
                
                 <div class="modal" id="myModal1">
                   <div class="modal-dialog">
                     <div class="modal-content">
                       
                       <div class="modal-header">
                         <h4 class="modal-title">후원하기</h4>
                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                       </div>
                       
                      
                       <div class="modal-body">
                        ${article.nickname} 님<br>
                        <input type="text" id ="pay">원
                        </div>
                    
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" data-dismiss="modal" id="goPay">KakaoPay결제</button>
                          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                       </div>
                     </div>
                    </div>
                   </div>
                    -->  
                </div>  <!-- <div align="center"> -->
              </div> <!--<div class="border p-4">-->
            <hr/>
         <div id="replyview">
         </div>
         
            <!---- 댓글 작성창------>
              <div class="media border p-3">
                <div class="media-body">
                     <textarea class="form-control" rows="4" placeholder="내용을 입력해주세요" id="reply_content"></textarea>
                  </div>
                  <div>
                  <button id="replyBtn"  style="margin-left: 13px;">등록</button>
                 </div>
              </div>
            <br>
       </div>
</main>
</div> <!-- /container -->
</body>
</html>