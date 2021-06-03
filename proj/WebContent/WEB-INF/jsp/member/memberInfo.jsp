<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Oswald:300' 
rel='stylesheet' type='text/css'>
<style>
  body{background-color: #F5F6F7;}
* {
	-webkit-transition-property: all;
	-webkit-transition-duration: .2s;
  -moz-transition-timing-function: cubic-bezier(100,50,21,6);
	-moz-transition-property: all;
  -moz-transition-timing-function: cubic-bezier(100,50,21,6);
}
	ul{
		
		list-style:none;
	}
	.li1{
		margin-top:30px;
	}
.sidebarA {
      margin-top:100px;	
}

.btn{
  color:#fff;
  background:#9370db;
  padding:20px 30px;
  font-size:14px;
  text-decoration:none;
  letter-spacing:2px;
  text-transform:uppercase;
}

.btn:hover{
  border:none;
  background:rgba(0, 0, 0, 0.4);
  background:#ffa07a;
  padding:30px 30px; #000;
  color:#1b1b1b;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebarA">
	<ul class="ul1">
    <li class="li1"><a href="infoAlter.do" class="btn">회원정보 변경</a></li>
  	<li class="li1"><a href="infoUpdatePwd.do" class="btn">비밀번호 변경</a></li>
    <li class="li1"><a href="memberDelete.do" class="btn">회원 탈퇴</a>
    </li>
    </ul>
    </div>
    <div>
    
    </div>
	</body>
	</html>
