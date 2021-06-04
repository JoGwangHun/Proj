<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn_self {
	display: inline-block !important;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .35rem;
}

.bkcolor {
	color: #8e8e8e;
	transition: color .15s ease-in-out;
	background-color: transparent;
	text-decoration: none;
}

.bkcolor:hover {
	color: #fff;
	text-decoration: none;
}
</style>

	<!--  <div class="menuClass">
=======
<header class="site-header sticky-top py-1">
  <nav class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2" href="#" aria-label="Product">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
    </a>
    <a class="py-2 d-none d-md-inline-block" href="index.do">홈페이지</a>
    <a class="py-2 d-none d-md-inline-block" href="thingListPaging.do">상품리스트</a>
<<<<<<< HEAD
    <a class="py-2 d-none d-md-inline-block" href="cartList.do">장바구니
    <span class="badge bg-light text-dark">${cartCnt }</span></a>
    
=======
    <a class="py-2 d-none d-md-inline-block" href="cartList.do">
    	장바구니
    	<span class="badge bg-light text-dark">${cartCnt }</span>
    </a>
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
    <c:choose>
<<<<<<< HEAD
    	<c:when test="${id eq 'admin'}">
    		
=======
    	<c:when test="${!empty id || id eq 'admin'}">
<<<<<<< HEAD
=======
<<<<<<< HEAD
    		<nav id="nav1">	
    			<a id="a1" href="#">${id }님 </a>
    			<a id="a1" href="#">회원 관리</a>
    			<a id="a1" href="memberInfo.do">회원 정보</a>
    			<a id="a1" href="memberLogOut.do">LogOut</a>
=======
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
    		<nav id="nav3">	
    			<a id="a3" href="#">${id }님 </a>
    			<a id="a3" href="adminMember.do">관리 페이지</a>
    			<a id="a3" href="serviceCenter.do">고객 센터</a>
    			<a id="a3"  href="memberLogOut.do">LogOut</a>
<<<<<<< HEAD
=======
<<<<<<< HEAD
    			<!--  <a id="a1"  href="memberLogOut.do">LogOut</a>-->
=======
    			<!--  <a id="a1"  href="memberLogOut.do">LogOut</a>-->
<<<<<<< HEAD
=======
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
    			<div class="animation start-home"></div>
    		</nav>
    	</c:when>
    	<c:when test="${!empty id}">
    	<nav id="nav1">	
    			<a id="a1" href="#">${id }님 </a>
    			<a id="a1" href="memberInfo.do">회원 정보</a>
    			<a id="a1"  href="memberLogOut.do">LogOut</a>
    			<div class="animation start-home"></div>
    		</nav>
    	</c:when>
    	<c:otherwise>
    		<nav id="nav2">	
    			<a id="a2" href="memberLogin.do">로그인 </a>
    			<a id="a2"  href="memberJoinForm.do">회원가입</a>
    			<div class="animation start-home"></div>
    		</nav>
 	   </c:otherwise>
    </c:choose>

  </nav>
</header>

</div>