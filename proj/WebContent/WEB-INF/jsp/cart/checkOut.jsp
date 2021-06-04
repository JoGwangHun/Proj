<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
<meta name="generator" content="Jekyll v3.8.6" />
<title>Checkout example · Bootstrap</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath }/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		frm.address.value = roadFullAddr;		
}
</script>
</head>

<body class="bg-light">
	<div class="container" style="padding-top: 3em;">
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4
					class="
                            d-flex
                            justify-content-between
                            align-items-center
                            mb-3
                        ">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill">${cartCnt}</span>
				</h4>
				<ul class="list-group mb-3">
					<c:forEach items="${list }" var="list">
						<li
							class="
                                list-group-item
                                d-flex
                                justify-content-between
                                lh-condensed
                            ">
							<div>
								<h6 class="my-0">${list.thing_name }</h6>
								<small class="text-muted">갯수: ${list.count }</small>
							</div> <span class="text-muted"> <fmt:formatNumber
									type="currency" value="${list.price }"></fmt:formatNumber><br />
								<fmt:formatNumber type="currency" value="${list.totalPrice }"></fmt:formatNumber>
						</span>
						</li>
					</c:forEach>
					<li
						class="
                                list-group-item
                                d-flex
                                justify-content-between
                            ">
						<span>Total (KRW)</span> <strong> 
						<fmt:formatNumber type="currency" value="${total }"></fmt:formatNumber>
					</strong>
					</li>
				</ul>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Billing address</h4>
				<form class="needs-validation" name="frm" id="frm" action="${pageContext.request.contextPath }/popup/payment.jsp">
					<input type="hidden" id="total_Price" name="total_Price" value="${total }" />	
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="lastName">이름</label> 
							<input type="text" class="form-control" name="name" id="name" placeholder="이름" required="required" />
							<div class="invalid-feedback" style="width: 100%">Valid name is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="username">전화번호</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">☎</span>
							</div>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화" required="required" />
							<div class="invalid-feedback" style="width: 100%">Your PhoneNumber is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label>
						<input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required="required" />
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>

					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="zip">우편번호</label>
							<input type="text" class="form-control" name="zip" id="zip" placeholder="우편번호" required="required" />
							<div class="invalid-feedback">Zip code required.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address">주소&emsp;<button type="button" class="btn btn-secondary" onclick="goPopup()">주소검색</button></label> 
						<input type="text" class="form-control" name="address" id="address" placeholder="주소 입력" required="required" readonly />
						<div class="invalid-feedback">Please enter your shipping address.</div>
					</div>
					<hr class="mb-4" />
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="same-address" />
						 <label class="custom-control-label" for="same-address">
						 	배송지 주소가 청구지 주소와 동일합니다.
						 </label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="save-info" />
						<label class="custom-control-label" for="save-info">
							이 정보를 다음에도 사용하겠습니다.
						</label>
					</div>
					<hr class="mb-4" />

					<h4 class="mb-3">Payment</h4>
					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required />
							<label class="custom-control-label" for="credit">카카오페이</label>
						</div>
						<!-- <div class="custom-control custom-radio">
							<input id="debit" name="paymentMethod" type="radio"
								class="custom-control-input" required="" /> <label
								class="custom-control-label" for="debit">Debit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" name="paymentMethod" type="radio"
								class="custom-control-input" required="" /> <label
								class="custom-control-label" for="paypal">PayPal</label>
						</div> -->
					</div>
					<!-- <div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name">Name on card</label> 
							<input type="text" class="form-control" id="cc-name" placeholder="" required="" />
							<small class="text-muted">Full name as displayed on card</small>
							<div class="invalid-feedback">Name on card is required</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">Credit card number</label> <input
								type="text" class="form-control" id="cc-number" placeholder=""
								required="" />
							<div class="invalid-feedback">Credit card number is
								required</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="cc-expiration">Expiration</label> <input type="text"
								class="form-control" id="cc-expiration" placeholder=""
								required="" />
							<div class="invalid-feedback">Expiration date required</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="cc-cvv">CVV</label> <input type="text"
								class="form-control" id="cc-cvv" placeholder="" required="" />
							<div class="invalid-feedback">Security code required</div>
						</div>
					</div> -->
					<hr class="mb-4" />
					<button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
