package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {

  /**
   * 동일한 상품 레코드 검사
   * @param cartVO
   * @return
   */
  public int checkEBNO(CartVO cartVO);
  
  /**
   * 쇼핑카트에 담기
   * @param cartVO
   * @return
   */
  public int create(CartVO cartVO);
  
  // 목록
  public List<CartVO> list(String user_id);
  
  // 조회
  public CartVO read(int cart_no);
  
  // 삭제
  public int delete(CartVO cartVO);
  
  // 사용자별 상품 레코드 수
  public int record_count(String user_id);
  
  
  
  
  
  
}
