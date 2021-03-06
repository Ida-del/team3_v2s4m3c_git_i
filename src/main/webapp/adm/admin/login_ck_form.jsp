<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

 
<DIV class='title_line'>관리자 로그인</DIV>
 
<DIV style='width: 100%; margin: 10px 0px 0px 15px;'>
  <FORM name='frm' method='POST' action='./login.do' class="form-horizontal">
  
    <div class="form-group" >
      <label class="col-md-4 control-label">아이디</label>      
      <div class="col-md-8">
        <input type='text' class="form-control input-md" name='adm_id' id='adm_id' 
                    value='${ck_adm_id}' required="required" style='width: 30%; clear: both;' 
                    placeholder="아이디" autofocus="autofocus">
      <label>
      <input type='checkbox' name='adm_id_save' value='Y' 
               ${ck_adm_id_save == 'Y' ? "checked='checked'" : "" }> &nbsp;ID 저장
      </label>
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-4 control-label">비밀번호</label>    
      <div class="col-md-8">
        <input type='password' class="form-control" name='adm_passwd' id='adm_passwd' 
                  value='${ck_adm_passwd }' required="required" style='width: 30%; clear: both;' placeholder="비밀번호">
        <Label>
          <input type='checkbox' name='adm_passwd_save' value='Y' 
                    ${ck_adm_passwd_save == 'Y' ? "checked='checked'" : "" }>&nbsp;비밀번호 저장
        </Label>
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-offset-4 col-md-8">
        <button type="submit" class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
      </div>
    </div>   
    
  </FORM>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

