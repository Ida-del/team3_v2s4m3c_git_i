package dev.mvc.event;

/*CREATE TABLE event(
    eventno                           NUMBER(10)     NOT NULL    PRIMARY KEY, 
    name                              VARCHAR2(300)    NOT NULL,
    whatevent                       VARCHAR2(2000)     NOT NULL, -- �̺�Ʈ ���� ������
    saleno                            NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL
);*/
public class EventVO {
private int eventno = 0;
/**�̺�Ʈ ���������� ��ȣ*/
private String name ="";
/**�̺�Ʈ �̸�*/
private int saleno = 0;
/**�̺�Ʈ ���� ��ȣ*/
private String whatevent = "";
private String rdate = "";
/**�̺�Ʈ ������ */
public int getEventno() {
  return eventno;
}
public void setEventno(int eventno) {
  this.eventno = eventno;
}
public String getName() {
  return name;
}
public void setName(String name) {
  this.name = name;
}
public int getSaleno() {
  return saleno;
}
public void setSaleno(int saleno) {
  this.saleno = saleno;
}

public String getWhatevent() {
  return whatevent;
}
public void setWhatevent(String whatevent) {
  this.whatevent = whatevent;
}
public String getRdate() {
  return rdate;
}
public void setRdate(String rdate) {
  this.rdate = rdate;
}


}
