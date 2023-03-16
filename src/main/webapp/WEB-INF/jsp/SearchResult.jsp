<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.CartControlLogic" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% CartControlLogic token = new CartControlLogic(); %>
<% session.removeAttribute("sessionToken"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果一覧</title>
</head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
	
	
	<style>
		
		.btn {
      padding: 50px 40px; /* 上下10px, 左右20pxの余白を設定 */
      font-size: 16px; /* フォントサイズを16pxに設定 */
      margin:10px;
    }
		
	</style>
<title>ショップ</title>
</head>
<body style="background: white">
	<div class="wrapper">
		<jsp:include page="/header_shop.jsp" />

		<!-- Header-->

		<div class="bg-dark py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">
					<h1 class="display-4 fw-bolder">NAOEショップ：商品検索結果</h1>

				</div>
			</div>
		</div>
		
<c:set var="total" value="0" />

		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

					<c:forEach var="item" items="${search}">
					<c:set var="total" value="1" />
						<% int number = token.MakeRandomNumbers(); %>
						<div class="col mb-5">
							<div class="card h-100">
								<img class="card-img-top"
									src="<%=request.getContextPath()%>/image/<c:out value="${item.image}" />" alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">
											商品名：<a
												href="/NAOE/ItemServlet?itemNumber=<c:out value="${item.id}" />"><c:out
													value="${item.item}" /></a>
										</h5>
										<p>
											カテゴリー：
											<c:out value="${item.category}" />
										</p>
										<!-- Product price-->
										値段：
										<c:out value="${item.price }" />円
									</div>
								</div>
							<!-- Product actions-->
													<div class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${item.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${item.stock > 1}">
																				<button class="btn btn-outline-dark mt-auto"
																					type="submit">Add to cart</button>
																			</c:when>
																		<c:otherwise>
																				<button class="btn btn-outline-dark mt-auto"
																					type="submit" disabled>現在購入できません</button>
																		</c:otherwise>
																		</c:choose>
																	</form>
																</div>
															</c:when>
															<c:otherwise>
																<div class="alert alert-danger" role="alert">
																	<h6>管理者アカウントは購入できません。</h6></div>
															</c:otherwise>
														</c:choose>
													</div>
								
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<c:if test="${total==0}">
		<div class="alert alert-danger alert-dismissible fade show"role="alert">
			<strong>一致する商品はありませんでした</strong>
		</div>
	</c:if>
	
	<div class="position-relative">
  <div class="position-absolute top-0 start-0 translate-middle"></div>
  <div class="position-absolute top-0 start-50 translate-middle"></div>
  <div class="position-absolute top-0 start-100 translate-middle"></div>
  <div class="position-absolute top-50 start-0 translate-middle"></div>
  <div class="position-absolute top-50 start-50 translate-middle"></div>
  <div class="position-absolute top-50 start-100 translate-middle"></div>
  <div class="position-absolute top-100 start-0 translate-middle"></div>
  <div class="position-absolute top-100 start-50 translate-middle"><button type="button" class="btn btn btn-secondary" onclick="location.href='/NAOE/NaoeServlet';">TOP戻る</button></div>
  <div class="position-absolute top-100 start-100 translate-middle"></div>
  
</div>
	
		
		</div>
</body>
</html>