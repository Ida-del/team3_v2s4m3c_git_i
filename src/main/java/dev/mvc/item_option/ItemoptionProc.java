package dev.mvc.item_option;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.item_option.ItemoptionProc")
public class ItemoptionProc implements ItemoptionProcInter{

  @Autowired
  private ItemoptionDAOInter itemoptionDAO;
  
  public ItemoptionProc() {
    System.out.println( "--> ItemoptionProc created." );
  }

  // ������(����) ����
  @Override
  public int create(ItemoptionVO itemoptionVO) {
    int cnt = this.itemoptionDAO.create(itemoptionVO);
    return cnt;
  }

  // ���׺� ���� ����Ʈ
  @Override
  public List<ItemoptionVO> list_seqno_asc(int item_no) {
    List<ItemoptionVO> list = this.itemoptionDAO.list_seqno_asc(item_no);
    return list;
  }

  
  // ��ȸ
  @Override
  public ItemoptionVO read(int option_no) {
    ItemoptionVO itemoptionVO = this.itemoptionDAO.read(option_no);
    return itemoptionVO;
  }

  // ���� ó��
  @Override
  public int update(HashMap<String, Object> map) {
    int cnt = this.itemoptionDAO.update(map);
    return cnt;
  }

  //  ���� ó��
  @Override
  public int delete(int option_no) {
    int cnt = this.itemoptionDAO.delete(option_no);
    return cnt;
  }

}
