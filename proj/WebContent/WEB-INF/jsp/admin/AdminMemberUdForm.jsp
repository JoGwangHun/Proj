<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.myButton2 {
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color:#7892c2;
	border-radius:42px;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:8px;
	padding:7px 8px;
	text-decoration:none;
	text-shadow:0px 1px 0px #283966;
}
.myButton2:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color:#476e9e;
}
.myButton2:active {
	position:relative;
	top:1px;
}
.necessary{font-size: 5px; color:red;}
.necessary2{font-size: small; color:red;}
.myButton {
	box-shadow:inset -12px 0px 3px 0px #fbafe3;
	background:linear-gradient(to bottom, #ff5bb0 5%, #ef027d 100%);
	background-color:#ff5bb0;
	border-radius:15px;
	border:1px solid #ee1eb5;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:8px;
	font-weight:bold;
	font-style:italic;
	padding:7px 8px;
	text-decoration:none;
	text-shadow:-3px 5px 0px #c70067;
}
.myButton:hover {
	color:##ee1eb5;
	background:linear-gradient(to bottom, #ef027d 5%, #ff5bb0 100%);
	background-color:#ef027d;
}
.myButton:active {
	position:relative;
	top:1px;
}
#trAA{	
	color:#BF360C;
	background-image: repeating-linear-gradient(135deg, #ccc, #ccc 10px, #eee 10px, #eee 20px);
}
#thB{
	color:#AD1457;
}
#trA{
	background-color:#E1BEE7;
}
#tdA{
	background-color:gray;
	
}
#thA{
	background-color:#B3E5FC;
	text-align:center;
}
#thC{
	text-align:center;
	background-color:#B3E5FC;
}
#tdB{
	width:60px;
	
}
input{
	border:0;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;

}
#trAAA{
	text-align:center;
}
#tdA1{
	width:100px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Custom fonts for this template-->

    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
  	  <script>
  	  		function AdminMemberUpdate2(id2){
  	  			UdFrm.UdId.value=id2;
  	  			if(UdFrm.rvoEmail.value=="${rvo.memberEmail}" && UdFrm.rvoTel.value=="${rvo.memberTel}" && UdFrm.rvoPwd.value=="${rvo.memberPwd}" && UdFrm.rvoName.value=="${rvo.memberName}"){
  				alert("변경할 사항을 하나 이상 수정해주세요!");
  				}else{
  	  			
  	  			let UdChk =confirm("♣ "+id2+" ♣"+"님 계정을 수정 하시겠습니까?");
  	  				if(UdChk==true){
            		UdFrm.submit();
    				}else{
    				alert("취소되었습니다.");
    		}
  				}
  	  		}
  	 </script>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
 <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminMember.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"> Admin <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="adminMember.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>AdminMain</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Member Management
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="adminMemberList.do" >
                    <i class="fas fa-fw fa-cog"></i>
                    <span>전체 회원 관리</span>
                </a>              
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" >
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
               Sales Management
            </div>


            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>상품 관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>판매 테이블</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        <!-- End of Sidebar -->
        
        </ul>    
        
        
        
        	
		<!-- 	<input type="hidden" id="UdId" name="UdId">
			<input type="hidden" id="UdPwd" name="UdPwd">
			<input type="hidden" id="UdName" name="UdName">
			<input type="hidden" id="UdEmail" name="UdEmail">
			<input type="hidden" id="UdTel" name="UdTel"> -->
			
        
         <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800">Admin</h1>  -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Member List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form id="UdFrm" action="AdminMemberUdForm.do" method="post">
                            <input type="hidden" id="UdId" name="UdId">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr id="trA">
                                            <th id="thB">ID<span class="necessary">( 변경불가 ! )</span></th>
                                            <th id="thB">PASSWORD</th>
                                            <th>NAME</th>
                                            <th>E-MAIL</th>
                                            <th>TEL</th>
                                            <th id="thC">수정</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    </tfoot>
                                    <tbody>
                                        <tr id="trAAA">
                                            <td id="tdA1">${rvo.memberId }</td>
                                            <td><input style="width:200px" type="text" value="${rvo.memberPwd }" id="rvoPwd" name="rvoPwd"></td>
                                            <td><input style="width:100px" type="text" value="${rvo.memberName }" id="rvoName" name="rvoName"></td>
                                            <td><input style="width:230px" type="text" value="${rvo.memberEmail }" id="rvoEmail" name="rvoEmail"></td>
                                            <td><input style="width:200px" type="text" value="${rvo.memberTel }" id="rvoTel" name="rvoTel"></td>
                                            <td id="tdB"><a class="myButton2" onclick="AdminMemberUpdate2('${rvo.memberId}')">수정</a></td>
                                        </tr>
 
                                    </tbody>
                                     
                                </table>
                                </form>
                                 <br><span class = 'necessary2' >수정할 항목위에 마우스클릭 후 수정이 가능합니다.</span>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
     
            
</body>
</html>