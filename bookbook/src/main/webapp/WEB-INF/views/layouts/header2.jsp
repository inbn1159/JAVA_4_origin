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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<link rel="stylesheet" href="/resources/css/base.css" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.blank {
	border: 3px solid red;
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
			<img class="logo_sm" src="/resources/images/logo1.png">
			<ul class="navbar-nav sign">
				<!-- <sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.username" var="username" />
					로그인 된 상태 -->
				<li class="nav-item">
					<!-- Example single danger button -->
					<div class="btn-group">
						<button type="button" class="btn btn-second dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">Action</button>
						
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Separated link</a></li>
						</ul>
					</div>
					<!-- <div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle info"
							type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<img class="avatar"
								src="https://api.dicebear.com/7.x/identicon/svg?seed=대충 아이디" />
							대충 아이디
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">프로필</a></li>
						</ul>
					</div> -->
				</li>





				<!-- </sec:authorize> -->
				<%-- <sec:authorize access="isAnonymous()">
					로그아웃 된 상태
					<li class="nav-item sign"><a class="nav-link"
						href="/security/login"> <i
							class="fa-solid fa-right-to-bracket"></i> 로그인
					</a></li>
					<li class="nav-item sign"> / </li>
					<li class="nav-item sign"><a class="nav-link"
						href="/security/signup"> <i class="fa-solid fa-user-plus"></i>
							회원가입
					</a></li>
				</sec:authorize> --%>
			</ul>
		</header>