package dev.mvc.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AdminProcInter  {
  
  public List<AdminVO> list();

  public AdminVO readById(String adm_id);
  
  /**
   * session을 사용해 로그인된 관리자 계정인지 체크
   * @param session
   * @return
   */
  public boolean isAdmin(HttpSession session);

  public int login(Map<String,Object> map);
  
  
  
  
  
  
}
   
 