<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>

 <jsp:include page="/menu/top.jsp" flush='false' />
  
  <DIV class="title_line">
    REVIEW
  </DIV>
  <ASIDE class="aside_left">
    전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">리뷰 등록</A> | 
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-striped' style='width: 95%;'>
      <colgroup>
        <col style='width: 5%;'/>
        <col style="width: 5%;"/>
        <col style='width: 45%;'/>
        <col style='width: 5%;'/>
        <col style='width: 15%;'/>
        <col style='width: 10%;'/>        
        <col style='width: 15%;'/>
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">그룹</TH>
        <TH class="th_bs">순서</TH>
        <TH class="th_bs">리뷰내용</TH>
        <TH class="th_bs">평점</TH>
        <TH class="th_bs">작성일</TH>
        <TH class="th_bs">추천수</TH>
        <TH class="th_bs">기타</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="reviewVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="review_no" value="${reviewVO.review_no}" />
        <TR>
          <TD class="td_bs">${reviewVO.eb_no}-${reviewVO.m_no} </TD>
          <TD class="td_bs_left"><A href="./read.do?review_no=${review_no}">${reviewVO.review_no}</A></TD>
          <TD class="td_bs">${reviewVO.review_content}</TD>
          <TD class="td_bs">${reviewVO.review_grade}</TD>
          <TD class="td_bs">${reviewVO.review_rdate.substring(0, 10) }</TD>
          <TD class="td_bs">${reviewVO.review_good}</TD>
          <TD class="td_bs">
            <A href="./update.do?review_no=${review_no}"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="./delete.do?review_no=${review_no }"><span class="glyphicon glyphicon-trash"></span></A>
          </TD>             
        </TR>
      </c:forEach>
      </tbody>
     
    </TABLE>
  </div>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>

