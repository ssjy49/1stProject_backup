<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head -->
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/memberInfo/update.jsp</title>
</head>
<!-- body -->
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<h1>나의정보수정</h1>
<% 
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
%>
<!-- form -->
<form action = "updatePro.me" method="post" id="fr" enctype="multipart/form-data">

프로필 사진 : <input type="file" name="memberFile">
<input type="hidden" name="oldfile" value="<%=memberDTO.getMemberFile()%>">
<%=memberDTO.getMemberFile()%><br>
아이디 : <input type="text" name="memberId" value="<%=memberDTO.getMemberId() %>" readonly><br>
비밀번호 : <input type="submit" value="비밀번호 재설정" id="rePass"><br>
닉네임 : <input type="text" name = "memberNickname" value="<%=memberDTO.getMemberNickname() %>" id="nick"> <input type="button" value="중복확인" name="ndup" id="ndup"><br>
	   <div id="div1"></div>
<div id="div1"></div>
이름 : <input type="text" name="memberName" value="<%=memberDTO.getMemberName() %>" readonly><br>
생년월일 : <input type="text" name="memberBirthday" value="<%=memberDTO.getMemberBirthday() %>" readonly><br>
성별 : <input type="text" name="memberGender" value="<%=memberDTO.getMemberGender()%>" readonly><br>
전화번호 :<input type="text" name="memberPhoneNum" value="<%=memberDTO.getMemberPhoneNum() %>" 
			maxlength="11" size="20" placeholder="'-'빼고 숫자만 입력해주세요" id="phone" ><br>
<div id="div2"></div>
이메일 : <input type="text" name="memberEmail" value="<%=memberDTO.getMemberEmail() %>" id="email"><br>
<div id= "div3"></div>
지역 : <select name="memberLocation" id="address">
    <option value="Seoul" <%= "Seoul".equals(memberDTO.getMemberLocation()) ? "selected" : "" %>>서울</option>
    <option value="Busan" <%= "Busan".equals(memberDTO.getMemberLocation()) ? "selected" : "" %>>부산</option>
	 </select><br>
	 <div id="div4"></div>
<%
if (memberDTO.getMemberType().equals("host")) { %>
사업자등록번호 : <input type="text" name="businessNum" value="<%=memberDTO.getBusinessNum() %>" id="bnum"><br>
<% } %>
<div id="div5"></div>
<input type="button" name="update" value="수정하기" id="btn">
</form>
<!-- script -->
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">

// document.getElementById("rePassButton").addEventListener("click", function() {
//     location.href = "PasswordReset.me";
    
$(document).ready(function(){
	// 버튼 클릭시
	$('#btn').click(function(){
		// 닉네임
		if($('#nick').val() == ""){
			$('#div1').html("닉네임을 입력해주세요").css("color","red");
			$('#nick').focus();
			return;
		}else {
			$('#div1').empty();
		}
		// 전화번호
		if($('#phone').val() == ""){
			$('#div2').html("전화번호를 입력해주세요").css("color","red");
			$('#phone').focus();
			return;
		}else if($('#phone').val().length<11) {
			$('#div2').html("전화번호를 알맞게 입력해주세요").css("color","red");
			$('#phone').focus();
			return
		}else {
			$('#div2').empty();
		}
		// 이메일
		if($('#email').val() == ""){
			$('#div3').html("이메일을 입력해주세요").css("color","red");
			$('#email').focus();
			return;
		}else{
			$('#div3').empty();
		}
		// 지역
		if($('#address').val() == ""){
			$('#div4').html("지역을 선택해주세요").css("color","red");
			$('#address').focus();
			return;
		}else{
			$('#div4').empty();
		}
		// 사업자 번호
		if($('#bnum').val()==""){
			$('#div5').html("사업자등록번호를 입력해주세요").css("color","red");
			$('#bnum').focus();
			return;
		}else{
			$('#div5').empty();
		}
		alert("개인정보가 수정되었습니다.")
		$('#fr').submit();
	});// click
});// ready


	$('#ndup').click(function(){
			$.ajax({
				url:'nickCheck.me',
				data:{'memberNickname':$('#nick').val()},
				success:function(result){
					$('#div1').html(result).css("color","blue");
				}
			});
	});
</script>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>