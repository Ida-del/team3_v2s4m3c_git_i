package dev.mvc.item_option;

import java.util.HashMap;
import java.util.List;

public interface ItemoptionProcInter {

  // ���� ����
  public int create(ItemoptionVO itemoptionVO);
  
  // ���׺� ������(����) ����Ʈ
 public List<ItemoptionVO> list_seqno_asc(int item_no);
 
  // ��ȸ
  public ItemoptionVO read(int option_no);
  
  // ���� ó��
  public int update(HashMap<String, Object> map);
  
  // ���� ó��
  public int delete(int option_no);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
