<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>チャージ完了</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/userInfostyle.css">
<style>

body {
	background-image: url(<%=request.getContextPath()%>/css/img/image1.jpeg);
	background-size: cover;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="vh-90 d-flex justify-content-center align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-11 col-md-7 col-lg-6">
					<div class="border border-3  border-success"></div>
					<div class="card bg-white">
						<div class="card-body p-5">

							<div class="mb-3 mt-md-4">
							<div class="point">
							</div>
								<h2 class="fw-bold mb-2 text-uppercase ">ポイントチャージ完了</h2>
								<p >「<c:out value="${money}"></c:out>」NAOEポイントのチャージが完了しました<br>
								NAOEポイントはアカウントページから確認できます</p>


								<a class="pointb" href="UserInfoServlet">アカウントページへ</a>
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
