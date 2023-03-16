<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.TemporaryItem" %>
<% TemporaryItem iinfo=(TemporaryItem) session.getAttribute("iinfo"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>削除画面</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<style>
		.container {
			display: flex;
			flex-direction: column;
			align-items: center;
			margin-top: 50px;
		}

		.card {
		 width: 400px;
      margin: 0 auto; /* 中央寄せ */
			max-width: 500px;
		}
		.btn {
      padding: 10px 40px; /* 上下10px, 左右20pxの余白を設定 */
      font-size: 16px; /* フォントサイズを16pxに設定 */
      margin:10px;
    }
		
	</style>
</head>
<body>
	<div class="container">
		<h1>削除画面</h1>

		<div class="card">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">商品名:<%= iinfo.getItem() %><br></li>
				<li class="list-group-item">値段:<%= iinfo.getPrice() %><br></li>
				<li class="list-group-item">カテゴリ:<%= iinfo.getCategory() %><br></li>
				<li class="list-group-item">在庫:<%= iinfo.getStock() %><br></li>
				<li class="list-group-item">画像:<%= iinfo.getImage() %><br></li>
				<li class="list-group-item">説明:<%= iinfo.getDiscription() %><br></li>
				<li class="list-group-item">売上:<%= iinfo.getOrder() %><br></li>
			</ul>
		</div>

		<button type="button" class="btn btn-danger" onclick="location.href='/NAOE/DeleteServlet?id=<c:out value="${iinfo.id}" />';">削除</button>
		<br>
		<button type="button" class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet';">戻る</button>
	</div>
</body>
</html>