<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script>
	//파일 업로드
	function imageBtnFnc() {
		var form = $("#picture")[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#thingImage")[0].files[0]);
		formData.append("fileObj2", $("#detailImage")[0].files[0]);
		formData.append("fileObj3", $("#detailDesc")[0].files[0]);

		let imageName = $("#thingImage").get(0).files[0].name;
		let detailName = $("#detailImage").get(0).files[0].name;
		let descName = $("#detailDesc").get(0).files[0].name;

		spec.imageName.value = imageName;
		spec.detailName.value = detailName;
		spec.descName.value = descName;

		$.ajax({
			url : "/proj/fileUpload",
			processData : false,
			contentType : false,
			data : formData,
			type : "POST",
			success : function(result) {
				alert("업로드 성공!!");
			},
			error : function(error) {
				console.log(err);
			},
		});
		spec.submit();
	}
</script>
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
					<div>
						<form action="thingInsert.do" method="post" id="spec" name="spec">
							<input type="hidden" name="imageName" /> <input type="hidden"
								name="detailName" /> <input type="hidden" name="descName" />
							<div style="text-align: center">
								<button class="btn btn-outline-success" type="button"
									onclick="imageBtnFnc()">
									등록</button>
								<input class="btn btn-outline-danger" type="reset" value="초기화" />
								<button class="btn btn-outline-secondary" type="button"
									onclick="location.href='index.do'">
									홈</button>
							</div>
							<!-- Page Heading -->
							<div
								class="
                                        d-sm-flex
                                        align-items-center
                                        justify-content-between
                                        mb-4
                                    ">
								<input type="hidden" id="id" name="id" value="${id }" />
								<input type="text" id="name" name="name" placeholder="기기명" size="30" />
								<input type="text" id="kind" name="kind" placeholder="기기종류" />
							</div>
							<!-- Content Row -->
							<div class="row">
								<!-- Earnings (Monthly) Card Example -->
								<div class="col-xl-3 col-md-6 mb-4">
									<div
										class="
                                                card
                                                border-left-primary
                                                shadow
                                                h-100
                                                py-2
                                            ">
										<div class="card-body">
											<div
												class="
                                                        row
                                                        no-gutters
                                                        align-items-center
                                                    ">
												<div class="col mr-2">
													<div
														class="
                                                                text-xs
                                                                font-weight-bold
                                                                text-primary
                                                                text-uppercase
                                                                mb-1
                                                            ">
														가격</div>
													<div
														class="
                                                                h5
                                                                mb-0
                                                                font-weight-bold
                                                                text-gray-800
                                                            ">
														<input type="text" id="price" name="price" size="30"
															placeholder="가격" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Earnings (Monthly) Card Example -->
								<div class="col-md-6 mb-4" style="width: 670px">
									<div
										class="
                                                card
                                                border-left-info
                                                shadow
                                                h-100
                                                py-2
                                            ">
										<div class="card-body">
											<div
												class="
                                                        row
                                                        no-gutters
                                                        align-items-center
                                                    ">
												<div class="col mr-2">
													<div
														class="
                                                                text-xs
                                                                font-weight-bold
                                                                text-info
                                                                text-uppercase
                                                                mb-1
                                                            ">
														간략 스펙</div>
													<div
														class="
                                                                row
                                                                no-gutters
                                                                align-items-center
                                                            ">
														<div class="col-auto">
															<input type="text" id="desc" name="desc" size="100"
																placeholder="간략한 스펙" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Pending Requests Card Example -->
								<div class="col-xl-3 col-md-6 mb-4">
									<div
										class="
                                                card
                                                border-left-warning
                                                shadow
                                                h-100
                                                py-2
                                            ">
										<div class="card-body">
											<div
												class="
                                                        row
                                                        no-gutters
                                                        align-items-center
                                                    ">
												<div class="col mr-2">
													<div
														class="
                                                                text-xs
                                                                font-weight-bold
                                                                text-warning
                                                                text-uppercase
                                                                mb-1
                                                            ">
														1개월 가격변화</div>
													<input id="dayPrice1" name="dayPrice1" type="text"
														placeholder="가격기록1" />
													<input id="dayPrice2" name="dayPrice2" type="text"
														placeholder="가격기록2" />
													<input id="dayPrice3" name="dayPrice3" type="text"
														placeholder="가격기록3" />
													<input id="dayPrice4" name="dayPrice4" type="text"
														placeholder="가격기록4" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

					<!-- Content Row -->
					<form action="" id="picture" enctype="multipart/form-data">
						<div class="row">
							<!-- Area Chart -->
							<div class="col-xl-8 col-lg-7">
								<div class="card shadow mb-4"
									style="width: 1230px; height: 430px">
									<!-- Card Header - Dropdown -->
									<div
										class="
                                                card-header
                                                py-3
                                                d-flex
                                                flex-row
                                                align-items-center
                                                justify-content-between
                                            ">
										<h6
											class="
                                                    m-0
                                                    font-weight-bold
                                                    text-primary
                                                ">
											뭘넣을지모름</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-area">123</div>
									</div>
								</div>
							</div>

							<!-- Pie Chart -->
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4"
									style="width: 600px; height: 430px">
									<!-- Card Header - Dropdown -->
									<div
										class="
                                                card-header
                                                py-3
                                                d-flex
                                                flex-row
                                                align-items-center
                                                justify-content-between
                                            ">
										<h6
											class="
                                                    m-0
                                                    font-weight-bold
                                                    text-primary
                                                ">
											상품사진</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="pb-2">
											<input type="file" id="thingImage" name="thingImage" />
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
										<h6
											class="
                                                    m-0
                                                    font-weight-bold
                                                    text-primary
                                                ">
											상세이미지</h6>
									</div>
									<div class="card-body">
										<input type="file" name="detailImage" id="detailImage" />
									</div>
								</div>
							</div>

							<!-- Content Column -->
							<div class="col-lg-6 mb-4">
								<!-- Project Card Example -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6
											class="
                                                    m-0
                                                    font-weight-bold
                                                    text-primary
                                                ">
											상세스펙</h6>
									</div>
									<div class="card-body">
										<div class="prod_spec">
											<input type="file" name="detailDesc" id="detailDesc" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
