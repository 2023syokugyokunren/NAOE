<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>登録確認</title>
<style>
body {
	background-image: url(<%=request.getContextPath()%>/css/img/image1.jpeg);
	background-size: cover;
	margin-top: 25px;
	margin-bottom: 25px;
}
</style>

</head>
<body>
	<div class="vh-90 d-flex justify-content-center align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8 col-lg-6">
					<div class="border border-3 border-primary"></div>
					<div class="card bg-white">
						<div class="card-body p-5">

							<div class="mb-3 mt-md-4">
								<h2 class="fw-bold mb-2 text-uppercase ">確認画面</h2>
								<p class=" mb-5">以下の内容で登録します</p>
								<div class="mb-3">
									<label for="userId" class="form-label ">ユーザーID</label>
									<p><c:out value="${registerInfo.userid }"></c:out></p>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label ">メールアドレス</label>
									<p><c:out value="${registerInfo.mail}"></c:out></p>
								</div>
								<div class="mb-3">
									<label for="Name" class="form-label ">お名前</label>
									<p><c:out value="${registerInfo.username }"></c:out></p>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label ">Password</label>
									<p>表示されません</p>
								</div>
								<!-- <p class="small">
									<a class="text-primary" href="forget-password.html">Forgot
										password?</a>
								</p> -->
								<br>
								<div class="d-grid">
									<a class="btn btn-outline-dark" href="/NAOE/RegisterServlet?action=done">登録</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>