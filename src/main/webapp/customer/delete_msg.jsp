<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class="title_line">
  <A href="./list_all.do">문의 내역</A> > 알림
  <div style="float: right; margin-right: 8px;">
  <A href="./create.do">문의하기</A>
  </div>
</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.passwd_cnt == 1}"> <!-- 패스워드 일치 -->
          <c:choose>
            <c:when test="${param.cnt == 1}"> <!-- 글 삭제 성공 -->
              <LI class='li_none' >
                <span class='span_success' style="text-align: center;">『${param.title}』 문의를 삭제했습니다.</span>
              </LI>
            </c:when>
            <c:otherwise>    <!-- 글 삭제 실패 -->
              <LI class='li_none'>
                <span class='span_fail'>『${param.title}』 문의 삭제에 실패했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_fail'>다시 시도해주세요.</span>
              </LI>
            </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise> <!-- 패스워드 불일치 -->
          <LI class='li_none'>
            <span class='span_fail'>패스워드가 일치하지 않습니다. 다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${param.cnt == 1 && param.passwd_cnt == 1}">
          <div class="clearfix">
            <button type='button' 
                        onclick="location.href='./list_all.do'"
                        class="btn_send" style="padding: 16px 20px;">문의 내역</button>                        
          </div>
        </c:when>
        <c:otherwise>
        <div class="col-md-9" style="padding-right: 20px;">
         <button type='button' 
                     onclick="location.href='./list_my_inquiry.do?m_no=${param.m_no}&m_id=${param.m_id}'"
                     class="btn_send">나의 1:1 문의</button>
          <button type='button' 
                      onclick="history.back();"
                      class="btn_send" style="background-color: #f2960d;">다시시도</button>              
        </div>
        </c:otherwise> 
      </c:choose>
      
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
