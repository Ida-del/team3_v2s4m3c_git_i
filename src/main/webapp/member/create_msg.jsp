<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>
    알림
  </DIV>
  
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <UL>
        <c:choose>
          <c:when test="${param.cnt == 1 }">
            <LI class='li_none'>회원 가입을 축하드립니다!</LI>
          </c:when>
          <c:otherwise>
            <LI class='li_none'>회원 가입에 실패했습니다.</LI>
            <LI class='li_none'>다시 한번 시도해주세요.</LI>
          </c:otherwise>
        </c:choose>
        <LI class='li_none'>
          <button type='button' style="color: #fff;"onclick="location.href='../index.jsp'">확인</button>
        </LI>
       </UL>
    </fieldset>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 