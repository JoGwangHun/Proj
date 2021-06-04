<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript">
	//차트 시작
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Day');
		data.addColumn('number', 'Price');

		let price1 = $("#price1").val().replace(/,/g,"");
		let price2 = $("#price2").val().replace(/,/g,"");
		let price3 = $("#price3").val().replace(/,/g,"");
		let price4 = $("#price4").val().replace(/,/g,"");

		price1 = parseInt(price1);
		price2 = parseInt(price2);
		price3 = parseInt(price3);
		price4 = parseInt(price4);

		data.addRows([ [ '05.04', price1, ], [ '05.11', price2, ],
				[ '05.18', price3, ], [ '05.25', price4, ], ]);

		var options = {
			width : 400,
			height : 70,
			axes : {
				x : {
					0 : { 
						side : 'bottom'
					}
				}
			}
		};

		var chart = new google.charts.Line(document
				.getElementById('line_top_x'));

		chart.draw(data, google.charts.Line.convertOptions(options));
	}
	// 차트 끝 

	// 수정, 삭제 버튼 함수 시작
	function btnFnc(str) {
		let title = $("#title").val();
		let price = $("#price").val().replace(/,/g,"");
		let desc = $("#desc").val();
		let dayPrice1 = $("#dayPrice1").val().replace(/,/g,"");
		let dayPrice2 = $("#dayPrice2").val().replace(/,/g,"");
		let dayPrice3 = $("#dayPrice3").val().replace(/,/g,"");
		let dayPrice4 = $("#dayPrice4").val().replace(/,/g,"");
		let kind = $("#kind").val();

		var form = $('#picture')[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#thingImage")[0].files[0]);
		formData.append("fileObj2", $("#detailImage")[0].files[0]);

		let thingImage = $("#preview-image").attr("src").substring(7);
		let detailImage = $("#preview-image2").attr("src").substring(7);

		if (typeof $("#thingImage").get(0).files[0] != "undefined") {
			thingImage = $("#thingImage").get(0).files[0].name;
		}
		if (typeof $("#detailImage").get(0).files[0] != "undefined") {
			detailImage = $("#detailImage").get(0).files[0].name;
		}

		if (str == "del") {
			delFrm.submit();
			return false;
		}

		if (str == "update") {
			$.ajax({
				url : '/proj/fileUpload',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					alert("수정 성공");
				},
				error : function(error) {
					console.log(err)
					alert("수정 실패")
				}

			});

			updateFrm.chTitle.value = title;
			updateFrm.chPrice.value = price;
			updateFrm.chDesc.value = desc;
			updateFrm.chDayPrice1.value = dayPrice1;
			updateFrm.chDayPrice2.value = dayPrice2;
			updateFrm.chDayPrice3.value = dayPrice3;
			updateFrm.chDayPrice4.value = dayPrice4;
			updateFrm.chImage.value = thingImage;
			updateFrm.chDetailImage.value = detailImage;
			updateFrm.chKind.value = kind;

			updateFrm.submit();
			return false;
		}
<<<<<<< HEAD
	}
	// 수정, 삭제 버튼 함수 끝

	// 네이버api 불러오는곳
	function loadSearchAPI(name) {
		$.ajax({
					url : "${pageContext.request.contextPath}/naverSearch",
					data : {
						search : name
					},
					dataType : "json",
					success : function(result) {
						console.log(result);
						console.log(result.items[0].image);
						let content;

						content += "<tr>"
						for (let i = 1; i <= 4; i++) {
							content += "<td>"
							content += "<a href='" + result.items[i].link + "' target='_blank'>";
							content += "<img class='compare_img' src=" + result.items[i].image + "/>";
							content += "</a></td>";
						}
						content += "</tr><tr>";
						for (let i = 1; i <= 4; i++) {
							content += "<th>" + result.items[i].title.replace(/<b>/gi, "") + "</th>";
						}
						content += "<tr/><tr>"
						for (let i = 1; i <= 4; i++) {
							content += "<th>" + addComma(result.items[i].lprice) + "원</th>";
						}
						content += "<tr/><tr>"
						for (let i = 1; i <= 4; i++) {
							content += "<th>" + result.items[i].mallName + "</th>";
						}
						content += "</tr>"

						$("#compareTbl").append(content);
					},
					error : function(err) {
						console.log(err);
					}
				});
		 function addComma(value){
		        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        return value; 
		}
	}
	// 네이버API 끝
	
	// 댓글 함수
	function warnEmpty() {
		alert("글을 입력하세요!");
	}
	function dateToString(date) {
		const dateString = date.toISOString();
		const dateToString = dateString.substring(0, 10) + " " + dateString.substring(11, 19);
		return dateToString;
	}
	function submitComment() {
		const newcommentEL = document.getElementById("new-comment");
		const newcomment = newcommentEL.value.trim();

		if (newcomment) {
			const dateEL = document.createElement("div");
			dateEL.classList.add("comment-date");
			const dateString = dateToString(new Date());
			dateEL.innerText = dateString;

			const contentEL = document.createElement("div");
			contentEL.classList.add("comment-content");
			contentEL.innerText = newcomment;

			const commentEL = document.createElement("div");
			commentEL.classList.add("comment-row");
			commentEL.appendChild(dateEL);
			commentEL.appendChild(contentEL);

			document.getElementById("comments").appendChild(commentEL);
			newcommentEL.value = "";

			const countEL = document.getElementById("comments-count");
			const count = countEL.innerText;
			countEL.innerText = parseInt(count) + 1;
		} else
			warnEmpty();
	}
	// 댓글함수 끝
	
	// 댓글 db Insert
	function commentInsert(user_id, thing_id) {
		const commentEL = document.getElementById("new_comment");
		const comments = commentEL.value.trim();
		
		if (comments) {
			$.ajax({
				url: "${pageContext.request.contextPath}/commentInsert.do",
				type: "post",
				data: {
					user_id: user_id,
					comment: comments,
					thing_id: thing_id,
				},
				success: function(result) {
					picture.new_comment.value = "";	
				},
				error: function(err) {
					console.log(err);
				}
			});
		} else warnEmpty();
	}
</script>

<title>상품선택</title>
<style>
li {
	float: left;
}

img {
	max-width: 875px;
}
</style>

=======
	</style>
<style>
 .headDiv1{
		width:1920px;
		height:50px;
		
	}
</style>
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
</head>


<div class="headDiv1">

</div>
<body id="page-top">
	<form id="updateFrm" action="thingUpdate.do" method="post">
		<input type="hidden" name="chId" value="${vo.thingId }" />
		<input type="hidden" name="chTitle" />
		<input type="hidden" name="chPrice" />
		<input type="hidden" name="chDesc" />
		<input type="hidden" name="chDayPrice1" />
		<input type="hidden" name="chDayPrice2" />
		<input type="hidden" name="chDayPrice3" />
		<input type="hidden" name="chDayPrice4" />
		<input type="hidden" name="chImage" />
		<input type="hidden" name="chDetailImage" />
		<input type="hidden" name="chDetailDesc" />
		<input type="hidden" name="chKind" />
	</form>
	<form id="delFrm" action="thingDelete.do" method="post">
		<input name="delId" type="hidden" value="${vo.thingId }" />
	</form>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<c:if test="${id ne vo.userId }">
							<h1 class="h3 mb-0 text-gray-800 little-mar">${vo.thingName }</h1><br />
							<h1 class="h3 mb-0 text-gray-800 text-uppercase little-mar">카테고리: ${vo.thingKind }</h1>
						</c:if>
						<c:if test="${id eq vo.userId }">
							<input class="little-mar" type="text" id="title" name="title" value="${vo.thingName }" size="70" /><br /> 
							<input class="little-mar" type="text" id="kind" name="kind" value="${vo.thingKind }" size="10" />
						</c:if>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												가격</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<c:if test="${id ne vo.userId }">
													<fmt:formatNumber type="currency" value="${vo.thingPrice }">
													</fmt:formatNumber>
												</c:if>
												<c:if test="${id eq vo.userId }">
													<input type="text" id="price" name="price"
														value="${vo.thingPrice }" size="10" />
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-md-6 mb-4" style="width: 670px;">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">간략
												스펙</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<c:if test="${id ne vo.userId }">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
															style="font-size: 11pt">${vo.thingDesc }</div>
													</c:if>
													<c:if test="${id eq vo.userId }">
														<textarea name="desc" id="desc" cols="90" rows="2">${vo.thingDesc }</textarea>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												1개월 가격변화</div>
											<c:if test="${id ne vo.userId }">
												<div id="line_top_x">
													<input id="price1" type="hidden" value="${vo.price1 }" />
													<input id="price2" type="hidden" value="${vo.price2 }" />
													<input id="price3" type="hidden" value="${vo.price3 }" />
													<input id="price4" type="hidden" value="${vo.price4 }" />
												</div>
											</c:if>
											<c:if test="${id eq vo.userId }">
												1.<input id="dayPrice1" type="text" value="${vo.price1 }"
													size="17" />
												2.<input id="dayPrice2" type="text" value="${vo.price2 }"
													size="17" />
												<br />
												3.<input id="dayPrice3" type="text" value="${vo.price3 }"
													size="17" />
												4.<input id="dayPrice4" type="text" value="${vo.price4 }"
													size="17" />
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<form action="" id="picture" enctype="multipart/form-data">
						<div class="row">
							<!-- Pie Chart -->
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4"
									style="width: 600px; height: 415px;">
									<!-- Card Header - Dropdown -->
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">상품사진</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="pb-2">
											<c:if test="${id ne vo.userId }">
												<img src="upload/${vo.thingImage }" width="380px"
													height="350px" style="margin: -0.8em 0 3em 4em;" />
											</c:if>
											<c:if test="${id eq vo.userId }">
												<img src="upload/${vo.thingImage }" width="250px"
													height="220px" style="margin: -0.8em 0 3em 4em;"
													id="preview-image" />
												<input type="file" accept="image/*"
													onchange="loadImg(this);" id="thingImage" name="thingImage" />
											</c:if>
										</div>
									</div>
								</div>
							</div>

							<!-- Area Chart -->
							<div class="col-xl-8 col-lg-7">
								<div class="card shadow mb-4"
									style="width: 1230px; height: 415px;">
									<!-- Card Header - Dropdown -->
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">가격비교</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body" style="maring: 0 auto; padding: 0;">
										<div class="chart-area">
											<script>
												loadSearchAPI("${vo.thingName}");
											</script>
											<table id="compareTbl" style="text-align: center; font-size: 11pt">
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Content Row -->
						<div class="row">
							<div class="col-lg-6 mb-4">

								<!-- Illustrations -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세이미지</h6>
									</div>
									<div class="card-body">
										<c:if test="${id ne vo.userId }">
											<img src="upload/${vo.thingImageDetail }" />
										</c:if>
										<c:if test="${id eq vo.userId }">
											<input type="file" accept="image/*"
												onchange="loadImg2(this);" id="detailImage"
												name="detailImage" />
											<img src="upload/${vo.thingImageDetail }" id="preview-image2" />
										</c:if>
									</div>
								</div>
							</div>

							<!-- Content Column -->
							<div class="col-lg-6 mb-4">

								<!-- Project Card Example -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상품의견</h6>
									</div>
									<div class="card-body">
										<div id="comments">
											<div id="comment-head" class="comment-row">
												<span id="comments-count">0</span> Comment(s)
											</div>
											<div class="comment-row">
												<div class="form-floating">	
													<textarea class="form-control" id="new_comment" name="new_comment" placeholder="Leave a comment here" id="floatingTextarea"></textarea>	
													<label for="floatingTextarea">Comments</label>
													<button class="btn btn-dark commentBtn" type="button" onclick="commentInsert('${id}', '${vo.thingId }')">등록</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div style="text-align: center">
									<c:if test="${id eq vo.userId }">
										<button class="btn btn-outline-dark" type="button"
											onclick="btnFnc('update')">수정</button>
										<button class="btn btn-outline-dark" type="button"
											onclick="btnFnc('del')">삭제</button>
									</c:if>
									<button class="btn btn-outline-dark" type="button"
										onclick="location.href='thingListPaging.do'">목록</button>
								</div>

							</div>
						</div>
					</form>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script>
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview-image").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

		function loadImg2(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview-image2").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>

</html>