<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Oswald:300' 
rel='stylesheet' type='text/css'>
<style>
	ul{
		
		list-style:none;
	}
	.li1{
		margin-top:30px;
	}
.sidebarA {
	  left:0;
      margin-top:100px;	
      position: fixed;
}
.contentA {
 	position: relative;
 	top:130px;
 	left:300px;
	text-align:center;
	

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
<script>
	function passwordCheck(){
		if(frm.UdPwd1.value==""){
			alert("현재 비밀번호를 입력해 주세요.");
			frm.UdPwd1.focus();
			return;
		}
		if(frm.UdPwd2.value==""){
			alert("새 비밀번호를 입력해 주세요.");
			frm.UdPwd2.focus();
			return;
		}
		frm.submit();
	}
</script>
<body>
	<div class="sidebarA">
	<ul class="ul1">
    <li class="li1"><a href="#" class="btn">회원정보 변경</a></li>
  	<li class="li1"><a href="infoUpdatePwd.do"  class="btn">비밀번호 변경</a></li>
    <li class="li1"><a href="#" class="btn">회원 탈퇴</a>
    </li>
    </ul>
    </div>
    <div class="contentA">
    	<form id="frm" action="infoUpdatePwdForm.do" method="post">	
   	 	<table  width="500px" height="300px">
   	 		<tr>
   	 			<th colspan="2"> ※※※   비밀번호 변경   ※※※ </th>	
   	 		</tr>
   	 		<tr>
   	 			<th> 아이디 </th>	 <td>${id }</td>
   	 		</tr>
   	 		  <tr>
   	 			<th>현재 비밀번호  :</th>	<td><input type="password" placeholder="현재 비밀번호 입력" id="UdPwd1" name="UdPwd1"></td>
   	 		</tr>
   	 		
   	 		<tr>
   	 			<th>변경할 비밀번호 :</th>	<td><input type="password" placeholder="변경할 비밀번호 입력" id="UdPwd2" name="UdPwd2"></td>
   	 		</tr>
   	 		<tr>
   	 			<td colspan="2" rowspan="2"><button type="button" onclick="passwordCheck();">변경하기</button></td>
   	 		</tr>
   	 	</table>
   	 	</form>	
    </div>
	</body>
	</html>
