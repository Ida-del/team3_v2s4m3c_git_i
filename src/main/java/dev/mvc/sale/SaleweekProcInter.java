package dev.mvc.sale;

import java.util.HashMap;
import java.util.List;





public interface SaleweekProcInter {

  /**
   * ���
   */
  public int create(SaleweekVO saleweekVO);
  
  /*
   * a���
   */
  public List<SaleweekVO> list_saleno_asc();
  
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
   * ��ȸ
   */
   public SaleweekVO read(int saleno);
   
   /**
    *  ���� ó��
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
    * Ư�� ī�װ��� ��� 
    * @return ���ڵ� ���
    */
   public List<SaleweekVO> list_by_eventno(int eventno);
/**
 * �̹��� ���
 * @param contentsVO
 * @return
 */
public int img_create(SaleweekVO saleweekVO);

/**
 * �̹��� ����
 * @param contentsVO
 * @return
 */
public int img_update(SaleweekVO saleweekVO);

/**
 * �̹��� ����
 * @param contentsVO
 * @return
 */
public int img_delete(SaleweekVO saleweekVO);

}