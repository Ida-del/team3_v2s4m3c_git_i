<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV style='width: 100%; margin: 0px auto; background-color: #fff;'>
  <FORM name='frm' method='POST' action='./login.do' class="login_frm form-horizontal">
     <div class="containerBox">   
     <h1 style="color: #000;">LOGIN</h1>  
     <hr>
     <div class="contentBox">
      <label class="col-md-4 control-label">ID</label>
      <div class="col-md-8">
        <input type='text' class="form-control" name='id' id='id' 
                   value='${ck_id }' required="required" 
                   style='width: 40%;' placeholder="아이디" autofocus="autofocus">
        <label>   
        <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> REMEMBER ME
        </label>                   
      </div>  
      <label class="col-md-4 control-label">PASSWORD</label>    
      <div class="col-md-8">
        <input type='password' class="form-control" name='passwd' id='passwd' 
                  value='${ck_passwd }' required="required" style='width: 40%;' placeholder="패스워드">
        <label>
        <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> REMEMBER ME
        </label>
      </div>
      <button type="submit" class="btn_login">LOGIN</button>
      <hr style="margin-top: 13px;">
      <div class="clearfix" style="margin-top: -23px;">
        <span class="psw"><a href="#">FORGOT PASSWORD?</a></span>     
        <span class="psw" style="color: #f1f1f1; margin: 0 6px 0 6px;">|</span>
        <span class="psw"><a href='./create.do'>JOIN</a></span>
      </div>
      <div class="clearfix" style="background-color: inherit;">
        <button type='button' onclick="loadDefault();" class="testbtn">TEST USE</button>
        <button type="button" onclick="location.href='../index.do'" class="cancelbtn" style="background-color: #f44336;">CANCEL</button>
      </div>                        
    </div>
   </div>
  </FORM>
</DIV>
 <div style="margin-bottom: 230px;"></div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
