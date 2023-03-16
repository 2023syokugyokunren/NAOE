<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,model.Cart , java.text.NumberFormat, model.CartControlLogic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Cart cart = (Cart) session.getAttribute("cart"); %>
<% NumberFormat ni = NumberFormat.getNumberInstance(); %>
<% CartControlLogic delToken = new CartControlLogic(); %>
<% int total = 0; %>
<%
int carttotal = 0;
if (cart != null ){
	if(cart.getQuantity() != null){
		ArrayList<Integer> quantity = cart.getQuantity();
		for(Integer num : quantity){
			carttotal += num;
		}
	}
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>カートの中身</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="bg-light">
	
	<div class="container-fluid pt-4 pb-4 ps-5 pe-5">
	<%if (carttotal != 0){ %>
	<p class="h3">カートに商品を追加しました</p>
	<%} %>
		<div class="row">
			<div class="col-md-7 m-0">
				<c:if test="${cart != null }">
						<%
						for (int i = 0; i < cart.getThingsInCart().size(); i += 1) {
						%>
					<div class="row  border-bottom">
						<div class="col-md-6 h-75 m-0">
							<img
								src="<%=request.getContextPath()%>/image/<%=cart.getThingsInCart().get(i).getImage()%>"
								class="img-fluid w-50 h-50" alt="商品写真">
						</div>
						<div class="col-md-6 h-75 col-form-label m-0">
							<p>
								<%=cart.getThingsInCart().get(i).getItem()%>
							</p>
							<p>
								<%=cart.getQuantity().get(i)%>
								個注文中
							</p>
							<p class="text-danger">
								合計金額:
								<%=ni.format(cart.getThingsInCart().get(i).getPrice()*cart.getQuantity().get(i))%>
								円
							</p>
							<form action="/NAOE/changeCartServlet" method="get">
								<input type="hidden" name="cartNumber" value="<%=i%>">
								<input type="hidden" name="delToken"
									value="<%=delToken.MakeRandomNumbers()%>"> <input
									class="" type="submit" value="削除する">
							</form>
						</div>
						<%
						total += cart.getQuantity().get(i);
						%>
					</div>
					<%
					}
					%>
				</c:if>
				<%
				if (total == 0) {
				%>
				<div>
					<p>カートは空です。</p>
				</div>
				<%
				}
				%>
			</div>
			<div class="col-md-5 m-0">
				<%if(cart != null) {%>
				<%if(cart.getPricetotal() <= 1000000 && cart.getPricetotal() >= 0) {%>
				<div class="border  p-2 bg-white">
					<p class="border-bottom h-4">
						ショッピングカートには
						<%=total%>
						個の商品が入っています
					</p>
					<p class="h3 mb-3">
						<c:choose>
							<c:when test="${cart != null}">
						合計金額: <span class="text-danger"> <%=ni.format(cart.getPricetotal())%>
								</span>
							</c:when>
							<c:otherwise>
								<span class="text-danger">0</span>
							</c:otherwise>
						</c:choose>
						円
					</p>
					<%if(total !=0) { %>
					<div class="row">
						<form class="col-md-6 text-center"
							action="/NAOE/BuyConfirmServlet" method="get">
							<input class="btn btn-danger m-2" type="submit" value="購入手続きへ進む">
						</form>
						<form class="col-md-6 text-center" action="/NAOE/NaoeServlet"
							method="get">
							<input class="btn btn-primary m-2" type="submit" value="商品一覧へ戻る">
						</form>
					</div>
					<%} else { %>
						<div class=" text-center">
						<form class="" action="/NAOE/NaoeServlet"
							method="get">
							<input class="btn btn-primary text-center m-2" type="submit" value="商品一覧へ戻る">
						</form>
						</div>
					<%} %>
					<%} else {%>
					<p>一度に購入できる限度額を超えています。カート内商品を削除ください。</p>
				</div>
					<%} %>
					<%} else {%>
					<div class="border  p-2 mark mr-3">
					<p class="border-bottom h-4">
						ショッピングカートには
						<%=total%>
						個の商品が入っています
					</p>
					<p class="h3 mb-3">
						合計金額:
						<c:choose>
							<c:when test="${cart != null}">
							 <span class="text-danger"> <%=ni.format(cart.getPricetotal())%>
								</span>
							</c:when>
							<c:otherwise>
								<span class="text-danger">0</span>
							</c:otherwise>
						</c:choose>
						円
					</p>
					<div class="">
						<form class="text-center" action="/NAOE/NaoeServlet"
							method="get">
							<input class="btn btn-primary m-2" type="submit" value="商品一覧へ戻る">
						</form>
					</div>
					<%} %>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>