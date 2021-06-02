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
<style>
.necessary{font-size: small; color:red;}
 #td1{
 	text-align:left;
 }
</style>
<script>
	function infoAlterChk(){
		if(frm.email.value=="${rvo.memberEmail}" && frm.tel.value=="${rvo.memberTel}"){
			alert("변경할 사항을 수정해주세요!");
		}else{
			
		let Check =confirm("정말로 수정 하시겠습니까?");
		if(Check==true){
			frm.submit();
		}else{
			alert("취소되었습니다.");
		}
		}
	}
</script>
<body>

	<div class="sidebarA">
	<ul class="ul1">
    <li class="li1"><a href="infoAlter.do" class="btn">회원정보 변경</a></li>
  	<li class="li1"><a href="infoUpdatePwd.do"  class="btn">비밀번호 변경</a></li>
    <li class="li1"><a href="memberDelete.do" class="btn">회원 탈퇴</a>
    </li>
    </ul>
    </div>
    <div class="contentA">
    	<form id="frm" action="infoAlterForm.do" method="post">	
   	 	<table  width="500px" height="300px">
   	 		<tr>
   	 			<th colspan="3"> ※※※   회원 정보 변경   ※※※ </th>	
   	 		</tr>
   	 		 <tr>
   	 			<th > 이름 </th>	<td id="td1">${rvo.memberName}</td><td ><span class = 'necessary' >※ 이름은 변경이 불가능합니다.</span></td>
   	 		</tr>
   	 		  <tr>
   	 			<th> 이메일 </th>	<td  id="td1"><input type="text"  id="email" name="email" value="${rvo.memberEmail }"></td>
   	 		</tr>
   	 		<tr>
   	 			<th> 전화번호 </th>	<td  id="td1"><input type="text"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="tel" name="tel" value="${rvo.memberTel }"></td> <td ><span class = 'necessary' >※ 숫자만 입력이 가능합니다.</span></td>
   	 		</tr>
   	 		
   	 		<tr>
   	 			<td colspan="2" rowspan="2"><button type="button" onclick="infoAlterChk();">정보 수정</button></td>
   	 		</tr>
   	 	</table>
   	 	</form>	
    </div>
	</body>
	</html>