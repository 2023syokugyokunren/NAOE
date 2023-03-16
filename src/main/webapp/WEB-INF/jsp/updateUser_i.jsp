<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/script/script.js"></script>
<link href="css/boostrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/userInfostyle.css">
<title>ユーザー情報変更画面</title>
</head>
<body>
<div class="wrapper">
<jsp:include page="/header_shop.jsp"/>

<div class="ad">
<div id="qq">
<form action="/NAOE/AuthServlet" method="post">

<table class="table table-striped table table-bordered ti">

<tr>
<td colspan="2" class="table-info"><h1>ユーザー情報変更画面</h1></td>
</tr>

<tr>
<th>ユーザーID</th>
<td><input type="text" value="${user.user_Id }" class="txt" name="user_Id" placeholder="NaoeTaro" pattern="^[a-zA-Z]{4,10}" title="ローマ字のみ4文字以上10文字以下" required></td>
</tr>

<tr>
<th>ユーザー名</th>
<td><input type="text" value="${user.user_Name }" class="txt" name="userName" placeholder="尚江太郎" pattern=".{4,11}"  title="4文字以上11文字以下" required></td>
</tr>

<tr>
<th>パスワード</th>
<td><input type="password" class="txt"  name="pass" value="${user.pass }" placeholder="*******" pattern=".{4,10}" title="4文字以上10文字以下" required></td>
</tr>
<tr>
<th>メールアドレス</th>
<td><input type="email" value="${user.mail }" class="txt" placeholder="name@example.com" name="mail" required></td>
</tr>
<tr>
<td colspan="2">
<div class="button004"><a href="/NAOE/UserDeleteServlet?id=${user.user_Id }">退会はこちらから</a></div>
</td>
</tr>

</table>
<input type="hidden" value="${user.privilege }" name="privilege">
<input type="hidden" value="${user.id }" name="id">
<div class="taikai">

</div>
<input type="submit" value="変更する">
</form>
</div>
</div>
<jsp:include page="/footer.jsp" />
		</div>
</body>
</html>