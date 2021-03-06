package dev.mvc.admin;

import java.util.List;
import java.util.Map;

public interface AdminDAOInter {

  
  public List<AdminVO> list();
  
  public AdminVO readById(String adm_id);
  
  public int login(Map<String,Object> map);

}
