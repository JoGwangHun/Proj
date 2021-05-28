<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	strong {
		text-transform: uppercase;
	}
</style>
<div class="row mb-2">
	<div class="col-md-6">
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
	</div>
	<c:forEach items="${list }" var="list">
		<div class="col-md-6">
			<div
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-success">${list.thingKind }</strong>
					<h3 class="mb-0">${list.thingName }</h3>
					<div class="mb-1 text-muted">${list.thingEnDate }</div>
					<p class="mb-auto">${list.thingDesc }</p>
					<a href="#" class="stretched-link">Continue reading</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<img class="bd-placeholder-img" width="250" height="250"
						src="upload/${list.thingImage }" role="img"
						aria-label="Placeholder: Thumbnail"
						preserveAspectRatio="xMidYMid slice" focusable="false">
					<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
					</svg>
				</div>
			</div>
		</div>
	</c:forEach>
</div>