package dev.mvc.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AdminProcInter  {
  
  public List<AdminVO> list();

  public AdminVO readById(String adm_id);
  
  /**
   * session�� ����� �α��ε� ������ �������� üũ
   * @param session
   * @return
   */
  public boolean isAdmin(HttpSession session);

  public int login(Map<String,Object> map);
  
  
  
  
  
  
}
   
 