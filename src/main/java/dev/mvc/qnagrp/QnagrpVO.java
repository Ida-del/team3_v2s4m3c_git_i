package dev.mvc.qnagrp;

public class QnagrpVO {
  /*CREATE TABLE qnagrp(
      qnagrpno NUMBER(10) NOT NULL PRIMARY KEY,
      name VARCHAR2(50) NOT NULL,
      seqno NUMBER(7) DEFAULT 0 NOT NULL,
      visible CHAR(1) DEFAULT 'Y' NOT NULL,
      rdate DATE NOT NULL
  );*/
  /** ť������ �׷� ��ȣ */
   private int qnagrpno =0;
     /**�̺�Ʈ �̸�  */
    private String name ="";
    /** ��� ��ȣ */
   private int seqno =0;
   /**��� ����,����  */
  private String visible ="";
  /**��¥  */
  private String rdate ="";
  
  public int getQnagrpno() {
    return qnagrpno;
  }
  public void setQnagrpno(int qnagrpno) {
    this.qnagrpno = qnagrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }


  
}
