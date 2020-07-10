<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${pageTitle }</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function fn_memberLogout() {
	swal({
		  title: "정말로그아웃하시겠습니까?",
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			location.href = 'memberLogout';
		    swal("Poof! Your imaginary file has been deleted!", {
		      icon: "success",
		    });
		  } else {
		    swal("로그아웃취소합니다");
		  }
		});
};


	/* function fn_memberLogout() {
		if(confirm('로그아웃 하시겠습니까?')){
			location.href = 'memberLogout';
		}
	} */
	
	function fn_memberleave(){
		if(confirm('정말 회원탈퇴 하시겠습니까?')){
			location.href = 'memberLeavePage';
		}
	}


</script>
</head>
<body>
	<header>
		<div class="head-banner">
		
		</div>
		<div class="top-header">
			<div class="logo-box">
				<h1>CLOTHES-SET</h1>
				<nav>
					<ul>
						<li><a href="memberLoginPage">로그인</a></li>
						<li><a href="memberInsertPage">회원가입</a></li>
						<li><a href="memberViewPage">마이페이지</a></li>
						<li><a href="">장바구니</a></li>				
					</ul>
				</nav>		
			</div>
		</div>
		
			<!-- 1. 로그인이 안 된 상태에서 처리할 작업 -->
			<c:if test="${loginDTO eq null}">
				<input type="button" value="로그인" onclick="location.href='memberLoginPage'" />
				<input type="button" value="회원가입" onclick="location.href='memberViewPage'" />
				<input type="button" value="마이페이지" onclick="location.href='memberViewPage'" />
				<input type="button" value="게시판" onclick="location.href=''" />
			</c:if>
			
			<br/><br/><br/>
			<!-- 2. 로그인이 된 상태에서 처리할 작업 -->
			<c:if test="${loginDTO ne null}">
			<h5>일반회원로그인이된상태입니다.</h5>
				${loginDTO.mName} 님 반갑습니다&nbsp;&nbsp;
				<input type="button" value="로그아웃" onclick="fn_memberLogout()" />
				<input type="button" value="회원탈퇴" onclick="fn_memberLeavePage()" />
				<input type="button" value="마이페이지" onclick="location.href='memberViewPage'" />
				<input type="button" value="게시판" onclick="location.href='boardListPage'" />
			</c:if>
			<br/><br/><br/>
			
			
			<!-- 3. 관리자가 된 상태에서 처리할 작업 -->
			<c:if test="${loginDTO.mId == 'ADMIN'}">
			<h5>관리자로그인이된상태입니다.</h5>
				${loginDTO.mName} 님 반갑습니다&nbsp;&nbsp;
				<input type="button" value="로그아웃" onclick="fn_memberLogout()" />
				<input type="button" value="회원탈퇴" onclick="fn_memberLeavePage()" />
				<input type="button" value="마이페이지" onclick="location.href='memberViewPage'" />
				<input type="button" value="게시판" onclick="location.href='" />
				<input type="button" value="회원목록" onclick="location.href='memberListPage'" />
			</c:if>
			
			
	</header>