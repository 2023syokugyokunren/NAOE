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
        width: 5%; /* 列の幅を指定 */
    }
    input{
    	padding:5px;
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
        	<p class="h1">管理画面</p>
        	
        </div>
      </div>
    </div>
    <!-- アナウンスセッション -->
    <c:if test="${successCategory != null }">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong>カテゴリーを追加しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<c:if test="${erorrCategory != null}">
			<div class="alert alert-danger  alert-dismissible fade show"
				role="alert">
				<strong>カテゴリーの追加に失敗しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		<c:if test="${successDelete != null }">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong>商品を削除しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<c:if test="${erorrDelete != null}">
			<div class="alert alert-danger  alert-dismissible fade show"
				role="alert">
				<strong>削除に失敗しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		 <c:if test="${ChangeOK != null }">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong>商品内容を変更しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<c:if test="${ChangeErorr != null}">
			<div class="alert alert-danger  alert-dismissible fade show"
				role="alert">
				<strong>商品内容の変更に失敗しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		 <c:if test="${successAdd != null }">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong>商品を追加しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		<c:if test="${erorrAdd != null}">
			<div class="alert alert-danger  alert-dismissible fade show"
				role="alert">
				<strong>商品の追加に失敗しました</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
		
		 <!-- アナウンスセッション　完 -->
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
							<button class="btn btn-primary" type="submit">検索</button>
							
						
					</form>
					
					<form action="/NAOE/AdminServlet" method="post">
					<input class="form-control form-control-sm" type="text" placeholder="カテゴリー追加" name="category">
					<input class="btn btn-primary" type="submit" value="追加">
					</form>
       </div>
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
        <div class="text-end ">
        <button type="button" class="btn btn btn-secondary" onclick="location.href='/NAOE/NaoeServlet';">TOP戻る</button>
          <!-- <button type="button" class="btn btn-light text-dark me-2">Login</button> -->
          
          <button type="button" class="btn btn-primary" onclick="location.href='/NAOE/AdminServlet?action=add';">商品追加</button><br>
          
          <nav aria-label="breadcrumb">
			    <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">並び替え</li>
			  </ol>
			</nav>
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			  <li class="breadcrumb-item"><a  href="#" onclick="showTable('table1')">登録古い順</a></li>
			    <li class="breadcrumb-item"><a href="#" onclick="showTable('table1-1')">登録新しい順</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table3')">値段安い順</a></li>
			    <li class="breadcrumb-item"><a href="#" onclick="showTable('table3-1')">値段高い順</a></li>
			   
			  </ol>
			  </nav>
			  
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			      <li class="breadcrumb-item"><a  href="#" onclick="showTable('table4-1')">カテゴリー古い順</a></li>
			     <li class="breadcrumb-item"><a  href="#" onclick="showTable('table4')">カテゴリー新しい順</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table5-1')">在庫多い順</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table5')">在庫少ない順</a></li>
			   
			  </ol>
			</nav>
			  
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			     
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table5-2')">在庫なし</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table6')">売上げ多い順</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table6-1')">売上げ少ない順</a></li>
			    <li class="breadcrumb-item"><a  href="#" onclick="showTable('table1-2')">自分の登録</a></li>
			  </ol>
			</nav>

          
        </div>
      </div>
    </div>
</header>



<div class="container">

<table class="table table-striped" id="table1">
<thead class="sticky-top " style="background-color: #4682b4; color: white;">
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

<!-- 商品をすべて表示 -->
<tbody id="table1">
	<c:forEach var="item" items="${tempoList}">
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

<!-- 売上順表示 table6 -->
<tbody id="table6" style="display: none;">
	<c:forEach var="item" items="${rankingList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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


<!-- 登録新しい順表示 table1-1 -->
<tbody id="table1-1" style="display: none;">
	<c:forEach var="item" items="${itemDescList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 値段やすい順表示 table3 -->
<tbody id="table3" style="display: none;">
	<c:forEach var="item" items="${priceList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 値段高い順表示 table3-1 -->
<tbody id="table3-1" style="display: none;">
	<c:forEach var="item" items="${priceDescList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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



<!-- カテゴリー古い順表示 table4-1 -->
<tbody id="table4-1" style="display: none;">
	<c:forEach var="item" items="${categoryList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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


<!-- カテゴリー新しい順表示 table4 -->
<tbody id="table4" style="display: none;">
	<c:forEach var="item" items="${categoryDescList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 在庫多い順表示 table5-1 -->
<tbody id="table5-1" style="display: none;">
	<c:forEach var="item" items="${stockDescList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 在庫少ない順表示 table5 -->
<tbody id="table5" style="display: none;">
	<c:forEach var="item" items="${stockList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 在庫0順表示 table5-2 -->
<tbody id="table5-2" style="display: none;">
	<c:forEach var="item" items="${stockList}">
	<c:if test="${item.stock==0}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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
	</c:if>
	</c:forEach>
</tbody>

<!-- 売上少ない順表示 table6-1 -->
<tbody id="table6-1" style="display: none;">
	<c:forEach var="item" items="${salesList}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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

<!-- 登録新しい順自分のもののみ table1-2 -->
<tbody id="table1-2" style="display: none;">
	<c:forEach var="item" items="${itemDescList}">
	<c:if test="${user.user_Name == item.registerUser}">
		<tr>
			<!-- <td><img
			 src="<%=request.getContextPath() %>/image/<c:out value="${item.image}" />"></td> -->
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
		</c:if>
	</c:forEach>
</tbody>


</table>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
-->
<!-- カテゴリー追加のアナウンスセッション終了 -->
<% session.removeAttribute("successCategory"); %>
<% session.removeAttribute("erorrCategory"); %>
<!-- 商品削除のアナウンスセッション終了 -->
<% session.removeAttribute("successDelete"); %>
<% session.removeAttribute("erorrDelete"); %>
<!-- 商品変更のアナウンスセッション終了 -->
<% session.removeAttribute("ChangeOK"); %>
<% session.removeAttribute("ChangeErorr"); %>
<!-- 商品追加のアナウンスセッション終了 -->
<% session.removeAttribute("successAdd"); %>
<% session.removeAttribute("erorrAdd"); %>
</body>
</html>