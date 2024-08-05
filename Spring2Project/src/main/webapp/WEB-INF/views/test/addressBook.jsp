<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' integrity='sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN' crossorigin='anonymous'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>
</head>
<body>
	<h1>주소록</h1>
	<hr/>
	<div class="row">
		<div class="col-md-12">
			<h4>MENU GROUP</h4>
			<button type="button" class="btn btn-info" onclick="javascript:location.href='/test/addAddress.do'">등록</button>
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							홍길순	
						</div>
						<div class="card-body">
							<table class="table table-bordered">
								<tr>
									<td>이름</td>
									<td>홍길순</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>여자</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>010-2134-1234</td>
								</tr>
								<tr>
									<td>직업</td>
									<td>개발자</td>
								</tr>
							</table>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-primary">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-header">즐겨찾기</div>
				<div class="card-body">
					[여자]홍길동 010-2144-1234 <button type="button" class="btn btn-sm btn-danger">삭제</button><br/> 
					[여자]홍길순 010-2144-1234 <button type="button" class="btn btn-sm btn-danger">삭제</button><br/>
					[여자]유재석 010-2144-1234 <button type="button" class="btn btn-sm btn-danger">삭제</button><br/>
				</div>
				<div class="card-footer">
					
				</div>
			</div> 
		</div>
	</div>
</body>
</html>