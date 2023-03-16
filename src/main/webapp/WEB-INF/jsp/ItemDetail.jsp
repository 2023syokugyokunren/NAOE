<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.TemporaryItem, java.text.NumberFormat, model.Cart, model.CartControlLogic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% TemporaryItem item = (TemporaryItem) session.getAttribute("iteminfo"); %>
<% NumberFormat ni = NumberFormat.getNumberInstance();%>
<% CartControlLogic token = new CartControlLogic(); %>
<% session.removeAttribute("sessionToken"); %>
<% Cart cart = (Cart) session.getAttribute("cart"); %>

<%
int n = 0;
int cartnum = 0;
if (cart != null ){
	 n = cart.getThingsInCart().indexOf(item);
	 if(n != -1){
	cartnum = cart.getQuantity().get(n);
	}
}
%>
<% int total = item.getStock() - cartnum; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細画像</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
li {
	margin-bottom: 15px;
	font-size: 20px;
}
</style>
<script> 
	function reload(){
		if (window.name != "any") {
		
		      location.reload();
		      window.name = "any";
		    } else {
		      window.name = "";
		    }
		}
	function delayreload(){
		window.setTimeout(reload, 3000);
		}
</script>
</head>
<body onpageshow="<c:if test="${successMsg == null && errorReview == null}">reload()</c:if><c:if test="${successMsg != null }"> delayreload()</c:if><c:if test="${errorReview != null }"> delayreload()</c:if>" style="background: white">
<body onpageshow="reload()" style="background: white">
	<div class="wrapper">
	
		<c:if test="${errorReview != null }">
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<strong>レビューの内容は5文字以上30文字以下にしてください</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<c:if test="${successMsg != null}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong>レビューが投稿されました。</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<jsp:include page="/header_shop.jsp" />
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img
							src="<%=request.getContextPath() %>/image/<c:out value="${iteminfo.getImage()}" />"
							class="img-fluid" alt="商品写真" width="600" height="500">
					</div>
					<div class="col-md-6">
						<div class="small mb-1">
							カテゴリ：
							<c:out value="${ iteminfo.getCategory() }" />
						</div>
							<p>
								平均評価:
								<c:choose>
									<c:when test="${avgScore==1}">
										<img src="<%=request.getContextPath()%>/css/img/review_1.0.png" alt="1">
									</c:when>
									<c:when test="${avgScore==2}">
										<img src="<%=request.getContextPath()%>/css/img/review_2.0.png" alt="2">
									</c:when>
									<c:when test="${avgScore==3}">
										<img src="<%=request.getContextPath()%>/css/img/review_3.0.png" alt="3">
									</c:when>
									<c:when test="${avgScore==4}">
										<img src="<%=request.getContextPath()%>/css/img/review_4.0.png" alt="4">
									</c:when>
									<c:when test="${avgScore==5}">
										<img src="<%=request.getContextPath()%>/css/img/review_5.0.png" alt="5">
									</c:when>
									<c:otherwise>
										<img src="<%=request.getContextPath()%>/css/img/review_0.0.png" alt="0""
									</c:otherwise>
								</c:choose>
							</p>
						<h1 class="display-5 fw-bolder">
							<c:out value="${ iteminfo.getItem() }" />
						</h1>
						<div class="fs-5 mb-5">
							<span class="text-danger h2"> <%=ni.format(item.getPrice())%>円
							</span>
							<c:if test="${user.user_Id !=null }">
								<c:choose>
									<c:when test="${favocheck!=true}">
										<button type="button" class="btn btn-success"  onclick="location.href='/NAOE/FavoriteServlet?action=favoadd';">お気に入り登録</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-danger" onclick="location.href='/NAOE/FavoriteServlet?action=favodel';">お気に入り解除</button>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
						<p class="lead">
							<c:out value="${ iteminfo.getDiscription() }" />
						</p>
						<div class="d-flex">
							<c:choose>
								<c:when test="${user.user_Id != null}">
									<form action="/NAOE/purchaseServlet" method="post">
										<input type="hidden" name="itemNumber"
											value="<c:out value="${ iteminfo.getId() }" />"> 
											<input type="hidden" name="token" value="<%=token.MakeRandomNumbers()%>">
										
										<c:choose>
											<c:when test="${iteminfo.getStock() <= 1}">
												<button id="sendbutton" disabled>売り切れ</button>
											</c:when>

											<c:otherwise>
											
												<c:choose>
													<c:when test="${user.privilege != 'admin'}">
														<div class="d-flex">
															<c:choose>
																<c:when test="${iteminfo.getStock()>=5 }">
																	<input class="form-control text-center me-3"
																		id="inputQuantity" type="number" min="1" max="5"
																		value="1" name="quantity" style="max-width: 4rem" required/>
																</c:when>
																<c:otherwise>
																	<input class="form-control text-center me-3"
																		id="inputQuantity" type="number" min="1" max="<%=total%>"
																		value="1" name="quantity" style="max-width: 4rem" />
																</c:otherwise>
															</c:choose>
															<button class="btn btn-outline-dark flex-shrink-0"
																type="submit">
																<i class="bi-cart-fill me-1"></i> Add to cart
															</button>
														</div>
													</c:when>
													<c:otherwise>
														<div class="alert alert-danger" role="alert">
														 	管理者アカウントは購入できません。
														</div>
														<p class="lead">
															※管理者のみ表示しています。<br>
															在庫:<c:out value="${ iteminfo.stock}" /><br>
															売上:<c:out value="${ iteminfo.order}" /><br>
															登録者:<c:out value="${ iteminfo.registerUser}" />
														</p>
													</c:otherwise>
												</c:choose>
												
											</c:otherwise>
										</c:choose>
									</form>
								</c:when>
								<c:otherwise>
									<p>購入をするにはログインが必要です</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="text-center">
					<form action="/NAOE/NaoeServlet" method="get">
						<input class="btn btn-primary m-2" type="submit" value="商品一覧へ戻る">
					</form>
					<c:if test="${user.privilege == 'admin'}">
						<form action="/NAOE/AdminServlet" method="get">
							<input class="btn btn-primary m-2" type="submit" value="管理画面へ戻る">
						<form action="/NAOE/NaoeServlet" method="get">
					</c:if>
				</div>
			</div>
		</section>

		<section>
			<div class="container">
				<div class="row">
					<div class="col-md-6 border-end">
						<c:choose>
							<c:when test="${ibc==true && user.user_Id != null}">
								<c:choose>
									<c:when test="${postCheck!=true }">
										<form action="/NAOE/PostServlet" method="post"
											style="max-width: 450px;">
											<div class="mb-3">
												<label for="reviewInput" class="form-label">レビューを投稿する</label>
												<textarea class="form-control" id="reviewInput" rows="3"
													name="review"></textarea>
												評価:(1～5):<input type="number" value="1" min="1" max="5" name="score" required><br>
											</div>
											<button type="submit" class="btn btn-primary">投稿する</button>
										</form>
									</c:when>
									<c:otherwise>
										<p>すでにレビューが投稿されています。</p>
									</c:otherwise>
								</c:choose>
							</c:when>
							
							<c:otherwise>
								<p>レビューを投稿するには、商品購入をしてください。</p>
							</c:otherwise>
						</c:choose>
						<br>
						<p class="h4">カスタマーレビュー</p>
						<c:choose>
							<c:when test="${parsentList!=null }">
								<ul class="list-unstyled">
									<li style="font-size:18px;">評価5:<span style="color:#3366FF"><c:out value="${ parsentList[0]}" />%</span><div style="background-color:yellow; width: <c:out value="${ parsentList[0]}" />%">&nbsp;</div></li>
									<li style="font-size:18px;">評価4:<span style="color:#3366FF"><c:out value="${ parsentList[1]}" />%</span><div style="background-color:yellow; width: <c:out value="${ parsentList[1]}" />%">&nbsp;</div></li>
									<li style="font-size:18px;">評価3:<span style="color:#3366FF"><c:out value="${ parsentList[2]}" />%</span><div style="background-color:yellow; width: <c:out value="${ parsentList[2]}" />%">&nbsp;</div></li>
									<li style="font-size:18px;">評価2:<span style="color:#3366FF"><c:out value="${ parsentList[3]}" />%</span><div style="background-color:yellow; width: <c:out value="${ parsentList[3]}" />%">&nbsp;</div></li>
									<li style="font-size:18px;">評価1:<span style="color:#3366FF"><c:out value="${ parsentList[4]}" />%</span><div style="background-color:yellow; width: <c:out value="${ parsentList[4]}" />%">&nbsp;</div></li>
								</ul>
							</c:when>
							<c:otherwise>
								<p>まだレビューが投稿されていません。</p>
							</c:otherwise>
						</c:choose>
						
					</div>
					
					<div class="col-md-6" style="height: 500px; overflow-y: auto;">
							<c:choose>
								<c:when test="${postList !=null}">
									<c:forEach var="review" items="${postList }">
										<div class="card mb-3">
											<div class="card-body">
												<h5 class="card-title">投稿日時:<c:out value=" ${review.created_At}"/></h5>
												<p class="card-text">評価: <c:out value="${review.score }"/></p>
												<p class="card-text">レビュー:<c:out value="${review.content }"/></p>
												
												<c:if test="${user.privilege == 'admin'}">
													<p>投稿ID: ${review.post_Id}</p>
												</c:if>
												<c:if test="${user.id==review.user_Id }">
													<p>※<c:out value="${user.user_Id }"/>さんの投稿です。</p>
												</c:if>
												<c:if test="${user.privilege == 'admin'|| user.id==review.user_Id}">
													<button type="button" class="btn btn-danger" onclick="location.href='/NAOE/PostServlet?id=${review.post_Id}';">削除</button>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p>まだレビューが投稿されていません。</p>
								</c:otherwise>
							</c:choose>
					</div>
				</div>
			</div>
				
		</section>
		<br>
		
		<jsp:include page="/footer.jsp" />
	</div>
	<% session.removeAttribute("postList"); %>
	<% session.removeAttribute("avgScore"); %>
	<% session.removeAttribute("errorReview"); %>
	<% session.removeAttribute("successMsg"); %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>