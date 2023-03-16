<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList,model.Cart" %>
 <% Cart cart = (Cart) session.getAttribute("cart"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>購入完了画面</title>
</head>
<body class="bg-light" >
<div class="container"">
	<%
	if (cart != null) {
	%>
	<div class="text-center ">
<p class="h3 mt-5">
購入完了しました!!
</p>
<p class="h3 mb-4 ">
商品到着までしばらくお待ちください!!
</p>
<div class="g-5">
	<form class="text-center" action="/NAOE/NaoeServlet" method="get">
		<input class="btn btn-primary  mb-5" type="submit" value="TOPへ戻る">
	</form>
	<p class="h5 mb-3">購入商品一覧</p>
	<div class="row text-center">
	<div class="col-4"></div>
	<ul class="list-group mb-3 col-4">
		<%
			for (int i = 0; i < cart.getThingsInCart().size(); i += 1) {
		%>
		<li class="list-group-item d-flex justify-content-between lh-sm">
		 <div class="container-fluid">
			<div class="row">
				<h6 class="my-0 col-9"><%=cart.getThingsInCart().get(i).getItem()%>
					&emsp;
					<%=cart.getQuantity().get(i)%>個
				</h6>
			 <span class="text-muted col-3"> <%=cart.getThingsInCart().get(i).getPrice() * cart.getQuantity().get(i)%>円
		</span>
			</div>
		 </div>
		</li>
		<%
		session.removeAttribute("cart");
			}
			%>
	</ul>
	<div class="col-4"></div>
	</div>
	</div>
<% } else {%>
<script>
	setTimeout("location.href='/NAOE/NaoeServlet'",1100);
</script>
<div class="c enter-block">
<p>処理済みのため、TOP画面に移動します。</p>
</div>
<%} %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>