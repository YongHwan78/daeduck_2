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
	<h1>주소록 등록</h1>
	<hr/>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" id="name"/>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="checkbox" name="gender" value="male"/>남자&nbsp;
						<input type="checkbox" name="gender" value="female"/>여자
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select name="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" name="phone2" /> -
						<input type="text" name="phone3" /> 
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<input type="text" name="job" id="job"/>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<button type="button" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-warning">취소</button>
		</div>
		<div class="col-md-2"></div> 
	</div>
</body>
</html>