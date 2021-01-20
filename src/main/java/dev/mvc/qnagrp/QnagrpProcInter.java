package dev.mvc.qnagrp;

import java.util.List;

public interface QnagrpProcInter {
 
  /**
   * <Xmp>
   * qna �׷� ���
   * 
   * </Xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(QnagrpVO qnagrpVO); 
  
  /**
   * ���
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<QnagrpVO> list_qnagrpno_asc();
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(QnagrpVO qnagrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int cnagrpno);
}
