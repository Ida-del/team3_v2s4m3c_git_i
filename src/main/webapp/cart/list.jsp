<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.payway.PaywayCode" %>
<%@ page import="dev.mvc.payway.CodeTable" %>

<%
ArrayList<PaywayCode> payway_list = CodeTable.getPaywayCode();
request.setAttribute("payway_list", payway_list);
%>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<script>
     
    $(function(){ 
      $('#check_all').on('click', select_all_checkbox);                      //  체크박스 전체 선택/전체 해제
      $(".cart_no").on('click', dismiss_checkall_checkbox);               //  전체 체크박스 해제
      $("#total_sum").html("0 원");  // 초기값 0 원
      $('#btn_select_delete').on('click', delete_selected_list_proc);     // 선택된 레코드 삭제
      $('.btn_delete_this').on('click', delete_one_record_proc);         //  레코드 하나 삭제
      $('#order_reqest').on('click', create_ajax);                           //  주문 등록
    }); 
    
     /* 체크된 체크박스 값만 더하여 누적합계 산출 */
     function price_sum() {
       var sum=0;
       var cnt = $(".cart_no").length;

       for(var i = 0; i < cnt; i++) {
         if($(".cart_no")[i].checked == true  ) {
             sum += parseInt($(".cart_no")[i].value);
         } 
       } 
       $("#total_sum").html(sum+" 원");
    }
     
    /*  선택 삭제   */
    function delete_selected_list_proc(){
      var double_check = confirm("선택하신 상품이 삭제됩니다.");
      if(double_check) {
           var cartno_list = [];
           
           $("input[name='cart_no']:checked").each(function() {
               cartno_list.push($(this).attr("data-cartno"));  
            }); // 체크된 항목을 배열에 저장

            var param = { 
                "cartno_list" : cartno_list
            };  // 카트번호 배열 저장
            
           $.ajax({
               url: "./delete_ajax.do",
               dataType: "json",
               type: "post",
               data: param,
               success: function(rdata){
                    if(rdata.result !=  0) {
                      location.href="./list.do";
                    } else {
                      alert("ajax error!");
                    }
                  }, 
                  error: function(request, status, error) {
                    var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                    console.log(msg); // Chrome console 출력
                  }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 

            });  //   ajax 호출
      } // if end 
    
    } // end


   /*     체크박스 전체 선택/전체 해제      */
   function select_all_checkbox() {
      if ($('#check_all').prop("checked")) { 
         $(".cart_no").prop("checked", true);
         price_sum();  
      } else {
        $(".cart_no").prop("checked", false);
        price_sum();
      }       
    }

     /*   전체 선택 체크박스 체크 해제  */
    function dismiss_checkall_checkbox() {
      $("#check_all").prop("checked", false);  
      price_sum();
    }

     /*  레코드 하나 삭제   */
    function delete_one_record_proc(){
       var double_check = confirm("선택된 상품을 삭제하시겠습니까?");
       if(double_check) {
            var cartno_list = [];
            cartno_list.push($(this).attr("data-cartno"));  
  
             var param = { 
                 "cartno_list" : cartno_list
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
                       alert("삭제 X");
                     }
                   }, 
                   error: function(request, status, error) {
                     var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                     console.log(msg); // Chrome console 출력
                   }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 
  
             });  //   ajax 호출
       } 
    }  // end
    

    // 주문 등록
    function create_ajax() {
      var double_check = confirm("선택된 상품을 주문 하시겠습니까?");
      if(double_check) {
         var ebno_list = [];
         var cartno_list = [];
         $("input[name='cart_no']:checked").each(function() {
           ebno_list.push($(this).attr("data-ebno"));  
           cartno_list.push($(this).attr("data-cartno"));  
          }); 
          var payway = $("select[name='payway']").val();
          
          var params = { 
              "ebno_list" : ebno_list,
              "payway"  : payway,
              "cartno_list" : cartno_list
          }; 
          // alert(params);
          
         $.ajax({
             url: "../orderreq/create_ajax.do",
             dataType: "json",
             type: "post",
             async: false,
             data: params,
             success: function(rdata){
                if(rdata.cnt != null) {
                  var clickok = alert("요청이 완료되었습니다.");
                  if(clickcok) {
                    alert(rdata.cnt);
                  }
                  // location.href ="../orderreq/list.do?user_id="+${sessionScope.id};
                } else {
                  alert("ajax error!");
                }
              }, 
              error: function(request, status, error) {
                var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                console.log(msg); // Chrome console 출력
              }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 

          });  //   ajax 호출
      } // if end 
    }  // create_ajax()
    

</script>
<DIV class="cart_frm" style='background-color: #fff;'>
  <DIV class="title_line">
    <span style="color: #000066;">장바구니</span>
  </DIV>
  <DIV class="aside_left">
    <A href="../ebook/list.do">ebook 전체 보기</A>
  </DIV>
  <DIV class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </DIV> 
  <DIV class='menu_line'></DIV>
  <div style="margin: 30px auto; text-align: center; ">
    <c:choose>
      <c:when test="${record_count == 0}">
         <span style="font-weight: bold; color: orange;">장바구니가 비어있습니다</span> 
      </c:when>
    </c:choose>      
  </div>  
  <div class="containerBox" style='width: 100%;'> 
  <form name='frm_req' id='frm_req'>       
      <input type="hidden" name="mname" id="mname" value="${sessionScope.mname}">
      <input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">

        <TABLE class='table_basic table-striped' style='width: 100%; margin: 10px auto;'>            
          <colgroup>
            <col style='width: 15%;'/>
            <col style='width: 60%;'/>
            <col style="width: 13%;"/>
            <col style="width: 13%;"/>
          </colgroup>
         
          <thead>  
          <TR>
            <TH class="th_bs"><input type="checkbox" name="check_all" id="check_all"> 전체 선택
            </TH>     
            <TH class="th_bs">상품</TH>
            <TH class="th_bs">가격</TH>
            <TH class="th_bs">
              <button type="button" id="btn_select_delete" class="btn_select_delete" style="background-color: #cc0066;">
                선택 삭제
              </button>
            </TH>
          </TR>
          </thead>
          
          <tbody>
          <c:forEach var="cartVO" items="${list}">  <!-- request 객체에 접근 -->
            <c:set var="cart_no" value="${cartVO.cart_no}" />
            <c:set var="user_id" value="${sessionScope.id}" />
            <c:set var="eb_no" value="${cartVO.eb_no}" />
            <c:set var="eb_title" value="${cartVO.eb_title}" />
            <c:set var="eb_price" value="${cartVO.eb_price}" />
            
            <TR>
              <TD class="td_bs"><input type="checkbox" name="cart_no" class="cart_no" data-cartno="${cart_no}"  data-ebno="${eb_no}"
                                                 value="${eb_price}"  onClick="price_sum()" />                                                                       
              </TD>
              <TD class="td_bs_left" style="padding:6px 0 6px 0;">
              <A href="../ebook/read.do?eb_no=${eb_no}">
                <c:set var="thumb" value="${cartVO.eb_thumb }" />
                  <c:choose>
                    <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                      <img src="../ebook/storage/main_images/${thumb}" style="width: 120px; height: 160px;">
                    </c:when>
                    <c:otherwise>
                       <img class="card-img-top" src="http://placehold.it/300x400" style="width: 120px; height: 160px;">  
                    </c:otherwise> 
                  </c:choose>
                   ${eb_title}
                 </A>
              <TD class="td_bs">
                <fmt:formatNumber  value="${eb_price}" pattern="#,###" /><span class="won"> 원</span>
              </TD>           
              <TD class="td_bs">
                <button type="button" class="btn_delete_this" data-cartno="${cart_no}"  style="background-color:inherit;">
                  <i class="fas fa-minus-circle" title="삭제"></i>
                </button>                                          
              </TD>           
            </TR>                              
          </c:forEach>  
          
          <TR style="height: 100px; font-weight: bolder; font-size: 1.4em;">
            <TD class="td_bs"  rowspan="2">결제 합계</TD>
            <TD class="td_bs"  rowspan="2"  id="total_sum"></TD> 
            <TD class="td_bs"  rowspan="2" colspan="2">
              <select name='payway'  style="color: #ff9933;">
              <c:forEach var="order_reqest" items="${payway_list}" varStatus="info">
                  <option value="${order_reqest.code }" >${order_reqest.payway }</option>
              </c:forEach>
              </select>              
              <button type="submit" class="btn_send" id="order_reqest"  style="width: 50%; padding:8px 12px; 
                         background-color: #0099cc; color: #fff;">주문 요청
              </button>
            </TD>
          </TR>         
        </tbody>
      </TABLE>
   </form>   
  </div>
</DIV>  
 

<jsp:include page="/menu/bottom.jsp" flush='false' />