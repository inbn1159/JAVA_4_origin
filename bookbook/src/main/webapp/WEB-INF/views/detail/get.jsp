<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--@ include file="../layouts/header.jsp" --%>
<%-- 개별 페이지 --%>
<h1>상세 페이지</h1>
<div>
	<h1 class="page-header mt-5">
		<i class="fa-solid fa-location-dot"></i> 책제목${book.title}
	</h1>



	<hr>

	<div class="clearfix" style="border:1px solid; padding:10px; border-radius: 15%;">
		<div class="image-panel float-left mr-3">
			<img src="책 이미지${book.image}">
			<div class="sm-images mt-1 d-flex">
				<c:forEach var="image" items="책 이미지${book.images}">
					<img src="책 이미지${image}">
				</c:forEach>
			</div>
		</div>
		책 설명입니다.${book.description}
	</div>

	<div class="thumb-images my-5 d-flex">
		<c:forEach var="image" items="추천이미지${book.recimages}">
			<a href="이미지${image}" data-fancybox="gallery"> <img src="이미지${image}">
			</a>
		</c:forEach>
	</div>
	<hr>

	책 추천평${book.recommend}
</div>
<%--@ include file="../layouts/footer.jsp" --%>
