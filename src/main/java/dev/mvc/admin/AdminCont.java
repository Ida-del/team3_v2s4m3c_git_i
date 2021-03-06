package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCont {
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  public AdminCont(){
    System.out.println("--> AdminCont created.");
  }
  
  /**
   * �α����� �����ڸ� ��� ���� ����
   * @return
   */
  @RequestMapping(value="/adm/admin/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if(adminProc.isAdmin(session)) {
      List<AdminVO> list = this.adminProc.list();
      mav.addObject("list", list);
      mav.setViewName("/adm/admin/list");  // /webapp//adm/admin/list.jsp
    } else {
      mav.setViewName("redirect:/adm/admin/login_need.jsp");
    }  
    return mav;
  }

  /**
   * �α��� ��
   * @return
   */
  // http://localhost:9090/team3/adm/admin/login.do 
  @RequestMapping(value = "/adm/admin/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login_cookie(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    
    String ck_adm_id = ""; // id ����
    String ck_adm_id_save = ""; // id ���� ���� checkbox
    String ck_adm_passwd = ""; // passwd ����
    String ck_adm_passwd_save = ""; // passwd ���� ���� checkbox
    
    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
        if (cookie.getName().equals("ck_adm_id")){
          ck_adm_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_adm_id_save")){
          ck_adm_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_adm_passwd")){
          ck_adm_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_adm_passwd_save")){
          ck_adm_passwd_save = cookie.getValue();  // Y, N
        }
      }  // End for
    }  // End if
    
    mav.addObject("ck_adm_id", ck_adm_id); 
    mav.addObject("ck_adm_id_save", ck_adm_id_save);
    mav.addObject("ck_adm_passwd", ck_adm_passwd);
    mav.addObject("ck_adm_passwd_save", ck_adm_passwd_save);
    
    mav.setViewName("/adm/admin/login_ck_form");
    
    return mav;
  }

  
  /**
   * ��Ű���+�α��� ó��
   * @param request
   * @param response
   * @param session
   * @param adm_id
   * @param adm_passwd
   * @param adm_id_save
   * @param adm_passwd_save
   * @return
   */
  @RequestMapping(value = "/adm/admin/login.do", method = RequestMethod.POST)
  public ModelAndView login_cookie_proc(
                           HttpServletRequest request,
                           HttpServletResponse response,
                           HttpSession session,
                           String adm_id, String adm_passwd,
                           @RequestParam(value="adm_id_save", defaultValue="") String adm_id_save,
                           @RequestParam(value="adm_passwd_save", defaultValue="") String adm_passwd_save) {
    
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("adm_id", adm_id);
    map.put("adm_passwd", adm_passwd);
    
    int cnt = this.adminProc.login(map);
    
    if(cnt==1) {
      System.out.println(adm_id+"Login Success");
      AdminVO adminVO = this.adminProc.readById(adm_id);
      session.setAttribute("adm_no", adminVO.getAdm_no());
      session.setAttribute("adm_id", adm_id);
      session.setAttribute("adm_name", adminVO.getAdm_name());
      // -------------------------------------------------------------------
      // adm_id ���� ��� ����
      // -------------------------------------------------------------------
      if (adm_id_save.equals("Y")) { // id�� ������ ���, Checkbox�� üũ�� ���
        Cookie ck_adm_id = new Cookie("ck_adm_id", adm_id);
        ck_adm_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
        response.addCookie(ck_adm_id); // ���� ����
      } else { // N, id�� �������� �ʴ� ���, Checkbox�� üũ ������ ���
        Cookie ck_adm_id = new Cookie("ck_adm_id", "");
        ck_adm_id.setMaxAge(0);
        response.addCookie(ck_adm_id); // ���� ����
      }
      // id�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_adm_id_save = new Cookie("ck_adm_id_save", adm_id_save);
      ck_adm_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_adm_id_save);  // adm_id cookie ����
      // -------------------------------------------------------------------
      
      // -------------------------------------------------------------------
      // Password ���� ��� ����
      // -------------------------------------------------------------------
      if (adm_passwd_save.equals("Y")) { // �н����� ������ ���
        Cookie ck_adm_passwd = new Cookie("ck_adm_passwd", adm_passwd);
        ck_adm_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_adm_passwd);
      } else { // N, �н����带 �������� ���� ���
        Cookie ck_adm_passwd = new Cookie("ck_adm_passwd", "");
        ck_adm_passwd.setMaxAge(0);
        response.addCookie(ck_adm_passwd);
      }
      // passwd�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_adm_passwd_save = new Cookie("ck_adm_passwd_save", adm_passwd_save);
      ck_adm_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_adm_passwd_save);
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/adm/index.do");         
    } else {
      mav.setViewName("redirect:/adm/admin/login_fail_msg.jsp");
    }
    return mav;
  }
   
  /**
   * �α׾ƿ� ó��
   * @param session
   * @return
   */
  @RequestMapping(value="/adm/admin/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����
    
    mav.setViewName("redirect:/adm/admin/logout_msg.jsp");
    
    return mav;
    
  }
  
  
  
  
  
  
  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
   * @param url
   * @return
   */
  @RequestMapping(value="/adm/admin/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/adm/admin/" + url); // forward
    
    return mav; // forward
  }

  
  
  
  
  
  
  
}


