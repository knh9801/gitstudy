<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="reviewsProductPage" name="reviewsProduct"/>
</jsp:include>

<title>리뷰 List</title>
<!-- rFilename -->
<link rel="stylesheet" type="text/css" href="resources/assets/style/reviews.css">
<!-- rRating -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

	<div class="wrap">
	
		<br/><br/><br/>
		<c:if test="${empty rList }">
			가장 먼저 리뷰를 작성해 보세요.<br/>
		</c:if>
		<h3>전체 : ${totalCount }개 리뷰</h3>
		<c:if test="${not empty rList }" >
			<h5>포토 리뷰</h5>
			<c:forEach var="rDTO" items="${rList}">
				<!-- 사진 파일이 있을 때 -->
				<c:if test="${not empty rDTO.rFilename }">
					
					<div class="photo_reviews">
							<!-- mId, rNo- 히든 , rFilename, rRating, rLike, rRegdate -->
					${rDTO.rNo}<br/>
					${rDTO.mId}<br/>
					<!-- reviewsList에서 50  < 글 자르기  -->
					${rDTO.rContent.length() > 50 ? rDTO.rContent.substring(0, 50) : rDTO.rContent}<br/>
					<img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath}/resources/reviewsStorage/${rDTO.rFilename}"><br/>
					<c:forEach begin="1" end="${rDTO.rRating }" step="1">
					<i class="fas fa-star fa-2x"></i>
					</c:forEach>
					<c:forEach begin="1" end="${5-rDTO.rRating }" step="1">
					<i class="far fa-star fa-2x"></i> 
					</c:forEach><br/>
					${rDTO.rRegdate }<br/>
					<%-- 	${rDTO.rLike }<br/> --%>
					<a href="reviewsViewPage?rNo=${rDTO.rNo}">더보기</a>
					
					<!-- <input type="button" value="♥" name="rLike" onclick="fn_rLikePlus()"/> -->
					<%-- 	<c:set var="mId" scope="session" value="${rDTO.mId}">
						
					
					<c:choose test="${mId eq $}">
						<!-- 로그인 한 고객이 아닌 다른 고객만 좋아요를 누를 수 있다. -->
					<!-- css 엄치모양 혹은 하트?? -->
					</c:choose>
					</c:set> --%>
					</div>
					<br/><br/>
				</c:if>
			</c:forEach>
			
			
			<h5>텍스트 리뷰</h5>
			<c:forEach var="rDTO" items="${rList}">
				<!-- 사진 파일이 없을 때 -->
				<c:if test="${empty rDTO.rFilename }">
					
					<div class="text_reviews">
						<!-- mId, rNo- 히든 , rFilename, rRating, rLike, rRegdate -->
						${rDTO.rNo}<br/>
						${rDTO.mId }<br/>
						${rDTO.rContent }<br/>
						
						<img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath}/resources/reviewsStorage/${rDTO.rFilename}"><br/>
				
						
						<!-- 별점 view -->
						<c:forEach begin="1" end="${rDTO.rRating }" step="1">
		 					<i class="fas fa-star fa-2x"></i>
		 				</c:forEach>
		 				<c:forEach begin="1" end="${5-rDTO.rRating }" step="1">
		 					<i class="far fa-star fa-2x"></i> 
		 				</c:forEach><br/>
						${rDTO.rRegdate }<br/>
						<%-- 	${rDTO.rLike }<br/> --%>
						<a href="reviewsViewPage?rNo=${rDTO.rNo}">더보기</a>
												
						<!-- <input type="button" value="♥" name="rLike" onclick="fn_rLikePlus()"/> -->
					<%-- 	<c:set var="mId" scope="session" value="${rDTO.mId}">
							
						
						<c:choose test="${mId eq $}">
							<!-- 로그인 한 고객이 아닌 다른 고객만 좋아요를 누를 수 있다. -->
						<!-- css 엄치모양 혹은 하트?? -->
						</c:choose>
						</c:set> --%>
					</div>
					<br/><br/>
				</c:if>
			</c:forEach>
		</c:if>
		<input type="hidden" name="pNo" value="${rDTO.pNo }" />
		${reveiwsPageView } <!-- 페이지 -->
		<input type="button" value="뒤로 가기" onclick="history.back()" />
	</div>


<%@ include file="../template/footer.jsp" %>