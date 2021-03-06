<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <!-- ********** checkIDModal 알림창 시작 ********** -->
  <div id="checkIDModal" class="modal fade"  role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_close" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">X</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ********** checkIDModal 알림창 종료 ********** -->
  
  <!-- ********** Modal_sign_up Start ********** -->
  <div id="modal_sign_up" class="modal_sign_up form-horizontal">
     <form class="modal_contentBox" name="frm_member" id="frm_member" method='POST' action="./create.do">
           <div class="container_modal">
           <h1>Register</h1>    
           <p><span style="color: red;">*</span>: Please fill in the form.</p>
           <hr>
           
           <div class="col-md-10">
            <label for="m_id"><b>ID<span style="color: red;">*</span></b></label>
            <input type="text" placeholder="아이디 입력" name="m_id" id="m_id" required>
            <button type='button' id="btn_checkID" class="btn_checkID">Duplicity check</button>
            <br>
            </div>
          
            <div class="col-md-10">
            <label for="email"><b>EMAIL<span style="color: red;">*</span></b></label>
            <input type="text" placeholder="이메일 주소 입력" name="email" id="email" required>
            </div>
    
            <div class="col-md-10">
            <label for="m_passwd"><b>Password<span style="color: red;">*</span></b></label>
            <input type="password" placeholder="패스워드 입력" name="m_passwd"  id="m_passwd" required>
            </div>
            
            <div class="col-md-10">
            <label for="m_passwd2"><b>Confirm password<span style="color: red;">*</span></b></label>
            <input type="password" placeholder="패스워드 확인" name="m_passwd2" id="m_passwd2" required>
            </div>
       
            <div class="col-md-10">
            <label for="m_name"><b>NAME OR NIC<span style="color: red;">*</span></b></label>
            <input type="text" placeholder="이름 또는 닉네임" name="m_name" id="m_name" required>
            </div>
            
            <div class="col-md-10">
            <p>계정을 생성함으로써 귀하는 당사의 <a href="#" style="color:dodgerblue"> 약관 및 개인 정보 보호</a>에 동의하는 것입니다. </p>
            </div>
          
             <div class="col-md-5">
               <button type="button" class="cancelbtn" id="btn_cancel" onclick="location.href='../index.jsp'">CANCEL</button>
             </div>  
             <div class="col-md-5">
               <button type="submit" class="signupbtn" id="btn_send">SING IN</button>
             </div>
          </div>
      </form>  
 </div>  
 <!-- ********** Modal_sign_up End ********** -->
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

