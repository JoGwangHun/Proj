<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
strong {
	text-transform: uppercase;
}

.price {
	color: blue;
	font-size: 20px;
	line-height: 25px;
}

img {
	margin-top: 25px;
}
.col-md-6 {
	height: 350px;
	width: 930px;	
}
.p-4 {
	height: 300px;
}
</style>

	<!-- <div class="col-md-6">
		<div
			class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<strong class="d-inline-block mb-2 text-primary">World</strong>
				<h3 class="mb-0">Featured post</h3>
				<div class="mb-1 text-muted">Nov 12</div>
				<p class="card-text mb-auto">This is a wider card with
					supporting text below as a natural lead-in to additional content.</p>
				<a href="#" class="stretched-link">Continue reading</a>
			</div>
			<div class="col-auto d-none d-lg-block">
				<svg class="bd-placeholder-img" width="250" height="250"
					xmlns="upload/" role="img" aria-label="Placeholder: Thumbnail"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<title>Placeholder</title><rect width="100%" height="100%"
						fill="#55595c" />
					<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

			</div>
		</div>
	</div> -->
<div class="row mb-2">
	<c:forEach items="${list }" var="list">
		<div class="col-md-6">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-success">${list.thingKind }</strong>
					<h3 class="mb-0" style="font-size: 15pt;">
						<b>${list.thingName }</b>
					</h3>
					<p class="mb-auto" style="font-size: 11pt;">${list.thingDesc }</p>
					<span class="price"><strong><fmt:formatNumber
								type="currency" value="${list.thingPrice }"></fmt:formatNumber></strong>
					</span>
					<form action="thingSelect.do" >
						<input type="hidden" name="itemId" value="${list.thingId }" />
						<button type="submit" class="btn btn-outline-info">자세히보기</button>
					</form>
				</div>
				<div class="col-auto d-none d-lg-block">
					<img class="bd-placeholder-img" width="250" height="250"
						src="upload/${list.thingImage }" role="img"
						aria-label="Placeholder: Thumbnail"
						preserveAspectRatio="xMidYMid slice" focusable="false">
				</div>
			</div>
		</div>
	</c:forEach>
	<div style="text-align: right;">
		<button class="btn btn-outline-dark" type="button" onclick="location.href='thingForm.do'">등록</button>
	</div>
</div>
