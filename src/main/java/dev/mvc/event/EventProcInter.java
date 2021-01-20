package dev.mvc.event;

import java.util.List;

public interface EventProcInter {

  
  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * 
   * </Xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(EventVO eventVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<EventVO> list_eventno_asc();
  
  /**
   * ��ȸ
   */
  public EventVO read(int eventno);
  
  /**
   * ����
   */
   public int update(EventVO eventVO);
   
   /**
    * ���� ó�� 
    */
    public int delete(int eventno); 
}

