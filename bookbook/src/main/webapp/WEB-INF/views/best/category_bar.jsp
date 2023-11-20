<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>
<h1>페이지 타이틀</h1>
<div class="d-flex justify-content-between align-items-center my-4">
	<div>총 ${pageMaker.total} 건 ( ${pageMaker.cri.pageNum} ..
		${pageMaker.totalPage })</div>
	<div class="parent">
		<div class="first">종합</div>
		<div class="second">트렌드</div>
		<div class="third">소설</div>
		<div class="fourth">비소설</div>
	</div>
</div>
<%@ include file="../layouts/footer.jsp"%>