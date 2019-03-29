<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 首頁樣式 -->
<link rel='stylesheet'	href='${pageContext.request.contextPath}/search/css/indexCarousel.css'	type="text/css" />
<link href="${pageContext.request.contextPath}/login/css/landing-page.css" rel="stylesheet">
<title>租你幸福~*</title>
</head>
<body style="background-color:  peachpuff;">
<!-- header -->
<div style="height: 75px;">
<%@include file="login/narbar.jsp"%>
</div>
  <!-- Masthead -->
  <header class="masthead text-white text-center" style="background: url(http://upload.cc/i1/2019/03/22/ZhpAo8.jpg) no-repeat center center;" >
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">租的快速，住的幸福</h1>
        </div>
        <div class="col-md-10 col-lg-12 col-xl-12 mx-auto">
            <div class="form-row">
              <div class="col-md-9">
                <div id="zipcode3" class="row form-group">
				 <span class="col-md-2 mx-auto" data-role="county" style="padding: 0; margin: 0">
				 </span>
				 <span class="col-md-3 mx-auto" data-role="district" style="padding: 0; margin: 0">
				 </span>
				 <div class="col-md-7 input-group" style="padding: 0; margin: 0 ;">
              		<input type="text" class="form-control" placeholder="路/巷/弄/號/樓">
               	 </div>
                </div>
              </div>
              <div class="col-md-2">
                <button type="submit" class="btn btn-block btn-primary">搜尋找幸福 Click!</button>
              </div>
          </div>
        </div>
      </div>
    </div>
     
  </header>
  	<div style="margin-left:100px;margin-top:30px;text-align:left;"><span class="font-22B">精選推薦</span></div>
 <div class = "carouselDiv"  style="clear:both;"></div>
  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">關於我們</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="<spring:url value='/membercontrol/memberservice/serviceform' />">回報問題</a>
            </li>   
             <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              	聯絡我們:iiieeit105@gmail.com
            </li>   
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy;RentHouse.租你幸福.2019-04-03</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
  <script>
  $("div.col-md-2 button").click(function(){
	  var text = $("div.col-md-9 input").val();
	  var id = "keyWord";
	  sessionStorage.setItem("clearList",text)
	  sessionStorage.setItem(id,text);
	  window.location.href="${pageContext.request.contextPath}/search/searchPage_sessionStorage";
  });
  $.ajax({
		url:"${pageContext.request.contextPath}/search/searchPage_carousel",
		type:"Get",
		cache:"false",
		success:function(data){
				$(".carouselDiv").html(data);
		}
	});
  </script>
</body>
</html>