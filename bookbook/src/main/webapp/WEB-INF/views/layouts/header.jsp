<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Bookbook</title>
<head>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- 글꼴 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<!-- css링크 -->
<link rel="stylesheet" href="/resources/css/base.css" />
<!-- bootstrap js -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
	
<style>
.blank {
/* 	border: 3px solid red; */ /* 레이아웃 표시용 빈 상자 테두리 */
	width: 140px;
	height: 39px;
}

.dropdown-menu {
	
}
</style>
</head>
<body>
	<div class=background>
		<header>
			<div class="blank"></div>
			<a href="/">
				<img class="logo_sm" src="/resources/images/logo1.png">
			</a>
			<!-- 이미지 누르면 화면 이동 기능 -->
			<ul class="navbar-nav sign">
				<!-- 			<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.username" var="username" />
					로그인 된 상태
				<li class="nav-item">
					<div class="btn-group">
						<button type="button" class="btn btn-secondary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">
							<img class="avatar"
								src="https://api.dicebear.com/7.x/identicon/svg?seed=대충 아이디" />
							대충 아이디 js로 아이디 받아서 뜨도록
						</button>

						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">프로필</a></li>
						</ul>
					</div> 
				</li>

				</sec:authorize>
				<sec:authorize access="isAnonymous()"> -->


				<li class="nav-item sign">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/security/login'">
						<!-- 코드보기 편하게용 주석 -->
						로그인
					</button>
				</li>
				<li class="nav-item sign">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/security/signup'">
						<!-- 코드보기 편하게용 주석 -->
						회원가입
					</button>
				</li>

				<!-- </sec:authorize> -->
			</ul>
		</header>