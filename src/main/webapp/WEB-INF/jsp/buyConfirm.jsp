<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.TemporaryItem, java.text.NumberFormat, model.Cart, model.User, model.CartControlLogic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Cart cart = (Cart) session.getAttribute("cart"); %>
<% NumberFormat ni = NumberFormat.getNumberInstance(); %>
<% CartControlLogic confirmToken = new CartControlLogic(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>ご確認画面</title>
<style>
body {
	margin-top: 25px;
	margin-bottom: 25px;
}
</style>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${cart != null }">
				<body class="bg-light">
					<div class="container">
						<main>
							<div class="row g-5">
								<div class="col-md-5 col-lg-4 order-md-last">
									<h4
										class="d-flex justify-content-between align-items-center mb-3">
										<span class="">カート</span> <span
											class="badge bg-primary rounded-pill"><%=cart.getThingsInCart().size()%></span>
									</h4>
									<ul class="list-group mb-3">
										<%
										for (int i = 0; i < cart.getThingsInCart().size(); i += 1) {
										%>
										<li
											class="list-group-item d-flex justify-content-between lh-sm">
											<div class="row">
											<div class="col-9">
												<h6 class="my-0"><%=cart.getThingsInCart().get(i).getItem()%>
													&emsp;
													<%=cart.getQuantity().get(i)%>個
												</h6>
												<small class="text-muted"> <a
													href="/NAOE/ItemServlet?itemNumber=<%=cart.getThingsInCart().get(i).getId()%>">商品ページ</a>
												</small>
											</div> <span class="text-muted col-3"> <%=cart.getThingsInCart().get(i).getPrice() * cart.getQuantity().get(i)%>円
										</span>
											</div>
										
										</li>
										<%
										}
										%>
										<li class="list-group-item d-flex justify-content-between">
											<span>合計 (円)</span> <strong><%=ni.format(cart.getPricetotal())%>円</strong>
										</li>
									</ul>
									
									<form class="needs-validation" action="/NAOE/BuyDecideServlet" method="post">
									<input class="w-100 btn btn-primary btn-lg" type="submit" value="購入を確定する">
									<div  class="text-center">
										<hr class="my-4">
										<a class="w-100 btn btn-primary btn-lg" href="/NAOE/NaoeServlet">商品一覧へ戻る</a>
									</div>
								</div>

								<div class="col-md-7 col-lg-8">
									<h4 class="mb-3">請求先住所</h4>
										<div class="row g-3">
											<div class="col-12">
												<label for="username" class="form-label">ユーザー名</label>
												<div class="input-group has-validation">
													<span class="input-group-text">@</span> <input type="text"
														class="form-control" id="username"
														value=<c:out value="${user.user_Name }" /> disabled>
													<div class="invalid-feedback">ユーザー名が必要です</div>
												</div>
											</div>

											<div class="col-12">
												<label for="email" class="form-label">Eメール <span
													class="text-muted">(任意)</span></label> <input type="email"
													class="form-control" id="email"
													value=<c:out value="${user.mail }" /> disabled>
												<div class="invalid-feedback">
													配送の更新に有効なメールアドレスを入力してください</div>
											</div>

											<c:forEach var="loginConf" items="${userInfoList}">
												<div class="col-12">
													<label for="address" class="form-label">住所</label> <input
														type="text" class="form-control" id="address"
														value=<c:out value="${loginConf.address }" /> disabled>
													<div class="invalid-feedback">配送先住所を入力してください</div>
												</div>
												<div class="col-md-6">
													<label for="zip" class="form-label">郵便番号</label> <input
														type="text" class="form-control" id="zip"
														value=<c:out value="${loginConf.post_Code }"></c:out>
														disabled>
													<div class="invalid-feedback">郵便番号を入力してください</div>

													<div class="col-md-6">
														<label for="tel" class="form-label">電話番号</label> <input
															type="text" class="form-control" id="tel"
															value=<c:out value="${loginConf.tel }"></c:out> disabled>
														<div class="invalid-feedback">電話番号を入力してください</div>
													</div>
											</c:forEach>
										</div>

										<hr class="my-4">

										<h4 class="mb-3">お支払い方法</h4>

										<div class="my-3">
											<div class="form-check">
												<input id="credit" name="paymentMethod" type="radio"
													class="form-check-input" value="1" checked required>
													<input type="hidden" name="confirmToken" value="<%=confirmToken.MakeRandomNumbers()%>"> <label
													class="form-check-label" for="credit">代金引換</label>
											</div>
											<c:choose>
											<c:when test="${userMoney >= cart.getPricetotal() }">
											<div class="form-check">
												<input id="debit" name="paymentMethod" type="radio" 
													class="form-check-input" value="2" required> 
													<input type="hidden" name="confirmToken" value="<%=confirmToken.MakeRandomNumbers()%>"><label
													class="form-check-label" for="point">NAOEポイントで支払う</label>
												<p>
													残高:<span class="text-muted">${userMoney }</span>ポイント
													<% session.removeAttribute("userMoney"); %>
												</p>
											</div>
											</c:when>
											<c:otherwise>
											<div class="form-check">
												<input id="debit" name="paymentMethod" type="radio" disabled="disabled"
													class="form-check-input" value="2" required> <label
													class="form-check-label" for="point">NAOEポイントで支払う</label>
												<p>
													残高:<span class="text-muted">${userMoney }</span>ポイント
													<% session.removeAttribute("userMoney"); %><br>
													<span>ポイントが足りません。</span>
												</p>
											</div>
											</c:otherwise>
											</c:choose>
										</div>

									</form>
								</div>
							</div>
						</main>
					</div>
				</body>

			</c:when>
			<c:otherwise>
				<p>例外処理が行われました。トップ画面に戻ってください。</p>
				<a href="NaoeServlet">トップ画面に戻る</a>
			</c:otherwise>
		</c:choose>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>