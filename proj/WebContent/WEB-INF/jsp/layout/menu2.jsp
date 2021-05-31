<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
    	<c:when test="${!empty id }">
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