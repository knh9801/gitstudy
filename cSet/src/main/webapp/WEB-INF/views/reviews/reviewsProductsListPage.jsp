<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="productListPage" name="reviewsProductList"/>
</jsp:include>
	 <div class="wrap">
	<!-- productViewPage에서  pNo를 받아와야 한다. -->
	<!-- 여러 상품이 있는 상품 리스트 페이지라고 가정한다 -->
	<!-- 상품별 리스트 -->
	
		<c:if test="${not empty pList }" >
			<c:forEach var="rDTO" items="${pList}">
				<!-- mId, rNo- 히든 , rFilename, rRating, rLike, rRegdate -->
				<a href="reviewsListPage?pNo=${rDTO.pNo}">${rDTO.pNo}의 리뷰 리스트</a><br/>
				
				<!-- 리뷰 작성 페이지로 이동 -->
				<a href="reviewsInsert?pNo=${rDTO.pNo}">${rDTO.pNo}의 리뷰 작성하러 가기</a><br/>
	
				<br/><br/>
				
			</c:forEach>
		</c:if>
		
		<input type="button" value="뒤로 가기" onclick="history.back()" />
	</div>

<%@ include file="../template/footer.jsp" %>