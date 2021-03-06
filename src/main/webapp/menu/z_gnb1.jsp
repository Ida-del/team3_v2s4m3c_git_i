<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container'> 
  <!--화면 상단 affix -->
  <div class="container-fluid top-css1">
    <h1>TEAM3 PROJECT</h1>
  </div>
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_img'>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
              <span class="icon-bar"></span>                        
              <span class="icon-bar"></span>                        
            </button>
            <A class="navbar-brand navbar_css1"  href="${pageContext.request.contextPath}?m_no=${param.m_no}" >
             TEAM3 PROJECT
            </A>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="dropdown">
                <A class="dropdown-toggle" data-toggle="dropdown" href="#">
                     카테고리<span class="caret"></span>
                </A>
                <ul class="dropdown-menu"> <!-- 카테고리 Drop-down menu -->
                  <li><a href="${pageContext.request.contextPath}/cate/list_all.do?m_no=${param.m_no}">전체 카테고리</a></li>
                  <li><a href="${pageContext.request.contextPath}/cate/read.do?m_no=${param.m_no}&cate_no=?${cate_no}&categrp_no=${param.categrp_no}">경제/경영</a></li>
                  <li><a href="${pageContext.request.contextPath}/cate/read.do?m_no=${param.m_no}&cate_no=?${cate_no}&categrp_no=${param.categrp_no}">컴퓨터/IT</a></li>
                  <li><a href="${pageContext.request.contextPath}/cate/read.do?m_no=${param.m_no}&cate_no=?${cate_no}&categrp_no=${param.categrp_no}">컴퓨터 프로그래밍</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/adm/ebook/list.do">Ebook 목록</a></li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/event/list.do">Event</a></li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/qnagrp/list.do">QnA</a></li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
              <li class="dropdown"><a href="${pageContext.request.contextPath}/review/list.do">후기</a></li>
              <li class="dropdown">
                <A class="dropdown-toggle" data-toggle="dropdown" href="#">
                고객센터<span class="caret"></span>
                </A>   
                <ul class="dropdown-menu">     <!-- 고객센터 Drop-down menu -->
                 <li><a href="${pageContext.request.contextPath}/customer/create.do?m_no=${param.m_no}">1:1 문의하기</A></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <c:choose>
               <c:when test="${sessionScope.m_id == null}">
                 <li><a href="${pageContext.request.contextPath}/member/login.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
                 <li>
                   <A href='${pageContext.request.contextPath}/member/create.do'>
                    <span class="glyphicon glyphicon-user"></span>
                     회원가입
                   </A>
                 </li>                 
               </c:when>
               <c:otherwise>
                 <li class="dropdown">
                   <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                   <span style="color: ">${sessionScope.m_id}님</span><span class="caret"></span>
                   </a>
                   <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/cart/read.do?m_no=${param.m_no}">장바구니</A></li>
                    <li><a href="${pageContext.request.contextPath}/customer/list_my_inquiry.do?m_no=${param.m_no}&m_id=${sessionScope.m_id}">나의 1:1 문의</A></li>
                    <li style="border: 1px solid #f1f1f1;"></li>
                    <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</A></li>
                   </ul>                   
                 </li>
                 <li class="dropdown">
                  <a href="${pageContext.request.contextPath}/member/logout.do">
                   <span class="glyphicon glyphicon-log-out"></span>
                   로그아웃
                  </a>
                 </li>
               </c:otherwise>
              </c:choose>
            </ul>
          </div>
      </div>
    </nav>    
 </DIV>


  
 <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
 <DIV class="row" style='margin-top: 2px;'>

    <DIV class='content'>