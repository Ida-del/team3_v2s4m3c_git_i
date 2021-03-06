<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

 <DIV class='title_line'>알림</DIV>
  <DIV class='message'>
  <fieldset class='fieldset_msg'> 
      <ul>
        <li class='li_none'>관리자 로그인에 실패했습니다.</li>
        <li class='li_none'>ID 또는 패스워드가 일치하지 않습니다.</li>
        <li class='li_none'>
          <button type="button" id="btn_home" class="btn btn-md"  style="border: 1px solid #ccc;">확인</button>
          <button type="button" id="btn_retry" class="btn btn-primary btn-md">다시 시도</button>
        </li>  
      </ul>          
  </fieldset>
  </DIV>



 
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />
