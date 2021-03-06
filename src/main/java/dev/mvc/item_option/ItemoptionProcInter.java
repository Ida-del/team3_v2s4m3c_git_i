package dev.mvc.item_option;

import java.util.HashMap;
import java.util.List;

public interface ItemoptionProcInter {

  // 선지 생성
  public int create(ItemoptionVO itemoptionVO);
  
  // 문항별 선택지(보기) 리스트
 public List<ItemoptionVO> list_seqno_asc(int item_no);
 
  // 조회
  public ItemoptionVO read(int option_no);
  
  // 수정 처리
  public int update(HashMap<String, Object> map);
  
  // 삭제 처리
  public int delete(int option_no);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
