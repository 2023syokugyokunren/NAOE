<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>アカウント作成</title>
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

							<form class="mb-3 mt-md-4" action="/NAOE/RegisterServlet"
								method="post">

								<h2 class="fw-bold mb-2 text-uppercase ">アカウントを作成</h2>
								<p class=" mb-5"></p>
								<div class="mb-3">
									<label for="userId" class="form-label ">ユーザーID</label> <input
										class="form-control" placeholder="NaoeTaro"
										name="userid" required pattern="^[\w\d]{4,10}$">
									<c:if test="${errorMsgId != null}">
										<br>
										<div class="alert alert-danger" role="alert">
											<c:out value="${errorMsgId}"></c:out>
										</div>
									</c:if>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label ">メールアドレス</label> 
									<input type="email" class="form-control" placeholder="name@example.com" name="mail" required>
								</div>
								<div class="mb-3">
									<label for="Name" class="form-label ">お名前</label> 
									<input class="form-control" placeholder="尚江太郎" name="username"required minlength="4" maxlength="10">
									<c:if test="${errorMsgName != null}">
										<br>
										<div class="alert alert-danger" role="alert">
											<c:out value="${errorMsgName}"></c:out>
										</div>
									</c:if>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label ">Password</label> 
									<input type="password" class="form-control" id="password" placeholder="*******" name="pass" required minlength="4" maxlength="11">
									<c:if test="${errorMsgPass != null}">
										<br>
										<div class="alert alert-danger" role="alert">
											<c:out value="${errorMsgPass}"></c:out>
										</div>
									</c:if>
								</div>
								<!-- <p class="small">
									<a class="text-primary" href="forget-password.html">Forgot
										password?</a>
								</p> -->
								<br>
								<div class="d-grid">
									<button class="btn btn-outline-dark" type="submit">確認</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% session.removeAttribute("errorMsgId"); %>
	<% session.removeAttribute("errorMsgName"); %>
	<% session.removeAttribute("errorMsgPass"); %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>