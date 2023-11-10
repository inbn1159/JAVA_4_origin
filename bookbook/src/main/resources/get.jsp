<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--@ include file="../layouts/header.jsp" --%>
<%-- 개별 페이지 --%>
<h1>페이지 타이틀</h1>
<div>
	<h1 class="page-header mt-5">
		<i class="fa-solid fa-location-dot"></i> ${book.title}
	</h1>



	<hr>

	<div class="clearfix">
		<div class="image-panel float-left mr-3">
			<img src="${book.image}">
			<div class="sm-images mt-1 d-flex">
				<c:forEach var="image" items="${book.images}">
					<img src="${image}">
				</c:forEach>
			</div>
		</div>
		${book.description}
	</div>

	<div class="thumb-images my-5 d-flex">
		<c:forEach var="image" items="${book.recimages}">
			<a href="${image}" data-fancybox="gallery"> <img src="${image}">
			</a>
		</c:forEach>
	</div>
	<hr>

	${book.recommend}
</div>
<%--@ include file="../layouts/footer.jsp" --%>