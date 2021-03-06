<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

  <DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_msg'>
      <H3>관리자 로그인이 필요한 페이지입니다.</H3>
      <BR><BR>
      <button type='button' 
                  onclick="location.href='${pageContext.request.contextPath}/adm/admin/login.do'" 
                  class="btn btn-info">로그인</button>       
                   
    </fieldset>
  </DIV>



 
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />
