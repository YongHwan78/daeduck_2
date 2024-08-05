<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="">
	<div class="card card-outline card-primary">
		<div class="card-header text-center">
			<p class="h4">
				<b>아이디찾기</b>
			</p>
		</div>
		<div class="card-body">
			<p class="login-box-msg">아이디 찾기는 이메일, 이름을 입력하여 찾을 수 있습니다.</p>
			<form action="" method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="imemEmail" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="imemName" placeholder="이름을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<p>
						회원님의 아이디는 [<font id="idResult">000</font>] 입니다.
					</p>
				</div>
				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary btn-block" id="idFindBtn">아이디찾기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br />
	<div class="card card-outline card-primary">
		<div class="card-header text-center">
			<p href="" class="h4">
				<b>비밀번호찾기</b>
			</p>
		</div>
		<div class="card-body">
			<p class="login-box-msg">비밀번호 찾기는 아이디, 이메일, 이름을 입력하여 찾을 수 있습니다.</p>
			<form action="" method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="이름을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<p>
						회원님의 비밀번호는 [0000] 입니다.
					</p>
				</div>
				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary btn-block">비밀번호찾기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br/>
	<div class="card card-outline card-secondary">
		<div class="card-header text-center">
			<h4>MAIN MENU</h4>
			<button type="button" class="btn btn-secondary btn-block">로그인</button>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var idFindBtn = $("#idFindBtn");	// 아이디 찾기 버튼 Element
	
	idFindBtn.on("click", function(){
		var email = $("#imemEmail").val();
		var name = $("#imemName").val();
		
		if(email == null || email == ""){
			alert("이메일을 입력해주세요!");
			return false;
		}
		
		if(name == null || name == ""){
			alert("이메일을 입력해주세요!");
			return false;
		}
		
		var data = {
			memEmail : email,
			memName : name
		}
		
		$.ajax({
			url: "/notice/idForget.do",
			type: "post",
			data: JSON.stringify(data),
			dataType: "text",
			contentType: "application/json;charset=utf-8",
			success: function(res){
				if(res === "empty"){
					res = "존재하지 않는 회원입니다!";					
				}
				$("#idResult").html(res).css("font-size", "22px").css("color", "red");
			}
		});
	});
});
</script>




















