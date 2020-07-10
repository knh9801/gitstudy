<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="리뷰 수정" name="myReviewUpdate"/>
</jsp:include>
<script type="text/javascript">
	function fn_reviewsUpdate(f) {
		f.action = 'reviewsUpdatePage';
		f.submit();
	}
	
</script>
	<div class="wrap" >
		
		<form method="POST">
		
			<!-- 수정할 내용 -->
			<input type="text" name="rContent" value="${rDTO.rContent }" /><br/>
			<input type="file" name="rFilename" value="${rDTO.rFilename }" /><br/>
			<select name="rRating" >
				<option value="5">★★★★★             아주 좋아요</option>
				<option value="4">★★★★☆   	맘에 들어요</option>
				<option value="3">★★★☆☆       		보통이에요</option>
				<option value="2">★★☆☆☆         	그냥 그래요</option>
				<option value="1">★☆☆☆☆         	별로에요</option>
		 	</select>
			
			<br/><br/>
			
			<input type="hidden" name="rNo" value="${rDTO.rNo }"/>
			<input type="hidden" name="pNo" value="${rDTO.pNo }"/>
			<input type="hidden" name="mId" value="${rDTO.mId }"/><br/><br/>
			<input type="button" value="수정하기" onclick="fn_reviewsUpdate(this.form)" />
			<input type="button" value="뒤로 가기" onclick="history.back()" />
 		</form>
	</div>

<%@ include file="../template/footer.jsp" %>