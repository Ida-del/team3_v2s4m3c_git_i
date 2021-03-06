<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <DIV class='message'>
    <H3>로그인이 필요한 페이지입니다.</H3>
    <BR><BR>
    <button type='button' 
                 onclick="location.href='${pageContext.request.contextPath}/member/login.do'" 
                 class="loginbtn">로그인</button>       
    <button type='button' 
                 onclick="location.href='${pageContext.request.contextPath}/member/create.do'" 
                 class="loginbtn">회원 가입</button>       

  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

