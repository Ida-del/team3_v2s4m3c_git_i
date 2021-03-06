<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />


<script>
    $(function(){  // 자동 실행
      // $('#btn_delete').on('click', delete_proc); // 레코드 하나 삭제 진행
      $('#btn_select_delete').on('click', delete_selected_list_proc); // 선택된 레코드 삭제
      $('#check_all').on('click', select_all_checkbox);                    //  체크박스 전체 선택/전체 해제
      $(".attach_no_list").on('click', dismiss_checkall_checkbox);  // 전체 체크박스 해제
    });

    function delete_selected_list_proc() {
      var double_check = confirm("선택하신 상품이 삭제됩니다.");
      var selected='';
      var count = document.selected_frm['attach_no_list'].length;
      var attachno_list = new Array();
      
      for (var i = count-1; i >= 0 ; i--) { // 배열에 저장
        if (document.selected_frm['attach_no_list'][i].checked) {               
          attachno_list.push(document.selected_frm['attach_no_list'][i].value);
        }
      }
      attachno_list = attachno_list.join(',');
      // alert(attachno_list);
      // return
        
      if(double_check) {
        var param = { 
          "attachno_list" : attachno_list
        };  // 카트번호 배열 저장
              
        $.ajax({
          url: "./delete_ajax.do",
          dataType: "json",
          type: "post",
          data: param,
          success: function(rdata){
            if(rdata.result != 0) {
              location.href="./list.do";
            } else {
              alert("result==0");
            }
          }, 
          error: function(request, status, error) {
            var msg = 'ERROR request.status: '+request.status + '/ ' + error;
            console.log(msg); // Chrome console 출력
          }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        });  //   ajax 호출
      } 
    }

    /*  체크박스 전체 선택/전체 해제  */
   function select_all_checkbox() {
       if ($('#check_all').prop("checked")) {  
         $(".attach_no_list").prop("checked", true);
       } else {
         $(".attach_no_list").prop("checked", false);
       }
    }

   function dismiss_checkall_checkbox() {
     $("#check_all").prop("checked", false);  // 전체 선택 체크박스 체크 해제

   }
  
    /*  frm_csAttach을 사용한 PK 저장 */
/*     function delete_proc() {  
      var attach_no = $('#btn_delete').attr('data-attachno'); // 삭제할 파일 번호 임시 저장
      var frm = $('#frm_csAttach')
      $('#attach_no', frm).val(attach_no); // attach_no input hidden 타입으로 저장
      
      frm.submit();  // spring execute
    } */
    
    /*  삭제 폼 Modal 출력   */
/*     function delete_form(attach_no) {
      $('#btn_delete').attr('data-attachno', attach_no); // 삭제할 파일 번호 임시 저장
      
      msg = '파일을 삭제하시겠습니까?<br>파일을 삭제하면 복구 할 수 없습니다.<br>';
      msg += '삭제 진행시 삭제진행 버튼을 클릭하세요.';
      
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('파일 삭제'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // modal 출력
      return false;
    } */
  

</script>


  <!-- frm_csAttach  -->
<!--   <form name='frm_csAttach' id='frm_csAttach' method='post' action='./delete.do'>
    <input type='hidden' name='attach_no' id='attach_no' value=''>
    <input type='hidden' name='rurl' id='rurl' value='./list.do'>
  </form> -->
  
  <!-- ********** Modal 알림창 시작 ********** -->
<!--   <div id="modal_panel" class="modal fade"  role="dialog">
    <div class="modal-dialog">
      <div class="modal-content"> Modal content
        <div class="modal-header">
          <h4 class="modal-title" id='modal_title'></h4>modal_title
          <button type="button" class="close" data-dismiss="modal">x</button>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  modal_content
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_delete" data-focus="" data-attachno="" class="btn btn-default" 
                      data-dismiss="modal">삭제</button>
          <button type="button" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div> -->
  <!-- ********** Modal 알림창 종료 ********** -->
  <DIV class='title_line'>
    <a href="../customer/list_all.do">고객센터</a> > 고객센터 첨부파일
  </DIV>

  <div class="aside_left">
    전체 파일 목록
  </div>
  <div class="aside_right">
    <A href='../customer/list_all.do'>고객센터 문의 목록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();" title="reload">새로고침</A>
  </div> 
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <form name="selected_frm" id="selected_frm">
    <TABLE class='table_basic table-striped' style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>        
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs"><input type="checkbox" name="check_all" id="check_all" > 전체 선택</TH>     
        <TH class="th_bs"> </TH>
        <TH class="th_bs">File<br>name</TH>
        <TH class="th_bs">Stored<br>name</TH>
        <TH class="th_bs">Preview<br>name</TH>
        <TH class="th_bs">Date</TH>
        <TH class="th_bs">
          <button type="button" id="btn_select_delete" class="btn_select_delete">
            선택 삭제
          </button>
        </TH>
      </TR>
      </thead>

      <tbody>
      <c:forEach var="cs_attachfileVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="cs_no" value="${cs_attachfileVO.cs_no}" />
        <c:set var="attach_no" value="${cs_attachfileVO.attach_no}" />
        <c:set var="fname" value="${cs_attachfileVO.fname.toLowerCase()}" />
        <c:set var="fupname" value="${cs_attachfileVO.fupname}" />
        <c:set var="thumb" value="${cs_attachfileVO.thumb}" />
        <c:set var="rdate" value="${cs_attachfileVO.rdate}" />
        <TR>
          <TD class="td_bs">
          <input type="checkbox" id="attach_no_list" name="attach_no_list" class="attach_no_list"
                                            data-attachno="${attach_no}"  value="${attach_no}"/>
                                  
          </TD>
          <TD class="td_bs_left" style="padding:6px 0 6px 0;">
            <c:set var="thumb" value="${cs_attachfileVO.thumb }" />
              <c:choose>
                <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
                  <img src="./storage/${thumb}"  style="width: 120px;">
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                   <img class="card-img-top" src="http://placehold.it/300x400" 
                           style="width: 120px; height: 160px;" title="${fname}">  
                </c:otherwise> 
              </c:choose>
          </TD>               
          <TD class="td_bs">${fname}</TD>      
          <TD class="td_bs">${fupname}</TD>
          <TD class="td_bs">${thumb}</TD>
          <TD class="td_bs">${rdate.substring(0,10)}</TD>
          <TD class="td_bs">
            <A href="javascript: delete_form(${attach_no})"><span style="color: red; font-weight: 900;">X</span>
            </A>
          </TD>           
        </TR>               
      </c:forEach>                   
      </tbody>
    </TABLE>
     </form>
  </div>
  
 

<jsp:include page="/menu/bottom.jsp" flush='false' />