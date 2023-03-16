<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<!-- 共通ヘッダー -->
<header>

	<!-- ハンバーガーメニュー部分 -->
	<div class="drawer">
		<!-- ハンバーガーメニューの表示・非表示を切り替えるチェックボックス -->
		<input type="checkbox" id="drawer-check" class="drawer-hidden">

		<!-- ハンバーガーアイコン -->
		<label for="drawer-check" class="drawer-open"><span></span></label>
		<h3>NAOE SHOP</h3>
		<!-- 追加：メニューを閉じるための要素 -->
		<label for="drawer-check" class="drawer-close"></label>
		<div class="header-right">
			<c:if test="${user.user_Id != null}">
				<c:out value="ようこそ、${user.user_Id}さん" />
				
				<!-- カートの数字のカウントアップ -->
				<c:if test="${user.privilege != 'admin' }">
				<button type="button" class="btn btn-outline-dark" onclick="location.href='/NAOE/purchaseServlet';">
					<i class="bi-cart-fill"></i> Cart 
					<c:choose>
						<c:when test="${cart == null}">
							<span class="badge bg-dark text-white rounded-pill">0</span>
						</c:when>
						<c:otherwise>
							<span class="badge bg-dark text-white rounded-pill"><c:out value="${cart.getThingsInCart().size()}"></c:out></span>
						</c:otherwise>
					</c:choose>
				</button>
				</c:if>
			</c:if>
			</div>
			<div class="gest">
				<c:if test="${user.user_Id == null}">
					<c:out value="ようこそ、ゲストさん" />
					<br>
					<c:out value="ログイン・会員登録は" />
					<a href="LoginServlet">こちら</a>
				</c:if>
			</div>
			
		<!-- メニュー -->
		<nav class="drawer-content">
			<ul class="drawer-list">
				<li class="drawer-item"><a href="NaoeServlet">トップ</a></li>

				<!-- ログインしていない状態の場合表示 -->
				<c:if test="${user.user_Id == null}">
					<li class="drawer-item"><a href="LoginServlet">ログイン</a></li>
					<li class="drawer-item"><a href="RegisterServlet">登録</a></li>
				</c:if>

				<!-- ログイン状態の場合表示 -->
				<c:if test="${user.user_Id != null}">
					<li class="drawer-item"><a href="purchaseServlet">カート</a></li>
					<li class="drawer-item"><a href="UserInfoServlet">アカウントページ</a>
					</li>
					<li class="drawer-item"><a href="LogoutServlet">ログアウト</a></li>
				<!-- 仮で消しています	<li class="drawer-item"><a href="ByHistoryServlet">購入履歴</a></li> -->
				</c:if>

				<!-- 管理者アカウントだった場合表示 -->
				<c:if test="${user.privilege == 'admin'}">
					<li class="drawer-item"><a href="AdminServlet">管理者画面へ</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</header>
