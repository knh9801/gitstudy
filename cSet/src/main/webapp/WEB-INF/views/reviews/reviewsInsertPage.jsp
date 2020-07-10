<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../template/header.jsp">
	<jsp:param value="나의 주문 내역" name="myPage_productList"/>
</jsp:include>

<script type="text/javascript">
	function fn_reviewInsert(f) {
		alert('리뷰 작성이 완료되었습니다');
		f.action = 'reviewsInsertPage';
		f.submit();
	}
</script>

	 <!-- 고객이 삽입하는 정보 - 내용, 사진, 별점 -->
	<!-- 로그인한 고객만 리뷰 작성 가능(구현을 어떻게 하면 좋을까) -->
	
	<!-- 로그인하지 않은 고객에게는 alert('로그인 후 이용가능합니다') -->
	 <div class="wrap">
	 <form enctype="multipart/form-data" method="POST">
	 	리뷰 작성<br/>
	 	<textarea name="rContent" cols="50" rows="10" placeholder="최소 20자 이상 작성해 주세요" autofocus></textarea><br/>
		 <br/>
		첨부파일# <input type="file" name="files"><br/>
 	<select name="rRating" >
				<option value="5">★★★★★             아주 좋아요</option>
				<option value="4">★★★★☆   	맘에 들어요</option>
				<option value="3">★★★☆☆       		보통이에요</option>
				<option value="2">★★☆☆☆         	그냥 그래요</option>
				<option value="1">★☆☆☆☆         	별로에요</option>
		 	</select> <br/><br/> 
		 	
		임의 작성입니다.<br/>
	 	PNO - ${pNo }<br/> <!-- 나중에 hidden 처리해야함 -->
 		ID<input type="text" name="${loginDTO.mId }" /><br/> <!-- insert : 로그인 한 아이디 == 리뷰 작성 아이디 -->
		<input type="button" value="리뷰 작성 완료 " onclick="fn_reviewInsert(this.form)"/>	
	</form>
	</div>
	
<%@ include file="../template/footer.jsp" %>