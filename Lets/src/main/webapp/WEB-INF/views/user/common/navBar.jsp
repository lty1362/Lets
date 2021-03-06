<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
	
<!-- jQuery 이용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- CSS here -->
<link rel="stylesheet" href="resources/user/assets/css/bootstrap.min.css"/>
<link rel="stylesheet" href="resources/user/assets/css/owl.carousel.min.css"/>
<link rel="stylesheet" href="resources/user/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/user/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/user/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/user/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/user/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/user/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/user/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/user/assets/css/slick.css">
<link rel="stylesheet" href="resources/user/assets/css/nice-select.css">
</head>

<body>
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<!--? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="resources/user/assets/img/logo/loader.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header ">
				<div class="header-top d-none d-lg-block">
					<!-- Left Social -->
					<div class="header-left-social">
						<ul class="header-social">
							<li><a href="#"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
							<li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
						</ul>
					</div>
					<div class="container">
						<div class="col-xl-12">
							<div
								class="row d-flex justify-content-between align-items-center">
								<!-- 지우지 말것 지우면 로그인 버튼 안쪽으로 붙음-->
								<div class="header-info-left">
									<ul>
										<li></li>
										<li></li>
									</ul>
								</div>
								<!--사이값-->
								<div class="header-info-right">
									<c:choose>
			                              <c:when test="${empty loginUser}">
			                                 <ul>
			                                    <li><a href="loginForm.me"><i class="ti-user"></i>로그인</a></li>
			                                    <li><a href="enrollForm.me"><i class="ti-lock"></i>회원가입</a></li>
			                                 </ul>
			                              </c:when>
			                              <c:otherwise>
			                                      <ul>    
			                                          <li>
			                                          	  <div class="after-login-dropdown">
			                                                  <a href="tutorMain.tm">튜터 센터</a>
			                                                  	<c:choose>
			                                                  		<c:when test="${ isTutor }">
				                                                  		<ul class="after-login-dropdown-content-tutor">
		                                                  					<li><a href="tutorFormUpdate.te?memNo=${loginUser.memNo}">튜터 수정</a></li>
		                                                  					<li style="margin-top: -10px;"><a href="tutorNotice.no?noticeType=TUTOR">튜터 공지사항</a></li>
			                                                      			<li style="margin-top: -10px;"><a href="enroll.le">새로운 수업</a></li>
		                                                      			</ul>
		                                                      		</c:when>
		                                                      		<c:otherwise>
		                                                      			<ul class="after-login-dropdown-content">
			                                                      			<li><a href="tutorEnroll.te">튜터 등록</a></li>
			                                                      			<li style="margin-top: -20px;"><a href="tutorNotice.no?noticeType=TUTOR">튜터 공지사항</a></li>
		                                                      			</ul>
			                                                      	</c:otherwise>
	                                                      		</c:choose>
			                                              </div>
			                                          </li>
			                                          <li><a href="tutorMyLesson.tm">내 클래스</a></li>
			                                          <li>
			                                              <div class="after-login-dropdown">
			                                                  <img src="resources/user/assets/img/member/man.png" width="35px" height="35px">
			                                                  <ul class="after-login-dropdown-content">
			                                                      <li><a href="myPage.me">마이페이지</a></li>
			                                                      <li style="margin-top: -10px;"><a href="logout.me">로그아웃</a></li>
			                                                  </ul>
			                                              </div>
			                                          </li>
			                                          <li style="color: #2d3092; font-weight: bolder; margin-left: 10px;">${loginUser.nickname} 님</li>
			                                      </ul>
			                              </c:otherwise>
		                           </c:choose>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="header-bottom header-sticky">
					<!-- Logo -->
					<div class="logo d-none d-lg-block">
						<a href="mainPage.le"><img src="resources/user/assets/img/logo/logo.png"
							alt="" style="width: 215px; height: 70px"></a>
					</div>
					<div class="container">
						<div class="menu-wrapper">
							<!-- Logo -->
							<div class="logo logo2 d-block d-lg-none">
								<a href="mainPage.html"><img src="resources/user/assets/img/logo/logo.png"
									style="width: 215px; height: 70px" alt=""></a>
							</div>
							<!-- Main-menu -->
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="kids.le">키즈</a></li>
										<li><a href="money.le">머니</a></li>
										<li><a href="career.le">커리어</a></li>
										<li><a href="hobby.le">취미</a></li>
										<li><a style="padding:0px 0px 40px;" href="supportNotice.su">고객센터</a>
											<ul class="submenu">
												<li><a href="supportNotice.su">공지사항</a></li>
												<li><a href="supportFaq.su">FAQ</a></li>
												<li><a href="supportInq.su">문의사항</a></li>
											</ul></li>
									</ul>
								</nav>
							</div>
							<!-- Header-btn -->
							<div class="header-search d-none d-lg-block">
								<form action="search.le" method="POST" class="form-box f-right " id="searchForm">
									<input type="text" name="search" placeholder="무엇을 배우고 싶으세요??">
									<div class="search-icon">
										<i class="fas fa-search special-tag" onclick="submitSearchForm();"></i>
									</div>									
								</form>
								
								<script>
									function submitSearchForm() {
										$("#searchForm").submit();
									}
								</script>
							</div>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>
</body>
</html>