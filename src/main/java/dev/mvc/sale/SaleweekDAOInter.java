package dev.mvc.sale;

import java.util.HashMap;
import java.util.List;



public interface SaleweekDAOInter {

  /**
   * ���
   */
  public int create(SaleweekVO saleWeekVO);
   
  
  /**
   *  ī�װ� �׷쿡���� ī�װ� ����� ���
   * <xmp>
   *   <select id="list_eventno_asc" parameterType="SaleweekVO">
   *     <select id="list_saleno_asc" parameterType="SaleweekVO"> 
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<SaleweekVO> list_eventno_asc(int saleno);
  
  /**
   * Ư�� ī�װ��� ��� 
   * <xmp>
   * <select id="list_all" resultType="ContentsVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<SaleweekVO> list_by_eventno(int eventno);
  
  /**
   * Ư�� ī�װ��� ��� 
   */
  public List<SaleweekVO> list_saleno_asc();
  
  /**
   * ��ȸ
   */
   public SaleweekVO read(int saleno);
  
   /**
    * ������ ��ȸ
    * <xmp>
    *   <select id="read" resultType="CategrpVO" parameterType="int">
    * </xmp>  
    * @param categrpno
    * @return
    */
    public SaleweekVO read_update(int saleno);
   /**
    *  ���� 
    *  <update id="update" parameterType="SaleweekVO">
    */
   public int update(SaleweekVO saleweekVO);
   
   /**
    * �н����� �˻�
    * @param hashMap
    * @return
    */
   public int passwd_check(HashMap hashMap);
   
   /**
    * �̹������� ó��
    * @param contentsVO
    * @return
    */
   public int update_img(SaleweekVO saleweekVO);
}
