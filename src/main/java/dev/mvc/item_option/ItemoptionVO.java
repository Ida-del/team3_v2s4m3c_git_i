package dev.mvc.item_option;

/*
 
CREATE TABLE item_option(
    option_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    item_no                         NUMBER(10)     NOT NULL,
    option_name                              VARCHAR2(200)    NOT NULL,
    seqno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (item_no) REFERENCES survey_item (item_no)
); 
 
 */
public class ItemoptionVO {

  private int option_no;  // 항목 선택지 번호
  private int item_no;  // 항목 번호
  private int seqno;   // 순서
  private String option_name="";  // 선택지 내용
  
  
  
  
  public int getOption_no() {
    return option_no;
  }
  public void setOption_no(int option_no) {
    this.option_no = option_no;
  }
  public int getItem_no() {
    return item_no;
  }
  public void setItem_no(int item_no) {
    this.item_no = item_no;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getOption_name() {
    return option_name;
  }
  public void setOption_name(String option_name) {
    this.option_name = option_name;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}
