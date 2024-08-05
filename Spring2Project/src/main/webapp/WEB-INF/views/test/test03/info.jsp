<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' integrity='sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN' crossorigin='anonymous'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>
</head>
<body>
	<!-- 
		1) 로그인에 성공한 학생 정보를 아래에 출력해주세요!
		2) 로그인페이지로 버튼을 클릭 시 로그인 페이지로 이동해주세요.
	 -->
 	 <c:if test="${not empty msg }">
	 <script type="text/javascript">
	 alert("${msg}");
	 </script>
	 </c:if>
	<div class="row" id="rowDiv">
		<c:choose>
			<c:when test="${empty studentList }">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							조회하실 회원이 존재하지 않습니다!
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${studentList }" var="stuVO">
					<c:if test="${stuVO.memId eq studentVO.memId }">
						<c:set value="style='background-color:red;'" var="color"/>		
					</c:if>
					<c:if test="${stuVO.memId ne studentVO.memId }">
						<c:set value="" var="color"/>
					</c:if>
					<div class="col-md-4">
						<div class="card" ${color }>
							<div class="card-header">
								${stuVO.memName }님! 환영합니다!
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<tr>
										<td colspan="2">
											<img class="prev" src="https://lh4.googleusercontent.com/proxy/yuhEMCPI6rFy7LulnQK68A-hRwZytbhAkvzkACazt24gH8gGfqEFsOS2bBCDIXe9WgF0d51SlNcSyi8vqxBwA0cUW6P6DUSv28JovHIbosJuj2C3JYlYBILWrh0MInjHj8wgYET8H6hynOI8aJ7B-0MQae3ALnCmTSQuLGZqwdiEujP-WkPcHvR_MRnlFhy5XUVnhO9fRdg" style="width:100%;"/>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="file" class="imageFile"/>
										</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td>${stuVO.memId }</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>${stuVO.memPw }</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${stuVO.memName }</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${stuVO.memEmail }</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${stuVO.memPhone }</td>
									</tr>
								</table>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-primary mb-2">로그인페이지로></button>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript">
$(function(){
	
	var rowDiv = $("#rowDiv");
	var thisEle = null;
	
	rowDiv.on("change", ".imageFile", function(event){
		console.log("Change Event...!");
		thisEle = $(this);
		var files = event.target.files;
		var file = files[0];	// 선택한 파일을 꺼낸다.
		
		console.log(file);
		
		if(isImageFile(file)){	// 이미지 파일 일때
			// 비동기 처리 시, 파일 데이터를 전송할 때에는 forData()를 이용하여 데이터를 전송한다.
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				url : "/ajax/uploadAjax",
				type : "post",
				data : formData,
				dataType : "text",
				processData : false,
				contentType : false,
				success : function(data){
					alert(data);
					if(data === "UPLOAD SUCCESS"){
						var file = event.target.files[0];
						var reader = new FileReader();
						reader.onload = function(e){
							thisEle.parents(".card-body").find(".prev").attr("src", e.target.result);	
						}
						reader.readAsDataURL(file);
					}
				}
			});
		}else{	// 이미지 파일이 아닐 때
			alert("이미지 파일을 선택해주세요!");
		}
	});
});

// Change 이벤트가 발생할 때 선택된 파일이 이미지인지 검증
function isImageFile(file){
	// .pop() : 배열의 마지막 요소 꺼내기
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 꺼내온다.
	// 확장자 중 이미지에 해당하는 확장자가 아닌경우 포함되어 있는 문자가 없으니까 -1(false)가 리턴
	// 확장자 중 이미지 확장자가 포함되어 있다면 0보다 큰 수 일테니 true가 리턴
	return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
}
</script>
</html>