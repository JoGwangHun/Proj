<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Day');
		data.addColumn('number', 'Price');

		let price1 = $("#price1_val").val();
		let price2 = $("#price2_val").val();
		let price3 = $("#price3_val").val();
		let price4 = $("#price4_val").val();

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
</script>
<script>
	function btnFnc(str) {
		
		if(str == "del") {
			delFrm.submit();
			return false;
		}
	}
</script>

<title>상품선택</title>
<style>
li {
	float: left;
}
</style>

</head>

<body id="page-top">

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
						<h1 class="h3 mb-0 text-gray-800">${vo.thingName }</h1>
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
												Price</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<fmt:formatNumber type="currency" value="${vo.thingPrice }"></fmt:formatNumber>
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
												class="text-xs font-weight-bold text-info text-uppercase mb-1">simple
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
														style="font-size: 10pt">${vo.thingDesc }</div>
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
											<div id="line_top_x">
												<input id="price1_val" type="hidden" value="${vo.price1 }" />
												<input id="price2_val" type="hidden" value="${vo.price2 }" />
												<input id="price3_val" type="hidden" value="${vo.price3 }" />
												<input id="price4_val" type="hidden" value="${vo.price4 }" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->

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
										<img src="upload/${vo.thingImage }" width="380px"
											height="350px" style="margin: -0.8em 0 3em 4em;" />
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
									<h6 class="m-0 font-weight-bold text-primary">뭘넣을지모름</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area"></div>
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
									<img src="upload/detail/${vo.thingImageDetail }" />
								</div>
							</div>
						</div>

						<!-- Content Column -->
						<div class="col-lg-6 mb-4">

							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">상세스펙</h6>
								</div>
								<div class="card-body">
									<div class="prod_spec">
										<img src="upload/detail/${vo.thingImageDetail2 }" />
									</div>
								</div>
							</div>
							<div style="text-align: center">
								
									<button class="btn btn-outline-dark" type="button" onclick="btnFnc('update')">수정</button>
									<button class="btn btn-outline-dark" type="button"
										onclick="btnFnc('del')">삭제</button>
								<form id="delFrm" action="thingDelete.do" method="post">
									<input name="delId" type="hidden" value="${vo.thingId }" />
								</form>
							</div>

						</div>


					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath }/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath }/admin/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath }/admin/js/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath }/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>