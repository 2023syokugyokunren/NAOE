<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String filename=(String)request.getAttribute("filename");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理画面(確認)</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin.css">
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
		<h1>確認画面</h1>

		<div class="card">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">商品名:${items.item}<br></li>
				<li class="list-group-item">値段:${items.price }<br></li>
				<li class="list-group-item"> カテゴリー:${items.category }<br></li>
				<li class="list-group-item">在庫:${items.stock }<br></li>
				<li class="list-group-item">画像:${items.image }<br></li>
				<li class="list-group-item">説明:${items.discription }<br></li>
				
			</ul>
		</div>

		<button type="button" class="btn btn-danger" onclick="location.href='/NAOE/ConfirmServlet?action=done';">登録</button>
		<br>
		<button type="button" class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet';">戻る</button>
	
</body>
</html>