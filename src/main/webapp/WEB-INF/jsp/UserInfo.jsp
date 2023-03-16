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
<title>ユーザー情報/チャージ</title>
</head>
<body>
<div class="wrapper">
<jsp:include page="/header_shop.jsp"/>
<!-- ピル部分 -->
<div class="nnv">
<ul class="nav nav-pills mb-3  " id="pills-tab" role="tablist" >
  <li class="nav-item" role="presentation">
    <button type="button" class="text-nowrap nnv nav-link active"  id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">ユーザー情報</button>
  </li>
  <li class="nav-item" role="presentation">
    <button type="button" class="text-nowrap nnv nav-link " id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">ポイントチャージ</button>
  </li>
  <li class="nav-item" role="presentation">
    <button type="button" class="text-nowrap nnv nav-link"  id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" >住所登録/変更</button>
  </li>

</ul>
</div>

<!-- パネル部分 -->
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">

    <%--ユーザー情報 --%>

<div class="ad">
<table class="table table-striped table table-bordered">
<tr>
<td colspan="2"  class="table-success">
	<h1>ユーザー情報</h1>
	</td>

	</tr>



<tr>
			<th>ユーザーID</th>
			<td><c:out value="${user.user_Id }"></c:out></td>
			</tr>
			<tr>
			<th>
			名前</th>
			<td><c:out value=" ${user.user_Name }"></c:out></td>
			</tr>
			<tr>
			<th>メール</th>
			<td><c:out value="${user.mail }"></c:out></td>
			</tr>

			<tr>
			<th>ポイント残高</th>

			<td>${userMoney }</td>


			<% session.removeAttribute("userMoney"); %>
			</tr>

		<c:if test="${userInfo.size()==0 }">
		<tr>
		<td colspan="3">
		詳細情報(郵便番号・住所・電話番号)が登録されていません
		</td>
		</tr>
		</c:if>


		<c:forEach var="info" items="${userInfo }">

				<tr>
				<th>郵便番号</th>
				<td><c:out value="${info.post_Code }" /></td>
				</tr>

				<tr>
				<th>住所</th>
				<td><c:out value="${info.address }" /></td>
				</tr>

				<tr>
				<th>電話番号</th>
				<td><c:out value="${info.tel }" /></td>
				</tr>

		</c:forEach>

		<tr>


		<td class="text-nowrap" colspan="2"><a href="/NAOE/UserInfoServlet?path=pass">ユーザー情報の変更</a></td>



		</tr>
		</table>

</div>


  </div>
  <div class="tab-pane fade " id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
   <%--チャージ画面 --%>
   <div class="ad">
<form action="ChargeMoneyServlet" method="post">

		<input type="hidden" value="${user.id }" name="id" class="kesu">
		<table class="table table-striped table table-bordered">

			<tr>
			<td   class="table-danger">
	<h1>NAOEポイントチャージ</h1>
	</td>
			</tr>

			<tr>
			<td>
				<input type="radio" name="money" value="1000" id="radio1"> <label for="radio1"
					class="form-check-label" for="point">1000ポイント</label>
					</td>
			</tr>
			<tr>
			<td>
				<input type="radio" name="money" value="2000" id="radio2"> <label for="radio2"
					class="form-check-label" for="point">2000ポイント</label>
			</td>
			</tr>
			<tr>
			<td>
				<input type="radio" name="money" value="3000" id="radio3"> <label for="radio3"
					class="form-check-label" for="point">3000ポイント</label>
			</td>
			</tr>
			<tr>
			<td>
				<input type="radio" name="money" value="4000" id="radio4"> <label for="radio4"
					class="form-check-label" for="point">4000ポイント</label>
			</td>
			</tr>
			<tr>
			<td>
				<input type="radio" name="money" value="5000" id="radio5"> <label for="radio5"
					class="form-check-label" for="point">5000ポイント</label>
			</td>
			</tr>


</table>
<div class="bota">
		<input type="submit" value="チャージする">
		</div>


	</form>



  </div>
  </div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
  <div class="ad">

<c:choose>
<c:when test="${userInfoList.size()==0 }">
<form action="/NAOE/UserInfoServlet" method="post">
	<input type="hidden" name="id" value="<c:out value="${loginConf.id }"></c:out>">
<table class="table table-striped table table-bordered">

	<tr>
	<td colspan="2" class="table-secondary"><h1>住所登録・変更</h1></td>
	</tr>
	<tr>
	<th>郵便番号</th>
	<td><input type="text" class="txt" name="post_Code" class="txt"  pattern="\d{7}" title="ハイフンなし数字7文字" placeholder="1235678"  required width="100%"></td>
	</tr>

	<tr>
	<th>お届け先住所</th>
	<td><input type="text" class="txt" name="address" placeholder="岐阜市--0丁目0-0" required></td>
	</tr>

	<tr>
	<th>電話番号</th>
	<td><input type="text" class="txt" name="tel" pattern="\d{11}" title="ハイフンなし数字11文字" placeholder="01234567890" required></td>
	</tr>


	</table>
	<input type="submit" value="送信">
</form>
</c:when>
<c:otherwise>
<form action="/NAOE/UserInfoServlet" method="post">
<c:forEach var="loginConf" items="${userInfoList}">
	<input type="hidden" name="id" value="<c:out value="${loginConf.id }"></c:out>">
	<table class="table table-striped table table-bordered">

	<tr>
	<td colspan="2" class="table-secondary"><h1>住所登録・変更</h1></td>
	</tr>

	<tr>
	<th>郵便番号</th>
	<td><input type="text" class="txt" name="post_Code" value="<c:out value="${loginConf.post_Code}" />"  placeholder="1235678" pattern="^[1-9][0-9]{6}" title="ハイフンなし数字7文字で入力してください。最初の数字が0の地域は配送ができません" required></td>

	</tr>

	<tr>
	<th>お届け先住所</th>
	<td><input type="text" class="txt" name="address" value="<c:out value="${loginConf.address}" />" placeholder="岐阜県岐阜市--0丁目0-0"  title="岐阜県岐阜市--0丁目0-0のように入力してください"  required></td>
	</tr>

	<tr>
	<th>電話番号</th>
	<td><input type="text" class="txt" name="tel" value="<c:out value="${loginConf.tel}" />" placeholder="01234567890" pattern="\d{11}" title="ハイフンなし数字11文字" required></td>
	</tr>

	</table>
</c:forEach>
<input type="submit" value="登録/変更">
</form>
</c:otherwise>
</c:choose>

  </div>
</div>


</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/script.js">const triggerTabList = document.querySelectorAll('#myTab button')
	triggerTabList.forEach(triggerEl => {
		  const tabTrigger = new bootstrap.Tab(triggerEl)

		  triggerEl.addEventListener('click', event => {
		    event.preventDefault()
		    tabTrigger.show()
		  })
		})</script>
		<jsp:include page="/footer.jsp" />
		</div>
</body>
</html>