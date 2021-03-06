<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class="title_line">
    <A href="./list_all.do">문의 내역</A> > ${member_Customer_join.r_mname}님 문의 삭제
    <div style="float: right; margin-right: 8px;">
    <A href="./create.do">문의 등록</A>
    </div>
  </DIV>
 
  <FORM name='frm' method='POST' action='./delete.do' class="container_modal form-horizontal">
    <input type='hidden' name='cs_no' value='${param.cs_no}'>
    <input type="hidden" name="m_no" value="${sessionScope.m_no}">
    <input type="hidden" name="id" value="${sessionScope.id}">
     <div class="modal_contentBox">
      <div class="inner_container">         
        <div  style='text-align: center; padding: 30px 0 30px 0;'>
          삭제 문의 제목: ${member_Customer_join.cs_title }<br><br>
          <span style="color: red;">삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
          <div class="col-md-12">
            <input type='password' class="form-control" name='r_mpasswd'  value='' placeholder="계정 패스워드" style='width: 25%; margin-right: -28px;' required="required">
          </div>
          
          <div class="clearfix" >   
           <button type = "button" onclick = "history.back()" class="btn_cancel" style="background-color: #808080;">취소</button>
           <button type = "submit" class="btn_send" style="background-color: #f2960d;">삭제</button>
          </div>
       </div> <!-- end text-align: center; padding: 30px 0 30px 0;  -->
      </div>  <!--  end "inner_container"       -->
    </div>    <!--  end  "modal_contentBox"  -->
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
