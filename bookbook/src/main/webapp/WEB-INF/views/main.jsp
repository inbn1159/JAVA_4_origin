<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="layouts/header2.jsp"%>

<div class="main"> <!-- 이 안에 본문 내용 넣어주시고 class 명도 꼭 같이 넣어주세요 -->
	<img class="logo" src="/resources/images/logo1.png">
	<!-- 검색창 -->
	<form action="/search" method="GET">
	<!-- action 값을 상세페이지로 변경 -->
    <div class="mx-auto mt-5 search-bar input-group mb-3 search-bar">
      <input name="q" type="text" class="form-control rounded-pill" placeholder="추천 키워드를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
      <div class="input-group-append">
      </div>
    </div>
  </form>
</div>
</div>

<%@include file="layouts/footer.jsp"%>