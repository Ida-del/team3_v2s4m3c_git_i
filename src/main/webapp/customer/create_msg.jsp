<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <DIV class="title_line">
    고객센터
  </DIV>
  
  <div class="menu_line float-right">
    <A href="./create.do">문의하기</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <%-- <span class='menu_divide' >│</span>
    <A href="./list_by_mno_grid1.do?m_no=${customerVO.m_no}">GRID GALLERY</A> --%>
  </div> 

<DIV class='message contentBox'>
<input type='hidden' name='cs_type' id='cs_type' value="${param.cs_type}">
<input type='hidden' name='cs_no' id='cs_no' value="${param.cs_no}">
<input type="hidden" name="m_no" value="${sessionScope.m_no}">
<input type="hidden" name="m_id" value="${sessionScope.id}">
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.cnt == 1 }">
          <LI class='li_none'>
            <span class='span_success'>문의가 접수 되었습니다.</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_fail'>문의 등록에 실패하였습니다.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
          <c:when test="${param.cnt == 1 }">
            <button type='button' 
                         onclick="location.href='./create.do'"
                         class="btn btn-info">문의 등록</button>
          </c:when>
          <c:otherwise>
            <button type='button' 
                         onclick="history.back();"
                         class="btn btn-info">다시 시도</button>
          </c:otherwise>
        </c:choose>
                    
        <button type='button' 
                    onclick="location.href='list_all.do'"
                    class="btn btn-info">문의 내역</button>
<%--         <button type='button' 
                    onclick="location.href='./read.do?cs_no=${cs_no}&m_no=${param.m_no}&m_id=${param.m_id}'"
                    class="btn btn-info">작성된 문의 보기</button> --%>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
