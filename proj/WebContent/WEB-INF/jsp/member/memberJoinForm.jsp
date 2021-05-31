<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <head>
        <title>회원가입 </title>
        <meta charset="utf-8">
        <style> 
            body{background-color: #F5F6F7;}
            div.divClass{margin-top: 60px;margin-left: 38%;}
            ul,li{ list-style: none;}
           li{margin-bottom: 20px; text-align: left;}
            .box{width: 450px; height: 50px; border: 1px solid #666; padding: 10px;}
            .pbox{width: 160px; height: 50px; border: 1px solid #666; padding: 10px;}
            .ebox{width: 450px; height: 50px; border: 1px solid #666; padding: 10px;}
            .necessary{font-size: small; color:red;}
            .JoinButton{background:gray; color:white; width: 450px; border: 1px solid #666; height:50px; font-size: x-large; }
			.CheckButton{background:gray; color:white; width: 140x; border: 1px solid #666; height:50px; font-style: italic; font-weight:bold;}
        
        </style>
  <script>
  function formCheck(){
		if(!frm.id.value){
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
	/*	if(frm.idDuplication.value !="idCheck"){
			alert("아아디 중복체크를 하세요");
			return false;
		}*/
		if(!frm.pwd.value){
			alert("비밀번호를 입력하세요");
			frm.pwd.focus();
			return false;
		}
		
		if(!frm.name.value){
			alert("이름을 입력하세요");
			frm.name.focus();
			return false;
		}
		
		if(!frm.email.value){
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		}
		
		if(!frm.tel.value){
			alert("전화번호를 입력하세요");
			frm.tel.focus();
			return false;
		}
		
		frm.submit();
	}
  
  

	$(function(){
		$('#idCheck').click(function(){
				if($('#id').val()==""){
					alert('아이디를 입력하세요');
					$('#id').focus();
					return;
				}
					
			$.ajax({
				url:'ajaxMemberIdCheck',
				data:{id:$('#id').val()},
				type: 'post',
				success: function(data){
					console.log(data);
					if(data > 0 ){
						alert('아이디가 존재합니다. 다른 아이디 입력!');
						$('#id').val("");
						$('#id').focus();
						
					}else{
						alert('사용 가능한 아이디 입니다.!');
						$('#idCheck').val('checked');
						$('#pwd').focus();
					}
				},
				error:function(err){
					console.log(err);
				}
			});
		});
	});

	tel.onkeyup=function(){
		
		alert("숫자만 입력가능");
	}
	
	
  </script>

        

    </head>
    <body>
        <div class="divClass">
        	<form id="frm" name="frm" action="memberJoin.do" method="post" >
            <ul>
                <li><span >아이디 </span><br><input id="id" name="id" type = "text" placeholder = "아이디를 입력하세요" class = 'box'/>
                	<input class="CheckButton" type="button" id="idCheck" value="Check" >
                	<input type="hidden" name="unCheck" value="unCheck">
                </li>
                <li><span >패스워드 </span><br><input type = "password"  name="pwd" id="pwd" placeholder = "패스워드를 입력하세요" class = 'box'/>
                    <br><span class = 'necessary' >필수 정보입니다.</span></li>
                <li><span >이름</span><br><input type = "text" placeholder = "이름을 입력하세요." id="name" name="name" class = 'box'/><br>
                    <br><span class = 'necessary' >이메일</span><br> 
                     <input type = "text" class = 'ebox' id="email" name="email"/></li>
                <li><span >전화번호</span><br> <input type = "text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class = 'pbox' id="tel" name="tel">
                    <br><span class = 'necessary' >숫자만 입력가능합니다.</span></li>

                <li><button class="JoinButton" type="button" onclick="formCheck()">JOIN</button></li>             
        </ul>
        </form>
        </div>
    </body>
</html>