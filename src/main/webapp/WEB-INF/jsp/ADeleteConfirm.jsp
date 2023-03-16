<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<title>削除確認画面</title>
</head>
<body>

<div class="vh-90 d-flex justify-content-center align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8 col-lg-7">
					<div class="border border-3 border-danger"></div>
					<div class="card bg-white">
						<div class="card-body p-5">

							<div class="mb-3 mt-md-4">
								<h2 class="fw-bold mb-2 text-uppercase ">本当に退会しますか？</h2>
								<p>
								＞退会処理を行うと登録済みのユーザー情報などすべての情報が削除されます
								</p>
								<p>
								＞退会後、現在ログイン中のユーザー情報にてログインできなくなります
								</p>

								<input type="checkbox" id="check-enable"><label for="check-enable">上記事項に同意の上退会手続きを行います。</label><br>
								<a href="/NAOE/UserDeleteServlet?action=${login.id }" class="anchorText">退会する</a>

								<br>
							</div>
							<p><a href="/NAOE/UserInfoServlet"
										class="text-primary ">ユーザー情報画面に戻る</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>