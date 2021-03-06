<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>TEAM3</title>

  <!-- NAVI css-->
  <link href="${pageContext.request.contextPath}/css/navi.css" rel="stylesheet" >
    
   <!-- ebook css  -->
  <link href="${pageContext.request.contextPath}/ebook/css/ebook.css" rel="Stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" >
  
  <!-- Login style css-->
  <link href="${pageContext.request.contextPath}/css/login_style.css" rel="stylesheet" >
  
  <!-- Modal style css-->
  <link href="${pageContext.request.contextPath}/css/modal_style.css" rel="stylesheet" >
   
  <!--  Font awesome Icon kit -->
  <script src="https://kit.fontawesome.com/140b02be17.js" crossorigin="anonymous"></script>
  
  <!-- CDN   -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!--  jQuery library  -->
  <script type="text/JavaScript" 
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
                                   
  <!-- Fotorama -->
  <link href="${pageContext.request.contextPath}/customer/fotorama.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/customer/fotorama.js"></script>
                                   
  <!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script type="text/JavaScript" src="${pageContext.request.contextPath}/ebook/js/ebook.js"></script>
  
  <script type="text/javascript">
    <!--  NAVI functions -->
    $(document).ready(function () {
      $('#wrapper').fadeIn(1000);
      
      /*  MobileMenu */
      $(".btn_menu").click(function () {
          $(".mb_gnb").stop().slideToggle();
      });  
      
      $("#has-sub01").hover(function () {
          $("#sub-bar01").stop().slideToggle();
      });
 
      $("#has-sub02").hover(function () {
          $("#sub-bar02").stop().slideToggle();
      });

      /* PC 버전 Menu 시작 */
      var delay = 300, setTimeoutConst; // delay의 값으로 감도 조절
      
      jQuery('.pc_gnb .depth1 .gnb02').hover(function() { // .pc_gnb > .depth1 > gnb02 class에 Mouse On 이벤트를 겁니다.
         setTimeoutConst = setTimeout(function() {jQuery('.pc_gnb .depth1 .gnb02 ul').slideDown('slow').css('display', 'block'); }, delay);
        }, function() {
          clearTimeout(setTimeoutConst);
          if (jQuery('.pc_gnb .depth1 .gnb02 ul').is(':hidden')) {} 
          else {
             jQuery('.pc_gnb .depth1 .gnb02 ul').css('display', 'block').slideUp('slow');
          }
      });
      
      jQuery('.pc_gnb .depth1 .gnb05').hover(function() { // .pc_gnb > .depth1 > gnb05 class에 Mouse On 이벤트를 겁니다.
         setTimeoutConst = setTimeout(function() {jQuery('.pc_gnb .depth1 .gnb05 ul').slideDown('slow').css('display', 'block'); }, delay);
        }, function() {
          clearTimeout(setTimeoutConst);
          if (jQuery('.pc_gnb .depth1 .gnb05 ul').is(':hidden')) {} 
          else {
             jQuery('.pc_gnb .depth1 .gnb05 ul').css('display', 'block').slideUp('slow');
          }
      });
      
      jQuery('.pc_gnb .depth1 .gnb07').hover(function() { // .pc_gnb > .depth1 > gnb05 class에 Mouse On 이벤트를 겁니다.
         setTimeoutConst = setTimeout(function() {jQuery('.pc_gnb .depth1 .gnb07 ul').slideDown('slow').css('display', 'block'); }, delay);
        }, function() {
          clearTimeout(setTimeoutConst);
          if (jQuery('.pc_gnb .depth1 .gnb07 ul').is(':hidden')) {} 
          else {
             jQuery('.pc_gnb .depth1 .gnb07 ul').css('display', 'block').slideUp('slow');
          }
      });
      
      jQuery('.pc_gnb .depth1 .gnb97').hover(function() { 
         setTimeoutConst = setTimeout(function() {jQuery('.pc_gnb .depth1 .gnb97 ul').slideDown('slow').css('display', 'block'); }, delay);
        }, function() {
          clearTimeout(setTimeoutConst);
          if (jQuery('.pc_gnb .depth1 .gnb97 ul').is(':hidden')) {} 
          else {
             jQuery('.pc_gnb .depth1 .gnb97 ul').css('display', 'block').slideUp('slow');
          }
      });
      
      jQuery('.pc_gnb .depth1 .gnb98').hover(function() { 
         setTimeoutConst = setTimeout(function() {jQuery('.pc_gnb .depth1 .gnb98 ul').slideDown('slow').css('display', 'block'); }, delay);
        }, function() {
          clearTimeout(setTimeoutConst);
          if (jQuery('.pc_gnb .depth1 .gnb98 ul').is(':hidden')) {} 
          else {
             jQuery('.pc_gnb .depth1 .gnb98 ul').css('display', 'block').slideUp('slow');
          }
      });
      
    }); 
  /* PC 버전 Menu 끝 */
  </script> 
  
   <%-- 멤버 로그인 / 등록 처리 시작 --%>
  <script type="text/javascript">
       
      $(function(){   // 자동 실행
        /* btn_home 버튼 event */
        $('#btn_home').on('click', function() {
          location.href="${pageContext.request.contextPath}/index.do";
        });
      });
      
      /* default access to Login */
      function loadDefault() {
       $('#id').val('crm');
       $('#passwd').val('1234');
      }  

      /*  CREATE AN ACCOUNT */
      $(function(){   // 자동 실행
        $('#btn_checkID').on('click', checkID); // id가 "btn_checkID"인 태그를 클릭하면"checkID"라는 함수 호출
        $('#btn_close').on('click', setFocus); // id가 "btn_close"인 태그를 클릭하면"setFocus"라는 함수 호출
        $('#btn_send').on('click', send);   // id가 "btn_send"인 태그를 클릭하면"send"라는 함수 호출
      });
         
      function setFocus() { 
        var tag = $('#btn_close').attr('data-focus'); // 포커스를 적용할 태그 id 가져오기
        $('#' + tag).focus(); // 포커스 지정
      }
      
      // jQuery ajax 요청
      function checkID() {
        // $('#btn_close').attr("data-focus", "이동할 태그 지정");
        
        var frm = $('#frm_member'); //  frm_member 태그 검색
        var id = $('#id', frm).val(); // "frm_member"폼에서 id='m_id' 태그 검색
        var params = '';
        var msg = '';
      
        if ($.trim(id).length == 0) { // m_id를 입력받지 않은 경우
          msg = 'ID를 입력하세요.<br>ID 입력은 필수 입니다.<br>ID는 3자이상 권장합니다.';
          
          $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
          $('#modal_title').html('ID 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#checkIDModal').modal();              // checkIDModal modal 출력
          return false;
        } else {  // m_id 가 들어온 경우
          params = 'id=' + id;
          // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
          // alert('params: ' + params);
      
          $.ajax({
            url: './checkID.do', // Spring 실행, MemberCont 와 연동
            type: 'get',  // post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
              // alert(rdata);
              var msg = "";
              
              if (rdata.cnt > 0) {  // cnt == 1 , 아이디 중복인 경우
                $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
                msg = "이미 사용중인 아이디입니다.";
                $('#btn_close').attr('data-focus', 'id');  // m_id 에 focus 효과
              } else {  // cnt == 0, 중복 아이디 X
                $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
                msg = "멋진 아이디네요!";
                $('#btn_close').attr('data-focus', 'email'); 
                // $.cookie('checkId', 'TRUE'); // Cookie 기록
              }
              
              $('#modal_title').html('아이디 중복 체크'); // 알림창 제목 
              $('#modal_content').html(msg);             //  알림창 내용
              $('#checkIDModal').modal();                   //  checkIDModal modal 출력
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error: function(request, status, error) { // callback 함수
              var msg = 'ERROR\n';
              msg += 'request.status: '+request.status + '\n';
              msg += 'message: '+error;
              console.log(msg);
            }
          });
          
          // 처리중 출력
      /*     var gif = '';
          gif +="<div style='margin: 0px auto; text-align: center;'>";
          gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
          gif +="</div>";
          
          $('#panel2').html(gif);
          $('#panel2').show(); // 출력 */  
        }
      
      }     
      
      function send() { // 등록 처리
        
        // m_passwd와 m_passwd2의 val()가 일치하지 않으면 submit 중지
        if ($('#passwd').val() != $('#passwd2').val()) {
          var msg = '입력된 패스워드가 일치하지 않습니다.<br>';
          msg += "패스워드를 다시 입력해주세요.<br>"; 
          
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          $('#modal_title').html('패스워드 일치 여부  확인'); // 알림창 제목 
          $('#modal_content').html(msg);  // 알림창 내용
          $('#checkIDModal').modal();         // 알림창 출력
          
          $('#btn_close').attr('data-focus', 'm_passwd');  // id가 "btn_send"인 태그의 "data-focus"라는 속성에
                                                                     //  "m_passwd"의 value를 저장
          return false; // submit 중지
        } else {
          $('#frm_member').submit();  
        }
      }
</script>




</head>

<body>
