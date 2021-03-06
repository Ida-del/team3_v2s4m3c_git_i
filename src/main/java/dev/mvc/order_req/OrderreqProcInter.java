package dev.mvc.order_req;

import java.util.HashMap;
import java.util.List;

public interface OrderreqProcInter {

  // ���
  /**
   * �ֹ� ���
   * @param orderreqVO
   * @return
   */
  public int create(OrderreqVO orderreqVO);
  
  // ���
  public List<OrderreqVO> list_all();
  
  // ȸ��������: ���
  public List<OrderreqVO> list_by_userid(String user_id);
  
  // ��ȸ
  /**
   * �ֹ� ��ȸ
   * @param order_no
   * @return
   */
  public OrderreqVO read(int order_no);
  
  // ����
  public int delete(int order_no);
  
  /**
   * ����ں� �˻� ���
   * @param hashMap
   * @return
   */
  public List<OrderreqVO> list_by_userid_search(HashMap<String, Object> hashMap);
  
  /**
   * ����ں� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  
  
  
  
}
