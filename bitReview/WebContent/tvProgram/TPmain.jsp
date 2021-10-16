<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <!--
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="../resources/css/shop-homepage.css" rel="stylesheet">
-->
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
    width: 260px;
    height: 360px;
}
</style>
<meta charset="UTF-8">
<title>메인</title>
<script>
	function postView() {
		location.href = "tpcontroller?type=view";
	}
</script>
</head>
<body>
<!-- Navigation -->
		<ul class="liststyle">
		<c:forEach var="vo" items="${list }">
			<a title="${vo.tp_boardid }" href="tpcontroller?type=view&tp_boardid=${vo.tp_boardid}">
	        <li>
	        	<div>영화이미지</div>
	        	<div>${vo.title}</div>
	        	<div>${vo.writer}</div>
	        	<div>방송사</div>
	        	<div>나라</div>
			</li>        
   			</a>
		</c:forEach>
		</ul>
		
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-1">


      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-10">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          
          
        </div>
        <div class="row">  
          <div class="col-lg-3 col-md-6 mb-4" style="background-color: purple;" onclick="postView()">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="#" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${vo.title }</a>
                </h4>
                <h4>${vo.writer }</h4>
                <p class="card-text">오징어게임, 넷플릭스, 드라마</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
		  
    
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  
<!-- Bootstrap core JavaScript 
  <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  -->
  

</body>
</html>