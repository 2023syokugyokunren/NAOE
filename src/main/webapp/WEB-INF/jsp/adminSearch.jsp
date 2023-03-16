<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-41R9V7S86H1v2V7KcMI8T2T7ie+TIfbKPhawTc8mxX9n1lzZ+rgvZJjPCbsC8Q2zux+TgCJjzGeWSDy8mX7+dA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>管理画面</title>
<style>
    table {
        width: 100%;
        table-layout: fixed;
    }
     th, td {
        white-space: normal;
        word-break: break-all;
    }
     th:nth-child(5), td:nth-child(5) {
        width: 30%; /* 列の幅を指定 */
    }
     th:nth-child(10), td:nth-child(10) {
        width: 15%; /* 列の幅を指定 */
    }
     th:nth-child(2), td:nth-child(2) {
        width: 12%; /* 列の幅を指定 */
    }
     th:nth-child(4), td:nth-child(4) {
        width: 10%; /* 列の幅を指定 */
    }
     th:nth-child(9), td:nth-child(9) {
        width: 7%; /* 列の幅を指定 */
    }
</style>


<script>
function showTable(tableId) {
	
  var tables = document.getElementsByTagName('tbody');
  
  for (var i = 0; i < tables.length; i++) {
    if (tables[i].id === tableId) {
      tables[i].style.display = '';
      
    } else {
        
      tables[i].style.display = 'none';
    }
  }
}
</script>

<script>
	document.getElementById('table1').style.display = '';
</script>

</head>

<body>

<header>
    <div class="px-3 py-2 bg-dark text-white">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        	<p class="h1">管理検索画面</p>
        	
        </div>
      </div>
    </div>
    <div class="px-3 py-2 border-bottom mb-3">
      <div class="container d-flex flex-wrap justify-content-center">
        <form action="/NAOE/AdminSearchServlet" method="post" class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
						<div class="search royalblue">
							<select name="hardness" class="select">
								<option value="">カテゴリ</option>
								<c:forEach var="category" items="${category }">
									<option value="${category.category_Id }"><c:out
											value="${category.category_Name }"></c:out></option>
								</c:forEach>
							</select> 
							<input type="search" class="form-control" placeholder="Search..."name="word" aria-label="Search">
							<button class="btn btn-primary"type="submit">検索</button>
							
						</div>
        </form>
       <div class="fixed-bottom">
  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    <div class="text-center">
    <div class="position-relative">
  <div class="position-absolute top-0 start-0"></div>
  <div class="position-absolute top-0 end-0"></div>
  <div class="position-absolute top-50 start-50"></div>
  <div class="position-absolute bottom-50 end-50"></div>
  <div class="position-absolute bottom-0 start-0"></div>
  <div class="position-absolute bottom-0 end-0"><a class="btn btn-primary" href="#">画面top</a></div>
</div>
</div>
       </div>
       </div>

        <div class="text-end"> 
        <button type="button" class="btn btn btn-secondary" onclick="location.href='/NAOE/AdminServlet';">一覧へ戻る</button>
        <button type="button" class="btn btn btn-secondary" onclick="location.href='/NAOE/NaoeServlet';">TOP戻る</button>
          <!-- <button type="button" class="btn btn-light text-dark me-2">Login</button> -->
          <button type="button" class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet?action=add';">商品追加</button>
        </div>
      </div>
    </div>
</header>

<div class="container">





<table class="table table-striped" id="table1">
<thead  class="sticky-top " style="background-color: #4682b4; color: white;">
	<tr>
		<th scope="col">詳細</th>
		<th scope="col">名前</th>
		<th scope="col">値段</th>
		<th scope="col">カテゴリー</th>
		<th scope="col">概要</th>
		<th scope="col">在庫</th>
		<th scope="col">ID</th>
		<th scope="col">売上</th>
		<th scope="col">登録者</th>
		<th scope="col">変更・削除</th>
	</tr>
</thead>
<c:set var="total" value="0" />
	
<!-- 商品をすべて表示 -->
<tbody id="table1">

	<c:forEach var="item" items="${search}">
	<c:set var="total" value="1" />
	
		<tr>
			<!-- <td><img src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
			<td><a href="/NAOE/ItemServlet?itemNumber=<c:out value="${item.id}" />">詳細表示</a></td>
			<td><c:out value="${item.item}" /></td>
			<td><c:out value="${item.price}" /></td>
			<td><c:out value="${item.category}" /></td>
			<td><c:out value="${item.discription}" /></td>
			<td><c:out value="${item.stock}" /></td>
			<td><c:out value="${item.id}" /></td>
			<td><c:out value="${item.order}" /></td>
			<td><c:out value="${item.registerUser}" /></td>
			<td>
			 <c:if test="${user.user_Name == item.registerUser}">
				<div class="btn-group">
				  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				   	変更・削除
				  </button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="/NAOE/ChangeItemServlet?id=<c:out value="${item.id}" />">変更</a></li>
				    <li><a class="dropdown-item" href="/NAOE/DeleteConfimServlet?id=<c:out value="${item.id}" />">削除</a></li>
				  </ul>
				</div>
			</c:if>
			<c:if test="${user.user_Name != item.registerUser}">
				<div class="btn-group">
				  <button type="button" class="btn btn btn-secondary dropdown-toggle disabled" data-bs-toggle="dropdown" aria-expanded="false"> <!-- disabledクラスを追加 -->
				    変更・削除
				  </button>
				  
				</div>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</tbody>


</table>
</div>

<c:if test="${total==0}">
		<div class="alert alert-danger alert-dismissible fade show"role="alert">
			<strong>一致する商品はありませんでした</strong>
		</div>
	</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
-->
<% session.removeAttribute("Search"); %>
</body>
</html>