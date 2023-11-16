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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-avatar@latest/dist/avatar.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/resources/css/base.css" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
img.logo-sm {
	width: 120px;
	height: 68px;
}
.blank {
	width: 175px;
	height: 71px;
}
.info {
	list-style: none;
	display: flex;
	flex-direction: column-reverse;	
}
</style>

</head>

<body>
	<div class=background>
		<header>
			<div class="blank"></div>
			<div class="blank"></div>
			<ul class="navbar-nav ml-auto info">
				<!-- <sec:authorize access="isAuthenticated()"> 
					<sec:authentication property="principal.username" var="username" />
					로그인 된 상태 -->
				<li class="nav-item pannel">
					<button type="button"
						class="btn btn-secondary dropdown-toggle togBut"
						data-bs-toggle="dropdown" aria-expanded="false">
						<img class="avatar avatar-24 bg-light rounded-circle"
							src="https://api.dicebear.com/7.x/identicon/svg?seed=대충 유저이름" />
						대충 유저이름
					</button>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">프로필</a></li>
					</ul>
				</li>
				<!-- </sec:authorize> -->

				 <!-- <sec:authorize access="isAnonymous()">
					로그아웃 된 상태
				<div>
					<li class="nav-item">
						로그인 페이지로 넘어갈 수 있게
						<button type="button" class="btn btn-outline-primary sign"
							onclick="/security/login">로그인</button> 회원가입 페이지로 넘어갈 수 있게
						<button type="button" class="btn btn-outline-primary sign"
							onclick="/security/login">회원가입</button>
					</li>
				</div>
				</sec:authorize> -->
			</ul>
		</header>