<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-41R9V7S86H1v2V7KcMI8T2T7ie+TIfbKPhawTc8mxX9n1lzZ+rgvZJjPCbsC8Q2zux+TgCJjzGeWSDy8mX7+dA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>管理画面(追加)</title>

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
      /* 中央寄せ */
			max-width: 500px;
		}
		.btn {
      padding: 10px 40px; /* 上下10px, 左右20pxの余白を設定 */
      font-size: 16px; /* フォントサイズを16pxに設定 */
      margin:10px;
      margin: 0 auto;
    }
		
	</style>
</head>
<body>
	<div class="container">

	<h1>商品追加</h1>
		<form action="/NAOE/ConfirmServlet" method="post"
			enctype="multipart/form-data">


			<div class="card">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">商品名:<input type="text" name="item"
						maxlength="50" required><br>
					</li>
					<li class="list-group-item">値段:<input type="number" name="price" required><br></li>
					<li class="list-group-item">カテゴリ: <select name="category"
						size="1" style="width: 250px;">
							<c:forEach var="category" items="${category }">
								<option value="${category.category_Id }"><c:out
										value="${category.category_Name }"></c:out></option>
							</c:forEach>
					</select></li>
					<li class="list-group-item">在庫:<input type="number"
						name="stock" min="0" value="1" required><br>
					</li>
					<li class="list-group-item"><label for="formFile"
						class="form-label">画像</label> <input class="form-control"
						type="file" id="formFile" name="image" required> <br></li>
					<li class="list-group-item">説明:<input type="text"
						name="discription" maxlength="200" required><br>
					</li>
				</ul>
			</div>
			<div class="d-flex justify-content-center">
				<input class="form-control btn btn-primary" type="submit" value="確認">
			</div>

		</form>
		<br>
		<button type="button"  class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet';">戻る</button>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>