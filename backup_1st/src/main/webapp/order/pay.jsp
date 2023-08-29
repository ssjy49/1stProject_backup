<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
</head>
<style type="text/css">
  
<!--배경css--> 
  .navbar{
    height: 60px;
    padding-left: 30px;
    padding-right: 30px;
}
.hero-header{
    height: 450px;
    background-image: url("images/wine.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    }
.navbar #logo{
    line-height: 60px;
}
.navbar #menu{
    float: right;
    list-style-type: none;
    padding: 0;
    margin: 0;
}
.navbar #menu li{
    float: left;
    margin-left: 50px;
    line-height: 60px;
}
.navbar #menu li a{
    color: #545454;
    font-size: 13px;
    text-decoration: none;
}
.product-content{
    width: 735px;
    margin-left: auto;
    margin-right: auto;
}
.products h3{
    font-size: 24px;
    color: #545454;
    margin-top:60px;
    margin-bottom: 60px;
    text-align: center;
}
.products h4{
    font-size: 24px;
    color: #545454;
    margin-top:15px;
    margin-bottom: 15px;
    text-align: center;
}
.product{
    display: block;
    width: 225px;
    text-align: center;
    text-decoration:none;
    color: black;
    float:left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
}
.product-name{
    margin-top: 20px;
    margin-bottom: 4px;
}
.clearfix{
    clear: both;
}
.footer{
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}
.footer a{
    margin-left: 10px;
    margin-right: 10px;
    text-decoration:none;
}
<!--탭css -->
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
.tab-content{
  display: none;  
  padding: 15px 0;
  border-top:3px solid #eee;
}
.tab-content.current{
  display: inherit;
}
<!--모달창 css-->
* {
  padding:0;
  margin:0;
  box-sizing: border-box;
}
#btnWrap {
  width: 500px;
  margin: 100px auto;
}
#popupBtn {
  width: 150px;
  height: 50px;
  padding: 10px 5px;
}
#modalWrap {
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  display: none;
}
#modalBody {
  width: 500px;
  height: 300px;
  padding: 30px 30px;
  margin: 0 auto;
  border: 1px solid #777;
  background-color: #fff;
}
#closeBtn {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:15px;
  cursor: pointer;
}
 </style>
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

<body>


    <div class="navbar">
        <a href="main.me" id="logo"><!--로고-->
            <img src="images/logo-198x66.png" height="60">
        </a>

        <ul id="menu"><!--상단우측-->
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="#"><b>Login</b></a></li>
        </ul>
    </div>

    <div class="hero-header"></div>

    <div class="products">
        
<h3>결제</h3> 
 <%
String memberId = (String)session.getAttribute("memberId");
%>       
<%
request.setCharacterEncoding("utf-8");
String thumnail = request.getParameter("thumnail"); // 전달
String classSubject = request.getParameter("classSubject");
String classPrice = request.getParameter("classPrice");
String reservationDate = request.getParameter("reservationDate");
String reservationAmount = request.getParameter("reservationAmount");
%>
 
<form action="payPro.pa" method="post">
                <img src="images/logo-198x66.png" width="107" height="71">
<table id="class-content">
<tr><td>팔레트정보</td></tr>
<tr><td>이미지파일</td><td>
    <%      
      		if(thumnail == null){
     %>
                <img src="images/logo-198x66.png" width="107" height="71" name="thumnail">
     <%		}else{
     %>           
            	<img src="upload/<%=thumnail %>" width="107" height="71" name="thumnail">
     <%			 }
     %>
</td></tr> 
<tr><td>클래스제목 <%=classSubject %></td></tr>
<tr><td>예약날짜 <%=reservationDate %></td></tr>
<tr><td>예약인원 <%=reservationAmount %></td></tr>
<tr><td>총 결제금액 <%=classPrice %> * <%=reservationAmount %></td></tr>    
</table>
<input type="submit" value="결제하기" class="btn">
</form>
</body>
</html>