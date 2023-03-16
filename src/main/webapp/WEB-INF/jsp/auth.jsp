<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>本人確認</title>

<style>
body {
	background-image: url(<%=request.getContextPath()%>/css/img/image1.jpeg);
	background-size: cover;
}
</style>

</head>
<body>
	<div class="vh-100 d-flex justify-content-center align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8 col-lg-6">
					<div class="border border-3 border-primary"></div>
					<div class="card bg-white">
						<div class="card-body p-5">
							<c:if test="${errorMsg != null}">
								<div class="alert alert-danger" role="alert">
									<c:out value="${errorMsg}"></c:out>
								</div>
							</c:if>
							<form class="mb-3 mt-md-4" action="/NAOE/AuthServlet"
								method="get">

								<h2 class="fw-bold mb-2 text-uppercase ">本人確認</h2>
								<p class=" mb-5">本人確認のためパスワードを入力してください</p>
								<div class="mb-3">
									<label for="id" class="form-label ">ユーザーID</label> <input
										class="form-control" value="<c:out value='${user.user_Id}'></c:out>" name="userId" readonly>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label ">Password</label> <input
										type="password" class="form-control"
										name="pass">
								</div>
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
	<% session.removeAttribute("errorMsg");%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>