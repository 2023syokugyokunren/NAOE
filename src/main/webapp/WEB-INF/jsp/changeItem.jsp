<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.TemporaryItem" %>
<% TemporaryItem iinfo=(TemporaryItem) session.getAttribute("iinfo"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更画面</title>
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
		
		<h1>変更画面</h1>
	<form action="/NAOE/ChangeItemServlet" method="post" enctype="multipart/form-data">
		<div class="card">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">ID:<%=iinfo.getId()%><input type="hidden" name="id_c" value="<%=iinfo.getId()%>" required></li>
				<li class="list-group-item">商品名<br><input type="text" name="item" maxlength="50" value="<%=iinfo.getItem()%>" required><br> </li>
				<li class="list-group-item">値段<br><input type="number" name="price" value="<%=iinfo.getPrice()%>" required size="1">円<br></li>
				<li class="list-group-item">カテゴリ<br>
		<select class ="w-75" name="category" size="1">
			<c:forEach var="category" items="${category }">
				<c:choose>
					<c:when test="${iinfo.getCategory() == category.category_Name}">
						<option value="${category.category_Id }" selected>
							<c:out value="${category.category_Name }"></c:out>
						</option>
					</c:when>
					<c:otherwise>
						<option value="${category.category_Id }">
							<c:out value="${category.category_Name }"></c:out>
						</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select></li>
				<li class="list-group-item"> 在庫<br><input type="number" name="stock"min="0" value="<%=iinfo.getStock()%>" required style="font-size: 20px;">個<br> </li>
				<li class="list-group-item"> 
				
				<label for="formFile" class="form-label">画像<br></label>
<input class="form-control" type="file" id="formFile"name="image">
				<br> 
		 <img src="<%=request.getContextPath()%>/image/<%=iinfo.getImage()%>" class="img-thumbnail" alt="img-thumbnail">
		 </li>
				<li class="list-group-item">
				
				説明<br>
				<div class="form-floating">
				<textarea class="form-control" name="discription" maxlength="200" required rows="5"><%=iinfo.getDiscription()%></textarea><br> </div></li>
				<li class="list-group-item">売上<br><input type="text" name="sales" value="<%=iinfo.getOrder()%>" required><br><br></li>
			</ul>
		</div>
		<div class="d-flex justify-content-center">
  <input  class="form-control btn btn-primary" type="submit" value="変更する"  required>
</div>
	

</form>		
		<br>
		<button type="button"  class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet';">戻る</button>
</div>
</body>
</html>