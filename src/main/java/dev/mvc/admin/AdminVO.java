package dev.mvc.admin;
/*
    adm_no                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    adm_id                            VARCHAR2(50)     NOT NULL,
    adm_passwd                        VARCHAR2(60)     NOT NULL,
    adm_name                          VARCHAR2(80)     NULL,
    adm_rdate                             DATE  NOT NULL 
 */

public class AdminVO {
  /* 관리자 번호   */
  private int adm_no;
  /* 관리자 아이디  */
  private String adm_id;
  /*  비밀번호 */
  private String adm_passwd;
  /*  관리자명  */
  private String adm_name; 
  /* 생성일자  */
  private String adm_rdate;
  
  
  public int getAdm_no() {
    return adm_no;
  }
  public void setAdm_no(int adm_no) {
    this.adm_no = adm_no;
  }
  public String getAdm_id() {
    return adm_id;
  }
  public void setAdm_id(String adm_id) {
    this.adm_id = adm_id;
  }
  public String getAdm_passwd() {
    return adm_passwd;
  }
  public void setAdm_passwd(String adm_passwd) {
    this.adm_passwd = adm_passwd;
  }
  public String getAdm_name() {
    return adm_name;
  }
  public void setAdm_name(String adm_name) {
    this.adm_name = adm_name;
  }
  public String getAdm_rdate() {
    return adm_rdate;
  }
  public void setAdm_rdate(String adm_rdate) {
    this.adm_rdate = adm_rdate;
  }

  
  
  
}
