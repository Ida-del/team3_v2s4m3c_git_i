package dev.mvc.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {
  
  @Autowired
  private AdminDAOInter adminDAO; 

  public AdminProc() {
    System.out.println("--> AdminProc created.");
  }
  
  @Override
  public List<AdminVO> list() {
    List<AdminVO> list = this.adminDAO.list();
    return list;
  }

  @Override
  public AdminVO readById(String adm_id) {
    AdminVO adminVO = this.adminDAO.readById(adm_id);
    return adminVO;
  }

  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.adminDAO.login(map);
    return cnt;
  }
  
  @Override
  public boolean isAdmin(HttpSession session){
    boolean sw = false;   // 로그인하지 않은 것으로 초기화
    
    String adm_id = (String)session.getAttribute("adm_id");
    
    if (adm_id != null){
      sw = true;
    }
    return sw;
  }




  
}


