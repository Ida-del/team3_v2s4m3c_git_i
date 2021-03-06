DROP TABLE item_answer CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TABLE survey CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

COMMIT;


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE MEMBER(
		M_NO                          		NUMBER(6)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		EMAIL                         		VARCHAR2(60)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
  CONSTRAINT SYS_C008370 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is 'ȸ��';
COMMENT ON COLUMN MEMBER.M_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.ID is '���̵�';
COMMENT ON COLUMN MEMBER.PASSWD is '�н�����';
COMMENT ON COLUMN MEMBER.MNAME is '����';
COMMENT ON COLUMN MEMBER.EMAIL is '�̸���';
COMMENT ON COLUMN MEMBER.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '�ּ�2';
COMMENT ON COLUMN MEMBER.MDATE is '������';

-- �÷� ����
ALTER TABLE survey
MODIFY (continueyn VARCHAR2(5));

-- �÷� �߰�
ALTER TABLE survey ADD seqno NUMBER(10) DEFAULT 1 NOT NULL;
ALTER TABLE survey_item ADD seqno NUMBER(10) DEFAULT 1 NOT NULL;

/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE survey(
		survey_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        seqno                               NUMBER(10)       NOT NULL,
		title                  		        VARCHAR2(100)		 NOT NULL,
		startdate                    		VARCHAR2(30)		 NOT NULL,
		enddate                      		VARCHAR2(30)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		continueyn                    		VARCHAR2(5)		 DEFAULT 'Y'		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
		survey_result                 		VARCHAR2(100)		 NULL                               
);

COMMENT ON TABLE survey is '��������';
COMMENT ON COLUMN survey.survey_no is '���� ��ȣ';
COMMENT ON COLUMN survey.title is '����';
COMMENT ON COLUMN survey.startdate is '������';
COMMENT ON COLUMN survey.enddate is '������';
COMMENT ON COLUMN survey.cnt is '���� �ο���';
COMMENT ON COLUMN survey.continueyn is '����';
COMMENT ON COLUMN survey.seqno is '����';
COMMENT ON COLUMN survey.survey_result is '�������';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '������ ����9', '2020-11-04', '2020-11-11', 1,'N','�������');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '������ ����10', '2020-12-04', '2021-1-11', 1,'N','�������');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '������ ����7', '2021-1-07', '2021-1-17', 1,'N','�������');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, survey_result)
VALUES(survey_seq.nextval, '������ ����8', '2021-1-22', '2021-2-11', 1, '�������');

--���
SELECT survey_no, title, startdate, enddate, cnt, continueyn, survey_result
FROM survey 
ORDER BY survey_no DESC;

commit;

--��ȸ
SELECT survey_no, title, startdate, enddate, cnt, continueyn, survey_result
FROM survey 
WHERE survey_no=11;

--����
UPDATE survey 
SET title='����TEST4', startdate='2020.01.10', enddate='2020.01.21', continueyn='Y'
WHERE survey_no=4;

-- continueyn ����
UPDATE survey
SET continueyn = 'N'
WHERE survey_no = 11;

--����
DELETE FROM survey
WHERE survey_no=12;

DROP TABLE survey_item CASCADE CONSTRAINTS;



-- �÷� �߰�
ALTER TABLE survey_item ADD rcnt NUMBER(10) DEFAULT 0 NOT NULL;

/**********************************/
/* Table Name: ���� �׸� */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
        rcnt                                NUMBER(10)       DEFAULT 0  NOT NULL,
  FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_item is '���� �׸�';
COMMENT ON COLUMN survey_item.survey_no is '���� ��ȣ';
COMMENT ON COLUMN survey_item.item_no is '���� �׸� ��ȣ';
COMMENT ON COLUMN survey_item.item_title is '���� �׸� ����';
COMMENT ON COLUMN survey_item.seqno is '����';

DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(2, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(3, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(4, surveyitem_seq.nextval, 'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(5, surveyitem_seq.nextval, 'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval, '1');


--���
SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
WHERE survey_no=6
ORDER BY item_no;

commit;

--��ȸ
SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE item_no=2;

--����
UPDATE survey_item 
SET item_title='�� ����Ʈ�� ���������� �̿��� ������ �����ʴϱ�?', seqno=2
WHERE item_no=2;

--����
DELETE FROM survey_item
WHERE item_no=7;

DELETE FROM survey_item;

-- ���� �� ����
UPDATE survey_item 
SET rcnt = rcnt + 1 
WHERE item_no=6;

-- ���� �� ����
UPDATE survey_item 
SET rcnt = rcnt - 1 
WHERE item_no=6;


DROP TABLE item_optioin CASCADE CONSTRAINTS;



/**********************************/
/* Table Name: �����׸� �亯 */
/**********************************/
CREATE TABLE item_option(
		option_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_no                 		    NUMBER(10)		 NOT NULL,
        option_name                              VARCHAR2(200)		 NOT NULL,
        seqno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (item_no) REFERENCES survey_item (item_no)
);

COMMENT ON TABLE item_option is '�����׸� ������';
COMMENT ON COLUMN item_option.option_no is '���� ��ȣ';
COMMENT ON COLUMN item_option.item_no is '�׸� ��ȣ';
COMMENT ON COLUMN item_option.option_name is '���� ����';
COMMENT ON COLUMN item_option.seqno is '����';

DROP SEQUENCE itemoption_seq;
CREATE SEQUENCE itemoption_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

-- ���
INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 2, '��',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 2,'�ƴϿ�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1,'�����̴�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '�׷� ���̴�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '�ſ� �׷���',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '���� �׷��� �ʴ�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '�׷��� ���� ���̴�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '�����̴�',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '�׷� ���̴�',1);




-- �׸� ���� ���
SELECT option_no, item_no, option_name, seqno
FROM item_option 
WHERE item_no=2
ORDER BY item_no ASC, option_no ASC;

-- �׸� ���� ���
SELECT
     row_number() over(order by c.option_no asc) as r,
     c.option_no, c.item_no, c.option_name, c.seqno,
     e.item_title, e.survey_no, e.seqno
FROM item_option c
     INNER JOIN survey_item e
     ON c.item_no = e.item_no   
     WHERE c.item_no = '2';
     

commit;

--��ȸ
SELECT  option_no, item_no, option_name, seqno
FROM item_option
WHERE  option_no=1;

--����
UPDATE item_option 
SET option_name='�ƴϿ�', seqno=2
WHERE option_no=2;


--����
DELETE FROM item_option
WHERE option_no=9;  
  
DELETE FROM item_option;   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
