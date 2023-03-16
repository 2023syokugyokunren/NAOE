<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.CartControlLogic"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
CartControlLogic token = new CartControlLogic();
%>
<%
session.removeAttribute("sessionToken");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, user-scalable=yes">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<script>
	jQuery(document).ready(function() {
		var offset = 100;
		var duration = 500;
		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > offset) {
				jQuery('.pagetop').fadeIn(duration);
			} else {
				jQuery('.pagetop').fadeOut(duration);
			}
		});

		jQuery('.pagetop').click(function(event) {
			event.preventDefault();
			jQuery('html, body').animate({
				scrollTop : 0
			}, duration);
			return false;
		})
	});
</script>

<title>ショップ</title>
</head>
<body style="background: white">
	<!-- 住所登録完了 -->
	<c:if test="${addressMsg!=null }">

		<div class="alert alert-success" role="alert">${addressMsg }</div>
	</c:if>
	<%
	session.removeAttribute("addressMsg");
	%>

	<!--ユーザー情報変更完了  -->
	<c:if test="${userMsg!=null }">

		<div class="alert alert-info" role="alert">${userMsg }</div>
	</c:if>
	<%
	session.removeAttribute("userMsg");
	%>
	<!-- 住所登録の要求 -->
    <c:if test="${registerDmd!=null }">
        <div class="alert alert-primary" role="alert">
            ${registerDmd } <a href="/NAOE/UserInfoServlet" class="alert-link">住所登録する</a>
            <%session.removeAttribute("registerDmd"); %>
        </div>
    </c:if>
	<div class="wrapper">
		<jsp:include page="/header_shop.jsp" />
		<!-- スライドショー -->
		<div class="img-frame">
			<p class="msg-01">
				NAOE SHOPへ<br>ようこそ
			</p>
			<div class="img-01"></div>
			<div class="img-02"></div>
			<div class="img-03"></div>
		</div>

		<!-- タブ -->
		<div class="tab01">
			<div class="kensaku">
				<form action="/NAOE/ItemServlet" method="post">
					<div class="search royalblue">
						<select name="hardness" class="select" style="width: 100px;">
							<option value="">カテゴリ</option>
							<c:forEach var="category" items="${category }">
								<option value="${category.category_Id }"><c:out
										value="${category.category_Name }"></c:out></option>
							</c:forEach>
						</select> <input type="text" name="word">
						<button type="submit"></button>
					</div>
				</form>
			</div>
			<input id="menu01" type="radio" name="tab_menu" checked> <label
				class="tab_menu" for="menu01">ホーム</label> <input id="menu02"
				type="radio" name="tab_menu"> <label class="tab_menu"
				for="menu02">ランキング</label> <input id="menu03" type="radio"
				name="tab_menu"> <label class="tab_menu" for="menu03">お気に入り</label>

			<input id="menu04" type="radio" name="tab_menu"> <label
				class="tab_menu" onclick="location.href='ByHistoryServlet'">購入履歴</label>

			<!-- ここからタブの中身 -->
			<div class="tab_contents" id="menu01">

				<!-- サイドバー -->

				<div class="row" _msthidden="12">
					<div class="col-3 col-lg-2 tab_contents_sumaho" _msthidden="2">
						<!-- スマホ用カテゴリ要素 -->
						<p class="book_toggle_btn  sumaho">
							<img src="./css/img/menu.png"><strong>カテゴリ一覧</strong>
						<p>
						<ul class="book_toggle">

							<div class="list-group" id="list-tab " role="tablist"
								_msthidden="2">
								<a class="list-group-item list-group-item-action active"
									id="list-home-list" data-bs-toggle="list" href="#list-home"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1077">おすすめ・特集</a> <a
									class="list-group-item list-group-item-action"
									id="list-profile-list" data-bs-toggle="list"
									href="#list-profile" role="tab" aria-controls="profile"
									_msttexthash="94315" _msthidden="1" _msthash="1078">野菜、果物</a> <a
									class="list-group-item list-group-item-action"
									id="list-messages-list" data-bs-toggle="list"
									href="#list-messages" role="tab" aria-controls="messages"
									_msttexthash="113854" _msthidden="1" _msthash="1079">肉、ハム、ソーセージ</a>
								<a class="list-group-item list-group-item-action"
									id="list-settings-list" data-bs-toggle="list"
									href="#list-settings" role="tab" aria-controls="settings"
									_msttexthash="117221" _msthidden="1" _msthash="1080">魚、刺身、海藻</a>
								<a class="list-group-item list-group-item-action"
									id="list-tamago-list" data-bs-toggle="list" href="#tamago"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1081">卵、牛乳、乳製品、パン、ジャム、スープ</a> <a
									class="list-group-item list-group-item-action"
									id="list-tofu-list" data-bs-toggle="list" href="#tofu"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1082">豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物</a> <a
									class="list-group-item list-group-item-action"
									id="list-kome-list" data-bs-toggle="list" href="#kome"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1083">米、餅、麺類</a> <a
									class="list-group-item list-group-item-action"
									id="list-zitan-list" data-bs-toggle="list" href="#zitan"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1084">時短料理の素、チルド野菜</a> <a
									class="list-group-item list-group-item-action"
									id="list-retoruto-list" data-bs-toggle="list" href="#retoruto"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1085">レトルト、インスタント食品</a> <a
									class="list-group-item list-group-item-action"
									id="list-reitou-list" data-bs-toggle="list" href="#reitou"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1086">冷凍食品、冷凍食材</a> <a
									class="list-group-item list-group-item-action"
									id="list-cup-list" data-bs-toggle="list" href="#cup" role="tab"
									aria-controls="messages" _msttexthash="113854" _msthidden="1"
									_msthash="1087">カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮</a> <a
									class="list-group-item list-group-item-action"
									id="list-okasi-list" data-bs-toggle="list" href="#okasi"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1088">お菓子、アイス、デザート、製菓材料</a> <a
									class="list-group-item list-group-item-action"
									id="list-tyoumi-list" data-bs-toggle="list" href="#tyoumi"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1089">調味料、ルー、だし、スープの素、油</a> <a
									class="list-group-item list-group-item-action"
									id="list-mizu-list" data-bs-toggle="list" href="#mizu"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1090">水、飲料</a> <a
									class="list-group-item list-group-item-action"
									id="list-sake-list" data-bs-toggle="list" href="#sake"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1091">お酒</a> <a
									class="list-group-item list-group-item-action"
									id="list-nitiyou-list" data-bs-toggle="list" href="#nitiyou"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1092">日用品、ホーム＆キッチン、ペット、文房具</a> <a
									class="list-group-item list-group-item-action"
									id="list-kusuri-list" data-bs-toggle="list" href="#kusuri"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1093">お薬、健康、美容、介護</a> <a
									class="list-group-item list-group-item-action"
									id="list-baby-list" data-bs-toggle="list" href="#baby"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1094">ベビー、キッズ</a> <a
									class="list-group-item list-group-item-action"
									id="list-kenkou-list" data-bs-toggle="list" href="#kenkou"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1080">健康食品</a>
							</div>
						</ul>
					</div>
					<!-- サイドバーここまで -->
					<div class="col-10 suma" _msthidden="12">
						<div class="tab-content" id="list-nav-tabContent" _msthidden="4">
							<div class="tab-pane fade show active" id="list-home"
								role="tabpanel" aria-labelledby="list-home-list"
								_msttexthash="19236217" _msthidden="1" _msthash="1081">
								<!-- 仮のおすすめ画面 -->
								<h3>おすすめ・特集</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="osusume" items="${categoryList_osusume}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top "
														src="<%=request.getContextPath() %>/image/<c:out value="${osusume.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<p class="fw-bolder ">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${osusume.id}" />"><c:out
																		value="${osusume.item}" /></a>
															</p>
															<p>
																カテゴリー：
																<c:out value="${osusume.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${osusume.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${osusume.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${osusume.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>

									</div>
							</div>
							<!-- 仮のおすすめ画面ここまで -->

							<div class="tab-pane fade" id="list-profile" role="tabpanel"
								aria-labelledby="list-profile-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>野菜、果物</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="yasai" items="${categoryList_yasai}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${yasai.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${yasai.id}" />"><c:out
																		value="${yasai.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${yasai.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${yasai.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${yasai.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${yasai.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="list-messages" role="tabpanel"
								aria-labelledby="list-messages-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>肉、ハム、ソーセージ</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="niku" items="${categoryList_niku}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${niku.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${niku.id}" />"><c:out
																		value="${niku.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${niku.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${niku.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${niku.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${niku.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="list-settings" role="tabpanel"
								aria-labelledby="list-settings-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>魚、刺身、海藻</h3>

								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="sakana" items="${categoryList_sakana}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${sakana.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${sakana.id}" />"><c:out
																		value="${sakana.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${sakana.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${sakana.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${sakana.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${sakana.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tamago" role="tabpanel"
								aria-labelledby="list-tamago-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>卵、牛乳、乳製品、パン、ジャム、スープ</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tamago" items="${categoryList_tamago}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tamago.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tamago.id}" />"><c:out
																		value="${tamago.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tamago.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tamago.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tamago.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tamago.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tofu" role="tabpanel"
								aria-labelledby="list-tofu-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tofu" items="${categoryList_tofu}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tofu.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tofu.id}" />"><c:out
																		value="${tofu.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tofu.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tofu.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tofu.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tofu.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kome" role="tabpanel"
								aria-labelledby="list-kome-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>米、餅、麺類</h3>

								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kome" items="${categoryList_kome}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kome.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kome.id}" />"><c:out
																		value="${kome.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kome.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kome.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kome.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kome.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="zitan" role="tabpanel"
								aria-labelledby="list-zitan-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>時短料理の素、チルド野菜</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="zitan" items="${categoryList_zitan}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${zitan.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${zitan.id}" />"><c:out
																		value="${zitan.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${zitan.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${zitan.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${zitan.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${zitan.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="retoruto" role="tabpanel"
								aria-labelledby="list-retoruto-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>レトルト、インスタント食品</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="retoruto" items="${categoryList_retoruto}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${retoruto.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${retoruto.id}" />"><c:out
																		value="${retoruto.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${retoruto.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${retoruto.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${retoruto.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${retoruto.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="reitou" role="tabpanel"
								aria-labelledby="list-reitou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>冷凍食品、冷凍食材</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="reitou" items="${categoryList_reitou}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${reitou.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${reitou.id}" />"><c:out
																		value="${reitou.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${reitou.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${reitou.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${reitou.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${reitou.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="cup" role="tabpanel"
								aria-labelledby="list-cup-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="cup" items="${categoryList_cup}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${cup.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${cup.id}" />"><c:out
																		value="${cup.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${cup.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${cup.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${cup.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${cup.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="okasi" role="tabpanel"
								aria-labelledby="list-okasi-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>お菓子、アイス、デザート、製菓材料</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="okasi" items="${categoryList_okasi}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${okasi.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${okasi.id}" />"><c:out
																		value="${okasi.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${okasi.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${okasi.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${okasi.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${okasi.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tyoumi" role="tabpanel"
								aria-labelledby="list-tyoumi-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>調味料、ルー、だし、スープの素、油</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tyoumi" items="${categoryList_tyoumi}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tyoumi.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tyoumi.id}" />"><c:out
																		value="${tyoumi.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tyoumi.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tyoumi.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tyoumi.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tyoumi.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="mizu" role="tabpanel"
								aria-labelledby="list-mizu-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>水、飲料</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="mizu" items="${categoryList_mizu}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${mizu.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${mizu.id}" />"><c:out
																		value="${mizu.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${mizu.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${mizu.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${mizu.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${mizu.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="sake" role="tabpanel"
								aria-labelledby="list-sake-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>お酒</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="sake" items="${categoryList_sake}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${sake.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${sake.id}" />"><c:out
																		value="${sake.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${sake.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${sake.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${sake.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${sake.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="nitiyou" role="tabpanel"
								aria-labelledby="list-nitiyou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>日用品、ホーム＆キッチン、ペット、文房具</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="nitiyou" items="${categoryList_nitiyou}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${nitiyou.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${nitiyou.id}" />"><c:out
																		value="${nitiyou.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${nitiyou.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${nitiyou.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${nitiyou.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${nitiyou.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kusuri" role="tabpanel"
								aria-labelledby="list-kusuri-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>お薬、健康、美容、介護</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kusuri" items="${categoryList_kusuri}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kusuri.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kusuri.id}" />"><c:out
																		value="${kusuri.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kusuri.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kusuri.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kusuri.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kusuri.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="baby" role="tabpanel"
								aria-labelledby="list-baby-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>ベビー、キッズ</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="baby" items="${categoryList_baby}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${baby.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${baby.id}" />"><c:out
																		value="${baby.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${baby.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${baby.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${baby.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${baby.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kenkou" role="tabpanel"
								aria-labelledby="list-kenkou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>健康食品</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kenkou" items="${categoryList_kenkou}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kenkou.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kenkou.id}" />"><c:out
																		value="${kenkou.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kenkou.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kenkou.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kenkou.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kenkou.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- ここからカテゴリごとのランキング -->
			<div class="tab_contents" id="menu02">

				<!-- サイドバー -->

				<div class="row" _msthidden="12">
					<div class="col-3 col-lg-2 tab_contents_sumaho" _msthidden="2">
						<!-- スマホ用カテゴリ要素 -->
						<p class="book_toggle_btn sumaho">
							<img src="./css/img/menu.png"><strong>ランキング一覧</strong>
						<p>
						<ul class="book_toggle">
							<div class="list-group" id="list-tab " role="tablist"
								_msthidden="2">
								<a class="list-group-item list-group-item-action active"
									id="list-home-list" data-bs-toggle="list" href="#list-home1"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1077">ランキング</a> <a
									class="list-group-item list-group-item-action"
									id="list-profile-list" data-bs-toggle="list"
									href="#list-profile1" role="tab" aria-controls="profile"
									_msttexthash="94315" _msthidden="1" _msthash="1078">野菜、果物</a> <a
									class="list-group-item list-group-item-action"
									id="list-messages-list" data-bs-toggle="list"
									href="#list-messages1" role="tab" aria-controls="messages"
									_msttexthash="113854" _msthidden="1" _msthash="1079">肉、ハム、ソーセージ</a>
								<a class="list-group-item list-group-item-action"
									id="list-settings-list" data-bs-toggle="list"
									href="#list-settings1" role="tab" aria-controls="settings"
									_msttexthash="117221" _msthidden="1" _msthash="1080">魚、刺身、海藻</a>
								<a class="list-group-item list-group-item-action"
									id="list-tamago-list" data-bs-toggle="list" href="#tamago1"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1081">卵、牛乳、乳製品、パン、ジャム、スープ</a> <a
									class="list-group-item list-group-item-action"
									id="list-tofu-list" data-bs-toggle="list" href="#tofu1"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1082">豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物</a> <a
									class="list-group-item list-group-item-action"
									id="list-kome-list" data-bs-toggle="list" href="#kome1"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1083">米、餅、麺類</a> <a
									class="list-group-item list-group-item-action"
									id="list-zitan-list" data-bs-toggle="list" href="#zitan1"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1084">時短料理の素、チルド野菜</a> <a
									class="list-group-item list-group-item-action"
									id="list-retoruto-list" data-bs-toggle="list" href="#retoruto1"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1085">レトルト、インスタント食品</a> <a
									class="list-group-item list-group-item-action"
									id="list-reitou-list" data-bs-toggle="list" href="#reitou1"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1086">冷凍食品、冷凍食材</a> <a
									class="list-group-item list-group-item-action"
									id="list-cup-list" data-bs-toggle="list" href="#cup1"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1087">カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮</a> <a
									class="list-group-item list-group-item-action"
									id="list-okasi-list" data-bs-toggle="list" href="#okasi1"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1088">お菓子、アイス、デザート、製菓材料</a> <a
									class="list-group-item list-group-item-action"
									id="list-tyoumi-list" data-bs-toggle="list" href="#tyoumi1"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1089">調味料、ルー、だし、スープの素、油</a> <a
									class="list-group-item list-group-item-action"
									id="list-mizu-list" data-bs-toggle="list" href="#mizu1"
									role="tab" aria-controls="home" _msttexthash="43979"
									_msthidden="1" _msthash="1090">水、飲料</a> <a
									class="list-group-item list-group-item-action"
									id="list-sake-list" data-bs-toggle="list" href="#sake1"
									role="tab" aria-controls="profile" _msttexthash="94315"
									_msthidden="1" _msthash="1091">お酒</a> <a
									class="list-group-item list-group-item-action"
									id="list-nitiyou-list" data-bs-toggle="list" href="#nitiyou1"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1092">日用品、ホーム＆キッチン、ペット、文房具</a> <a
									class="list-group-item list-group-item-action"
									id="list-kusuri-list" data-bs-toggle="list" href="#kusuri1"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1093">お薬、健康、美容、介護</a> <a
									class="list-group-item list-group-item-action"
									id="list-baby-list" data-bs-toggle="list" href="#baby1"
									role="tab" aria-controls="messages" _msttexthash="113854"
									_msthidden="1" _msthash="1094">ベビー、キッズ</a> <a
									class="list-group-item list-group-item-action"
									id="list-kenkou-list" data-bs-toggle="list" href="#kenkou1"
									role="tab" aria-controls="settings" _msttexthash="117221"
									_msthidden="1" _msthash="1080">健康食品</a>
							</div>
						</ul>
					</div>
					<!-- サイドバーここまで -->
					<div class="col-10 suma" _msthidden="12">
						<div class="tab-content" id="list-nav-tabContent" _msthidden="4">
							<div class="tab-pane fade show active" id="list-home1"
								role="tabpanel" aria-labelledby="list-home-list"
								_msttexthash="19236217" _msthidden="1" _msthash="1081">
								<!-- 仮のランキング画面 -->

								<h3>売り上げTOP５</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="rank" items="${itemList}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${rank.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${rank.id}" />"><c:out
																		value="${rank.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${rank.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${rank.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${rank.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${rank.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
								</section>

							</div>
							<!-- 仮のランキング画面ここまで -->

							<div class="tab-pane fade" id="list-profile1" role="tabpanel"
								aria-labelledby="list-profile-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>野菜、果物ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="yasa" items="${categoryList_yasa}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${yasa.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${yasa.id}" />"><c:out
																		value="${yasa.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${yasa.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${yasa.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${yasa.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${yasa.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="list-messages1" role="tabpanel"
								aria-labelledby="list-messages-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>肉、ハム、ソーセージランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="nik" items="${categoryList_nik}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${nik.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${nik.id}" />"><c:out
																		value="${nik.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${nik.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${nik.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${nik.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${nik.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="list-settings1" role="tabpanel"
								aria-labelledby="list-settings-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>魚、刺身、海藻ランキング</h3>

								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="sakan" items="${categoryList_sakan}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${sakan.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${sakan.id}" />"><c:out
																		value="${sakan.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${sakan.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${sakan.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${sakan.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${sakan.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tamago1" role="tabpanel"
								aria-labelledby="list-tamago-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>卵、牛乳、乳製品、パン、ジャム、スープランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tamag" items="${categoryList_tamag}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tamag.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tamag.id}" />"><c:out
																		value="${tamag.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tamag.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tamag.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tamag.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tamag.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tofu1" role="tabpanel"
								aria-labelledby="list-tofu-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tof" items="${categoryList_tof}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tof.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tof.id}" />"><c:out
																		value="${tof.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tof.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tof.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tof.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tof.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kome1" role="tabpanel"
								aria-labelledby="list-kome-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>米、餅、麺類ランキング</h3>

								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kom" items="${categoryList_kom}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kom.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kom.id}" />"><c:out
																		value="${kom.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kom.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kom.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kom.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kom.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="zitan1" role="tabpanel"
								aria-labelledby="list-zitan-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>時短料理の素、チルド野菜ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="zita" items="${categoryList_zita}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${zita.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${zita.id}" />"><c:out
																		value="${zita.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${zita.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${zita.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${zita.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${zita.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="retoruto1" role="tabpanel"
								aria-labelledby="list-retoruto-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>レトルト、インスタント食品ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="retorut" items="${categoryList_retorut}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${retorut.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${retorut.id}" />"><c:out
																		value="${retorut.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${retorut.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${retorut.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${retorut.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${retorut.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="reitou1" role="tabpanel"
								aria-labelledby="list-reitou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>冷凍食品、冷凍食材ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="reito" items="${categoryList_reito}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${reito.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${reito.id}" />"><c:out
																		value="${reito.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${reito.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${reito.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${reito.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${reito.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="cup1" role="tabpanel"
								aria-labelledby="list-cup-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="cu" items="${categoryList_cu}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${cu.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${cu.id}" />"><c:out
																		value="${cu.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${cu.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${cu.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${cu.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${cu.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="okasi1" role="tabpanel"
								aria-labelledby="list-okasi-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>お菓子、アイス、デザート、製菓材料ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="okas" items="${categoryList_okas}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${okas.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${okas.id}" />"><c:out
																		value="${okas.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${okas.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${okas.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${okas.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${okas.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="tyoumi1" role="tabpanel"
								aria-labelledby="list-tyoumi-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>調味料、ルー、だし、スープの素、油ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="tyoum" items="${categoryList_tyoum}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${tyoum.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${tyoum.id}" />"><c:out
																		value="${tyoum.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${tyoum.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${tyoum.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${tyoum.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${tyoum.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="mizu1" role="tabpanel"
								aria-labelledby="list-mizu-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>水、飲料ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="miz" items="${categoryList_miz}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${miz.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${miz.id}" />"><c:out
																		value="${miz.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${miz.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${miz.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${miz.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${miz.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="sake1" role="tabpanel"
								aria-labelledby="list-sake-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>お酒ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="sak" items="${categoryList_sak}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${sak.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${sak.id}" />"><c:out
																		value="${sak.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${sak.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${sak.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${sak.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${sak.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="nitiyou1" role="tabpanel"
								aria-labelledby="list-nitiyou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>日用品、ホーム＆キッチン、ペット、文房具ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="nitiyo" items="${categoryList_nitiyo}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${nitiyo.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${nitiyo.id}" />"><c:out
																		value="${nitiyo.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${nitiyo.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${nitiyo.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${nitiyo.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${nitiyo.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kusuri1" role="tabpanel"
								aria-labelledby="list-kusuri-list" _msttexthash="21262969"
								_msthidden="1" _msthash="1082">
								<h3>お薬、健康、美容、介護ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kusur" items="${categoryList_kusur}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kusur.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kusur.id}" />"><c:out
																		value="${kusur.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kusur.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kusur.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kusur.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kusur.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="baby1" role="tabpanel"
								aria-labelledby="list-baby-list" _msttexthash="15641613"
								_msthidden="1" _msthash="1083">
								<h3>ベビー、キッズランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="bab" items="${categoryList_bab}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${bab.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${bab.id}" />"><c:out
																		value="${bab.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${bab.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${bab.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${bab.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${bab.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>
							<div class="tab-pane fade" id="kenkou1" role="tabpanel"
								aria-labelledby="list-kenkou-list" _msttexthash="22758541"
								_msthidden="1" _msthash="1084">
								<h3>健康食品ランキング</h3>
								<section class="py-5">
									<div
										class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
										<c:forEach var="kenko" items="${categoryList_kenko}">
											<%
											int number = token.MakeRandomNumbers();
											%>
											<div class="col mb-5">
												<div class="card h-100 item_base">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/image/<c:out value="${kenko.image}" />"
														alt="...">
													<!-- Product details-->
													<div class="card-body p-4">
														<div class="text-center item_size">
															<!-- Product name-->
															<h5 class="fw-bolder">
																商品名：<a
																	href="/NAOE/ItemServlet?itemNumber=<c:out value="${kenko.id}" />"><c:out
																		value="${kenko.item}" /></a>
															</h5>
															<p>
																カテゴリー：
																<c:out value="${kenko.category}" />
															</p>
															<!-- Product price-->
															値段：
															<c:out value="${kenko.price }" />
															円
														</div>
													</div>
													<!-- Product actions-->
													<div
														class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
														<c:choose>
															<c:when test="${user.privilege != 'admin' }">
																<div class="text-center">
																	<form action="/NAOE/purchaseServlet" method="post">
																		<input type="hidden" name="itemNumber"
																			value="<c:out            value="${kenko.id}"/>">
																		<input type="hidden" name="access" value="shop">
																		<input type="hidden" name="token" value="<%=number%>">
																		<input class="form-control text-center me-3"
																			id="inputQuantity" type="hidden" value="1"
																			name="quantity">
																		<c:choose>
																			<c:when test="${kenko.stock > 1}">
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
																	<h6>管理者アカウントは購入できません。</h6>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</section>
							</div>

						</div>
					</div>
				</div>
			</div>




			<div class="tab_contents" id="menu03">
				<h3>お気に入り</h3>
				<c:if test="${favoriteList == null}">
				まだお気に入りはありません
				</c:if>
				<div
					class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-1 row-cols-xl-5 justify-content-center item_base1">
					<c:forEach var="favorite" items="${favoriteList}">
						<%
						int number = token.MakeRandomNumbers();
						%>
						<div class="col mb-5">
							<div class="card h-100 item_base">
								<img class="card-img-top"
									src="<%=request.getContextPath() %>/image/<c:out value="${favorite.image}" />"
									alt="...">
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center item_size">
										<!-- Product name-->
										<h5 class="fw-bolder">
											商品名：<a
												href="/NAOE/ItemServlet?itemNumber=<c:out value="${favorite.id}" />"><c:out
													value="${favorite.item}" /></a>
										</h5>
										<p>
											カテゴリー：
											<c:out value="${favorite.category}" />
										</p>
										<!-- Product price-->
										値段：
										<c:out value="${favorite.price }" />
										円
									</div>
								</div>

								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
									<c:choose>
										<c:when test="${user.privilege != 'admin' }">
											<div class="text-center">
												<form action="/NAOE/purchaseServlet" method="post">
													<input type="hidden" name="itemNumber"
														value="<c:out            value="${favorite.id}"/>">
													<input type="hidden" name="access" value="shop"> <input
														type="hidden" name="token" value="<%=number%>"> <input
														class="form-control text-center me-3" id="inputQuantity"
														type="hidden" value="1" name="quantity">
													<c:choose>
														<c:when test="${favorite.stock > 1}">
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
												<h6>管理者アカウントは購入できません。</h6>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<jsp:include page="/footer.jsp" />
		</div>
	</div>
	<!-- レスポンシブ用タブjquery -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".book_toggle_btn").on("click", function() {
				$(this).nextAll('.book_toggle:first').slideToggle();
			});
		});
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/script.js"></script>
	<div class="pagetop">↑</div>
</body>
</html>
