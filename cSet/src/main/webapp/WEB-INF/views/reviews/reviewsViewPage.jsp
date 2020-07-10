<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="단일 리뷰 보기" name="Review"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="resources/assets/style/reviewsCss.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<script type="text/javascript">
	function fn_reviewsList(f) {
		f.action = 'reviewsListPage';
		f.submit();
	}

	function fn_reviewsDelete(f) {
		if(confirm('리뷰를 삭제할까요?')) {
			f.action = 'reviewsDeletePage';
			f.submit();
		}
	}
</script>
	<div class="wrap" >
	
		<form method="POST">
			ID  ${rDTO.mId }<br/>
			${rDTO.rContent }<br/>
			<img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath}/resources/reviewsStorage/${rDTO.rFilename}" /><br/>
 			<!-- CSS-뷰에서는 이미지 더 크게 - width: 200; height: 200; -->
 			
 			<!-- 별점 -->
 			<c:forEach begin="1" end="${rDTO.rRating }" step="1">
 				<i class="fas fa-star fa-2x"></i>
 			</c:forEach>
 			<c:forEach begin="1" end="${5-rDTO.rRating }" step="1">
 				<i class="far fa-star fa-2x"></i> 
 			</c:forEach><br/>
			
			
			${rDTO.rRegdate }<br/> <!--  작성시간은 하단에 조그맣게 -->
			<input type="hidden" name="rNo" value="${rDTO.rNo }"/>
			<input type="hidden" name="pNo" value="${rDTO.pNo }"/>
			<input type="button" value="뒤로 가기" onclick="history.back()" />
			
			<!-- 로그인한 아이디와 동일하면 생성 - 수정, 삭제  -->
			<c:if test="${loginDTO.mId eq rDTO.mId }">
			<input type="button" value="수정" onclick="location.href='goReviewsUpdatePage?rNo=${rDTO.rNo}'"><!-- 이 버튼은 수정페이지로 이동하는 버튼 -->
			<input type="button" value="삭제" onclick="fn_reviewsDelete(this.form)" />
			</c:if>
			
			<input type="button" value="전체 목록" onclick="fn_reviewsList(this.form)" /> 
		</form>
	</div>	

<%@ include file="../template/footer.jsp" %>