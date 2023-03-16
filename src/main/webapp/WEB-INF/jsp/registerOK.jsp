<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>NAOE 登録完了</title>
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
				<div class="col-12 col-md-8 col-lg-6">
					<div class="border border-3 border-primary"></div>
					<div class="card bg-white">
						<div class="card-body p-5">
	
							<div class="mb-3 mt-md-4">
								<h2 class="fw-bold mb-2 text-uppercase ">登録完了</h2>
								<p class=" mb-5">NAOEへようこそ</p>
								<a href="/NAOE/LoginServlet"
										class="text-primary fw-bold">ログインへ</a>
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