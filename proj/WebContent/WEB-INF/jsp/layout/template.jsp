<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- /WEB-INF/jsp/layout/template.jsp -->
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/product/">
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/product/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/product/product.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body>
	<tiles:insertAttribute name="menu">
	</tiles:insertAttribute>

<%-- 	<tiles:insertAttribute name="head">
	</tiles:insertAttribute> --%>

	<tiles:insertAttribute name="body">
	</tiles:insertAttribute>

	<tiles:insertAttribute name="foot">
	</tiles:insertAttribute>
</body>
</html>