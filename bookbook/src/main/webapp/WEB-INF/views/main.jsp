<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="layouts/header2.jsp"%>

<script src="/resources/js/search.js"></script>

<div class="main">
	<img class="logo" src="/resources/images/logo1.png">
	<!-- 검색창 -->
	<form:form id="searchForm" action="/recommend" method="GET">
		<!-- action 값을 상세페이지로 변경 -->
		<div class="mx-auto mt-5 input-group mb-3 search-bar">
			<div class="input-group-prepend">
				<select class="form-control rounded-0" id="dropBoard" name="board">
					<option disabled selected>카테고리 선택</option>
					<option value="cate1">카테고리1</option>
					<option value="cate2">카테고리2</option>
				</select>
			</div>
			<input type="text" class="form-control" name="keyword"
				placeholder="키워드를 입력해주세요"> <img type="button"
				class="searching" src="/resources/images/search.png">
		</div>
	</form:form>
</div>
</div> <!-- <div class="background용"> 없애지 마시오-->


<style>
div.main {
	margin: 8%;
}

img.logo {
	width: 250px;
	margin: auto;
	display: block;
}

.search-bar {
	width: 60%;
}

.searching {
	margin-left: -35px;
	padding-right: 15px;
	width: 50px;
	position: relative;
}
</style>
<%@include file="layouts/footer.jsp"%>