<<<<<<< HEAD

	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- head script -->

	
	
	
<!-- /WEB-INF/jsp/layout/template.jsp -->
<title><tiles:getAsString name="title"></tiles:getAsString></title>

<!-- ADMIN SCRIPT  -->
    <script src="${pageContext.request.contextPath }/admin/vendor/jquery/jquery.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/admin/js/demo/datatables-demo.js"></script>
	<script src="${pageContext.request.contextPath }/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/admin/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="${pageContext.request.contextPath }/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script	src="${pageContext.request.contextPath }/admin/vendor/chart.js/Chart.min.js"></script>
	<script	src="${pageContext.request.contextPath }/admin/js/demo/chart-area-demo.js"></script>
	<script	src="${pageContext.request.contextPath }/admin/js/demo/chart-pie-demo.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="${pageContext.request.contextPath }/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- END ADMIN SCRIPT  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/Login/screen.css"  media="screen" title="no title" >
	<link rel="stylesheet" href="${pageContext.request.contextPath }/product/dist/css/bootstrap.min.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/product/">
<!-- Bootstrap core CSS -->
	<link href="${pageContext.request.contextPath }/Login/Login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/product/product.css" rel="stylesheet">
<!-- Custom fonts for this template-->
	<link href="${pageContext.request.contextPath }/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
.compare_img {
	width: 270px;
	height: 260px;
	padding-left: 1.5em
}
.little-mar {
	margin-top: 1em;
}
.commentBtn {
	font-size: 9pt;
	width: 50px;
	height: 30px;
	margin-bottom: 2em;
}

</style>
</head>
<body>

<tiles:insertAttribute name="head">
	</tiles:insertAttribute>
	<tiles:insertAttribute name="menu">
	</tiles:insertAttribute>
	
	<%-- <tiles:insertAttribute name="menu2">
	</tiles:insertAttribute>--%>

		

	<tiles:insertAttribute name="body">
	</tiles:insertAttribute>

	<tiles:insertAttribute name="foot">
	</tiles:insertAttribute>
</body>
</html>