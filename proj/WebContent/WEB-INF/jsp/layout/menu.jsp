<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <c:choose>
    	<c:when test="${id eq 'admin'}">
    		
    		<nav id="nav3">	
    			<a id="a3" href="#">${id }님 </a>
    			<a id="a3" href="adminMember.do">관리 페이지</a>
    			<a id="a3" href="serviceCenter.do">고객 센터</a>
    			<a id="a3"  href="memberLogOut.do">LogOut</a>
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

</div>
-->