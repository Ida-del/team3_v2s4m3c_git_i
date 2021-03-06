package dev.mvc.order_req;

import java.util.HashMap;
import java.util.List;

public interface OrderreqProcInter {

  // 등록
  /**
   * 주문 등록
   * @param orderreqVO
   * @return
   */
  public int create(OrderreqVO orderreqVO);
  
  // 목록
  public List<OrderreqVO> list_all();
  
  // 회원페이지: 목록
  public List<OrderreqVO> list_by_userid(String user_id);
  
  // 조회
  /**
   * 주문 조회
   * @param order_no
   * @return
   */
  public OrderreqVO read(int order_no);
  
  // 삭제
  public int delete(int order_no);
  
  /**
   * 사용자별 검색 목록
   * @param hashMap
   * @return
   */
  public List<OrderreqVO> list_by_userid_search(HashMap<String, Object> hashMap);
  
  /**
   * 사용자별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  
  
  
  
}
