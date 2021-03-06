<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />
    
    
<script type="text/javascript">
  $(function(){ 
    $('#btn_retry').on('click', function() { 
      location.href="./login.do"
    });

    $('#btn_home').on('click', function() { 
      location.href="${pageContext.request.contextPath}/index.do"
    });    
  });
</script>
  
<DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <li class='li_none'>회원 로그인에 실패했습니다.</li>
        <li class='li_none'>ID 또는 패스워드가 일치하지 않습니다.</li>
        <li class='li_none'>
          <button type="button" id="btn_retry" class="btn btn-primary btn-md">로그인 다시 시도</button>
          <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />


