<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  <style>
  *{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image: #34495e;
}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}

.body1{
	background-color:gray;
}
  </style>
  <script>
  	function Sign(){
  		alert("가입화면으로 이동!");
  	}
  	
  	function formCheck(){
		if(frm.LoginId.value ==""){
			alert("아이디를 입력하세요!");
			frm.LoginId.focus();
			return false;
		}
		if(frm.LoginPwd.value ==""){
			alert("비밀번호를 입력하세요!");
			frm.LoginPwd.focus();
			return false;
		}
		frm.submit();
	}
  	
  </script>
  </head>
  <body width="100%" height="100%" class="body1">
    <form id="frm" action="memberLoginCheck.do" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" id="LoginId" name="LoginId" class="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" id="LoginPwd" name="LoginPwd"  class="pw" placeholder="PW">
      </div>
      <button type="button" class="btn" onclick="formCheck()">
        L O G I N
      </button>
      <div class="bottomText">
        Don't you have ID? <a href="memberJoinForm.do" onclick="Sign()">sign up</a>
      </div>
    </form>
  </body>
</html>