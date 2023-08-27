<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
</head>
<body>
<%
//로그인 하면 => 로그인한 정보를 세션 저장
//세션에 로그인 정보 가져오기
String memberId=(String)session.getAttribute("memberId");
//세션에 로그인정보 있으면  id값 보여주기 
//세션에 로그인 정보가 없으면 회원정보가 존재하지 않습니다
if(memberId != null){
%>
<p align="center" style = "font-size:20px">가입하신 아이디는 '<%=memberId %>' 입니다</p> 
<%	
} else {
%>
<p align="center" style = "font-size:20px">회원정보가 존재하지 않습니다 </p> 
<%
}
%> 
<br>
<p align="center">
<input type="button" value="로그인 하기" onclick="location.href='login.me'"> 
<input type="button" value ="비밀번호 찾기"  onclick="location.href='findPassword.me'" >
</p>
</body>
</html>