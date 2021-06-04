<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
//
HEADER
	#fh5co-header-section {
	margin-top: -20px;
}

#fh5co-header {
	position: relative;
	margin-bottom: 0;
	z-index: 9999999;
}

.fh5co-cover, .fh5co-hero {
	position: relative;
	height: 800px; //
	font-weight: 300;
	@media
	screen
	and
	(max-width
	:$screen-sm)
{
	height
	:
	 
	700px
	;
	
	
}

&
.fh5co-hero-2 {
	height: 600px; . fh5co-overlay { position : absolute !important;
	width: 100%;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: 1;
	background: rgba($ brand-black, .7);
}

}
}
.fh5co-overlay {
	position: absolute !important;
	width: 100%;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: 1;
	background: rgba($ brand-black, .3);
}

.fh5co-cover {
	background-size: cover;
	position: relative;
	@media
	screen
	and
	(max-width:
	$screen-sm)
{
	heifght
	:
	 
	inherit
	;
	
		
	padding
	:
	 
	3em
	 
	0
	;
	
	
}

.btn {
	padding: 1em 2em;
	opacity: .9;
	@
	include
	border-radius(30px);
}

&
.fh5co-cover_2 {
	height: 600px;
	@media
	screen
	and
	(max-width:
	$screen-sm)
{
	heifght
	:
	 
	inherit
	;
	
			
	padding
	:
	 
	3em
	 
	0
	;
	
		
}

}
.desc {
	top: 50%;
	position: absolute;
	width: 100%;
	margin-top: -100px;
	z-index: 2;
	color: $brand-white;
	@media
	screen
	and
	(max-width:
	$screen-sm)
{
	padding-left
	:
	 
	15px
	;
	
			
	padding-right
	:
	 
	15px
	;
	
		
}
/*
h2 {
	color: $brand-white; //
	text-transform: uppercase;
	font-size: 55px;
	font-weight: 300;
	margin-bottom: 10px;
	line-height: 60px;
	letter-spacing: 1px;
	@media
	screen
	and
	(max-width:
	$screen-sm)
{
	font-size
	:
	 
	40px
	;
	
				
	line-height
	:
	 
	50px
	;
	
			
}

}
span {
	display: block;
	margin-bottom: 25px; //
	font-weight: 300;
	font-size: 24px;
	letter-spacing: 1px;
	color: rgba($ brand-white, .8);
	i
	{
	color
	:
	$
	brand-secondary;
}

a {
	color: rgba($ brand-white, .8); &:
	hover ,&: focus{ 
					color: #fff !important; // &. btn { // border : 2px solid #fff
	!important; //
	background: transparent !important;
	//
}

}*/
&
.fh5co-site-name {
	padding-bottom: 2px;
	border-bottom: 1px solid rgba($ brand-white, .7);
}
.blankA {
	width: 100%;
	height: 300px;
}
</style>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Beam &mdash; 100% Free Fully Responsive HTML5 Template by
	FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/exam/css/animate.css">
<!-- Icomoon Icon Fonts
	<link rel="stylesheet" href="${pageContext.request.contextPath }/exam/css/icomoon.css">-->
<!-- Bootstrap  
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/exam/css/bootstrap.css">-->
<!-- Superfish -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/exam/css/superfish.css">
<!-- Flexslider  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/exam/css/flexslider.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/exam/css/style.css">


<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath }/exam/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>Z`
	<![endif]-->

</head>
<div id="fh5co-header">
	<header id="fh5co-header-section">

		<div class="container">
			<div class="nav-header">
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
				<h1 id="fh5co-logo">
					<a href="index.html"><i class="icon-home2"></i>DANAWAA</a>
				</h1>
				<!-- START #fh5co-menu-wrap -->
				<nav id="fh5co-menu-wrap" role="navigation">
					<ul class="sf-menu" id="fh5co-primary-menu">
						<li><a class="active" href="index.do">HOME</a></li>
						<li><a href="thingList.do" class="fh5co-sub-ddown">PRODUCT</a>
							<ul class="fh5co-sub-menu">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>

							</ul></li>
						<li><a href="cartList.do">BASKET</a></li>
						<li><a href="contact.html">SERVICE CENTER</a></li>
						

						
					</ul>
				</nav>
			</div>
		</div>
	</header>
			<div class="blankA"></div>
		<div class="menuClass">
    <c:choose>
    	<c:when test="${id eq 'admin'}">
    		
    		<nav id="nav3">	
    			<a id="a3" href="#">${id }님 </a>
    			<a id="a3" href="adminMember.do">관리 페이지</a>
    			<a id="a3" href="serviceCenter.do">고객 센터</a>
    			<a id="a3"  href="memberLogOut.do">LogOut</a>
    			<!--  <a id="a1"  href="memberLogOut.do">LogOut</a>-->
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
</div>




