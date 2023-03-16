<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-41R9V7S86H1v2V7KcMI8T2T7ie+TIfbKPhawTc8mxX9n1lzZ+rgvZJjPCbsC8Q2zux+TgCJjzGeWSDy8mX7+dA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>購入履歴</title>
<Style>
h1{
	font-size: 40px;
}
h1,.notbuy{
	color: #fff;
	text-shadow: 2px 2px 3px #000, -1px -1px 3px #000;
	z-index:1;
}

</Style>
</head>
<body>

<jsp:include page="/header_shop.jsp" />



<h1>購入履歴</h1>
	<c:choose>
		<c:when test="${history.size()!=0 }">
			<c:forEach var="date" items="${dates}">
				<div class="card">
					<div class="card-header">
		
		
		
						<h5 class="card-title">
							購入日:
							<c:out value="${date}"></c:out>
						</h5>
		
						<c:set var="total" value="0" />
					</div>
					<div class="card-body">
		
		
						<c:forEach var="history" items="${history }">
								<c:if test="${date == history.order_At}">
			
									<div class="card">
										<div class="row g-0">
											<div class="col-5 col-sm-4">
												<img
													src="<%=request.getContextPath() %>/image/<c:out value="${history.image }"/>"
													class="img-fluid w-100" class="img-thumbnail"
													alt="card-horizontal-image">
											</div>
											<div class="col-7 col-sm-8">
												<div class="card-body">
													<h5 class="card-title">
														商品名：
														<c:out value="${history.item_Name }" />
													</h5>
													<p class="card-text">
														<br> カテゴリー：
														<c:out value="${history.category }"></c:out>
														<br>
														<c:out value="${history.discription }"></c:out>
														<br> 価格:
														<c:out value="${history.price }"></c:out>
														円<br> 購入数:
														<c:out value="${history.order_Num }"></c:out>
														<br> 合計金額:
														<c:out value="${history.priceAll }"></c:out>
														円<br> 購入日:
														<c:out value="${history.order_At }"></c:out>
														<br></p>
												</div>
											</div>
										</div>
									</div>
			
									<c:set var="total" value="${total +history.priceAll}" />
								</c:if>
						</c:forEach>

						<div class="card-footer text-muted">
		
							<h5 class="card-title">
								<div class="float-end">
									合計金額:
									<c:out value="${total}"></c:out>
									円
								</div>
							</h5>
						</div>
		
					</div>
				</div>
		
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p class="notbuy"><c:out value="${user.user_Id }"/>様が、購入したものはございません。</p>
		</c:otherwise>	
	</c:choose>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>