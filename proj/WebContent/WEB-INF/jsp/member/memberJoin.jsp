<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Site</title>
        <meta charset="utf-8">
        <style>
           
       
            
            *{ margin:0; padding: 0;}
            body{background-color: #F5F6F7;}
            div{margin-top: 60px;margin-left: 38%;}
            ul,li{ list-style: none;}
           li{margin-bottom: 20px; text-align: left;}
            .box{width: 450px; height: 50px; border: 1px solid #666; padding: 10px;}
            .pbox{width: 120px; height: 50px; border: 1px solid #666; padding: 10px;}
            .necessary{font-size: small; color:red;}
            button{background:#00C850; color:white; width: 450px; border: 1px solid #666; height:50px; font-size: x-large; }

        
        </style>
        

    </head>
    <body>
        <div>
            <ul>
                <li><span >아이디 </span><br><input id="id" name="id" type = "text" placeholder = "아이디를 입력하세요" class = 'box'/></li>
                <li><span '>패스워드 </span><br><input type = "password"  name="pwd" type = "pwd" placeholder = "패스워드를 입력하세요" class = 'box'/>
                    <br><span class = 'necessary' >필수 정보입니다.</span></li>
                <li><span >생년월일</span><br><input type = "date" placeholder = "생년월일을 입력하세요." class = 'box'/>
                    <br><span class = 'necessary' >태어난 년도 4자리를 정확하게 입력하세요.</span></li>
                <li><span >전화번호</span><br> <input type = "text" class = 'pbox' /> - <input type = "text" class = 'pbox' maxlength="4" /> - <input type = "text" class = 'pbox' maxlength="4" />
                    <br><span class = 'necessary' >필수 정보입니다.</span></li>

                <li><button>가입하기</button></li>
        </ul>
        </div>
    </body>
</html>