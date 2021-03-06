package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {

  /**
   * ������ ��ǰ ���ڵ� �˻�
   * @param cartVO
   * @return
   */
  public int checkEBNO(CartVO cartVO);
  
  /**
   * ����īƮ�� ���
   * @param cartVO
   * @return
   */
  public int create(CartVO cartVO);
  
  // ���
  public List<CartVO> list(String user_id);
  
  // ��ȸ
  public CartVO read(int cart_no);
  
  // ����
  public int delete(CartVO cartVO);
  
  // ����ں� ��ǰ ���ڵ� ��
  public int record_count(String user_id);
  
  
  
  
  
  
}
