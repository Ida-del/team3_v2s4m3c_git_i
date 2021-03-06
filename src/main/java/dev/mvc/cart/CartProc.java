package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cart.CartProc")
public class CartProc implements CartProcInter {

  @Autowired
  private CartDAOInter cartDAO;
  
  public CartProc() {
    System.out.println("--> CartProc created");
  }

  
  // 동일한 상품 레코드 검사
  @Override
  public int checkEBNO(CartVO cartVO) {
    int cnt = this.cartDAO.checkEBNO(cartVO);
    return cnt;
  }
  
  // 카트 등록
  @Override
  public int create(CartVO cartVO) {
    int cnt = this.cartDAO.create(cartVO);
    return cnt;
  }

  // 카트 리스트
  @Override
  public List<CartVO> list(String user_id) {
    List<CartVO> list = this.cartDAO.list(user_id);
    return list;
  }

  // 조회
  @Override
  public CartVO read(int cart_no) {
    CartVO cartVO = this.cartDAO.read(cart_no);
    return cartVO;
  }
  
  // 카트 삭제
  @Override
  public int delete(CartVO cartVO) {
    int cnt = this.cartDAO.delete(cartVO);
    return cnt;
  }

  // 사용자별 상품 레코드 수
  @Override
  public int record_count(String user_id) {
    int count = this.cartDAO.record_count(user_id);
    return count;
  }






  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
}
