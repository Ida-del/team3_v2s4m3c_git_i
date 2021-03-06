DROP TABLE item_answer CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TABLE survey CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: ���� �׸� */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
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
VALUES(6, surveyitem_seq.nextval, 'item1');


--���
SELECT survey_no, item_no, item_title
FROM survey_item 
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title
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



DROP TABLE item_answer CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �����׸� �亯 */
/**********************************/
CREATE TABLE item_answer(
		answer_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_no                 		    NUMBER(10)		 NOT NULL,
        answer                              VARCHAR2(200)		 NOT NULL,
        seqno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (item_no) REFERENCES survey_item (item_no)
);

COMMENT ON TABLE item_answer is '�����׸� ������';
COMMENT ON COLUMN item_answer.answer_no is '���� ��ȣ';
COMMENT ON COLUMN item_answer.item_no is '�׸� ��ȣ';
COMMENT ON COLUMN item_answer.answer is '���� ����';
COMMENT ON COLUMN item_answer.seqno is '����';

DROP SEQUENCE itemanswer_seq;
CREATE SEQUENCE itemanswer_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

-- ���
INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 2, '��',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 2,'�ƴϿ�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1,'�����̴�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '�׷� ���̴�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '�ſ� �׷���',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '���� �׷��� �ʴ�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '�׷��� ���� ���̴�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '�����̴�',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '�׷� ���̴�',1);




-- �׸� ���� ���
SELECT answer_no, item_no, answer, seqno
FROM item_answer 
WHERE item_no=2
ORDER BY item_no ASC, answer_no ASC;

-- �׸� ���� ���
SELECT
     row_number() over(order by c.answer_no asc) as r,
     c.answer_no, c.item_no, c.answer, c.seqno,
     e.item_title, e.survey_no, e.seqno
FROM item_answer c
     INNER JOIN survey_item e
     ON c.item_no = e.item_no   
     WHERE c.item_no = '2';
     

commit;

--��ȸ
SELECT  answer_no, item_no, answer, seqno
FROM item_answer
WHERE  answer_no=1;

--����
UPDATE item_answer 
SET answer='�ƴϿ�', seqno=2
WHERE answer_no=2;


--����
DELETE FROM item_answer
WHERE answer_no=9;  
  
DELETE FROM item_answer;   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
